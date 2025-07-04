import 'dart:io';

import 'package:crimes/util/key_utils.dart';
import 'package:crimes/util/string_utils.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/services.dart';
import 'package:geolocator/geolocator.dart';

class DeviceInformationUtils {
  static Future<DeviceInfoDto> getDeviceIdentifier() async {
    DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();
    DeviceInfoDto deviceInfoDto = DeviceInfoDto();

    String? deviceUdid = '';
    String? deviceName = '';
    String? brand = '';
    String? osName = '';
    String? osVersion = '';
    String? buildNumber = '';
    String? manufacturer = '';
    String? model = '';

    try {
      if (Platform.isAndroid) {
        var deviceInfo = await deviceInfoPlugin.androidInfo;

        StringUtils.log('========= ANDROID INFO ==========');
        StringUtils.log('version.securityPatch: ${deviceInfo.version.securityPatch}');
        StringUtils.log('version.sdkInt: ${deviceInfo.version.sdkInt}');
        StringUtils.log('version.release: ${deviceInfo.version.release}');
        StringUtils.log('version.previewSdkInt: ${deviceInfo.version.previewSdkInt}');
        StringUtils.log('version.incremental: ${deviceInfo.version.incremental}');
        StringUtils.log('version.codename: ${deviceInfo.version.codename}');
        StringUtils.log('version.baseOS: ${deviceInfo.version.baseOS}');
        StringUtils.log('board: ${deviceInfo.board}');
        StringUtils.log('bootloader: ${deviceInfo.bootloader}');
        StringUtils.log('brand: ${deviceInfo.brand}');
        StringUtils.log('device: ${deviceInfo.device}');
        StringUtils.log('display: ${deviceInfo.display}');
        StringUtils.log('fingerprint: ${deviceInfo.fingerprint}');
        StringUtils.log('hardware: ${deviceInfo.hardware}');
        StringUtils.log('host: ${deviceInfo.host}');
        StringUtils.log('id: ${deviceInfo.id}');
        StringUtils.log('manufacturer: ${deviceInfo.manufacturer}');
        StringUtils.log('model: ${deviceInfo.model}');
        StringUtils.log('product: ${deviceInfo.product}');
        StringUtils.log('supported32BitAbis: ${deviceInfo.supported32BitAbis}');
        StringUtils.log('supported64BitAbis: ${deviceInfo.supported64BitAbis}');
        StringUtils.log('supportedAbis: ${deviceInfo.supportedAbis}');
        StringUtils.log('tags: ${deviceInfo.tags}');
        StringUtils.log('type: ${deviceInfo.type}');
        StringUtils.log('isPhysicalDevice: ${deviceInfo.isPhysicalDevice}');
        //StringUtils.log('androidId: ${deviceInfo.androidId}');
        StringUtils.log('systemFeatures: ${deviceInfo.systemFeatures}');
        StringUtils.log('serialNumber: ${deviceInfo.serialNumber}');
        StringUtils.log('=================================');

        deviceUdid = deviceInfo.id;
        deviceName = deviceInfo.device;
        brand = deviceInfo.brand;
        osName = deviceInfo.version.baseOS;
        osVersion = deviceInfo.version.codename;
        buildNumber = deviceInfo.serialNumber;
        manufacturer = deviceInfo.manufacturer;
        model = deviceInfo.model;

      } else if (Platform.isIOS) {
        var deviceInfo = await deviceInfoPlugin.iosInfo;

        StringUtils.log('========= IOS INFO ==========');
        StringUtils.log('name: ${deviceInfo.name}');
        StringUtils.log('systemName: ${deviceInfo.systemName}');
        StringUtils.log('systemVersion: ${deviceInfo.systemVersion}');
        StringUtils.log('model: ${deviceInfo.model}');
        StringUtils.log('localizedModel: ${deviceInfo.localizedModel}');
        StringUtils.log('identifierForVendor: ${deviceInfo.identifierForVendor}');
        StringUtils.log('isPhysicalDevice: ${deviceInfo.isPhysicalDevice}');
        StringUtils.log('utsname.sysname: ${deviceInfo.utsname.sysname}');
        StringUtils.log('utsname.nodename: ${deviceInfo.utsname.nodename}');
        StringUtils.log('utsname.release: ${deviceInfo.utsname.release}');
        StringUtils.log('utsname.version: ${deviceInfo.utsname.version}');
        StringUtils.log('utsname.machine: ${deviceInfo.utsname.machine}');
        StringUtils.log('=============================');

        deviceUdid = deviceInfo.identifierForVendor;
        deviceName = deviceInfo.name;
        brand = 'APPLE';
        osName = deviceInfo.systemName;
        osVersion = deviceInfo.systemVersion;
        buildNumber = deviceInfo.utsname.sysname;
        manufacturer = deviceInfo.utsname.machine;
        model = deviceInfo.model;

      }
    } on PlatformException {
    }

    if(deviceUdid==null || deviceUdid.isEmpty) deviceUdid = '-';
    if(deviceName==null || deviceName.isEmpty) deviceName = '-';
    if(brand==null || brand.isEmpty) brand = '-';
    if(osName==null || osName.isEmpty) osName = '-';
    if(osVersion==null || osVersion.isEmpty) osVersion = '-';
    if(buildNumber==null || buildNumber.isEmpty) buildNumber = '-';
    if(manufacturer==null || manufacturer.isEmpty) manufacturer = '-';
    if(model==null || model.isEmpty) model = '-';

    StringUtils.log('=================================');
    StringUtils.log('deviceUdid: $deviceUdid');
    StringUtils.log('deviceName: $deviceName');
    StringUtils.log('brand: $brand');
    StringUtils.log('osName: $osName');
    StringUtils.log('osVersion: $osVersion');
    StringUtils.log('buildNumber: $buildNumber');
    StringUtils.log('manufacturer: $manufacturer');
    StringUtils.log('model: $model');
    StringUtils.log('=================================');


    deviceInfoDto.deviceUdid = deviceUdid;
    deviceInfoDto.deviceName = deviceName;
    deviceInfoDto.brand = brand;
    deviceInfoDto.osName = osName;
    deviceInfoDto.osVersion = osVersion;
    deviceInfoDto.buildNumber = buildNumber;
    deviceInfoDto.manufacturer = manufacturer;
    deviceInfoDto.model = model;

    return deviceInfoDto;
  }

  static Future<Position> determinePosition() async {
    bool isMockUser = await KeyUtils.isMockUser();
    if(isMockUser){
      return Position(longitude: 0,latitude: 0, timestamp: DateTime.now(), accuracy: 0.0, altitude: 0.0, heading: 0.0, speed: 0.0, speedAccuracy: 0.0, altitudeAccuracy: 0.0, headingAccuracy: 0.0);
    }else{
      bool serviceEnabled;
      LocationPermission permission;

      serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) {
        throw Exception('Location services are disabled.');
      }

      permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.deniedForever) {
        throw Exception('Location permissions are permantly denied, we cannot request permissions.');
      }

      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission != LocationPermission.whileInUse &&
            permission != LocationPermission.always) {
          throw Exception('Location permissions are denied (actual value: $permission).');
        }
      }

      return await Geolocator.getCurrentPosition();
    }


  }
}

class DeviceInfoDto {
  DeviceInfoDto({
    this.deviceUdid,
    this.deviceName,
    this.brand,
    this.osName,
    this.osVersion,
    this.buildNumber,
    this.manufacturer,
    this.model,
  });

  String? deviceUdid;
  String? deviceName;
  String? brand;
  String? osName;
  String? osVersion;
  String? buildNumber;
  String? manufacturer;
  String? model;
}

