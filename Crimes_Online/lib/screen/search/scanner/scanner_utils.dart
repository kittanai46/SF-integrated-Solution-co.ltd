import 'dart:async';
import 'dart:typed_data';

import 'package:camera/camera.dart';
import 'package:crimes/util/string_utils.dart';
// import 'package:firebase_ml_vision/firebase_ml_vision.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class ScannerUtils {
  ScannerUtils._();

  static Future<CameraDescription> getCamera(CameraLensDirection dir) async {
    return await availableCameras().then(
          (List<CameraDescription> cameras) => cameras.firstWhere(
            (CameraDescription camera) => camera.lensDirection == dir,
      ),
    );
  }

  // static Future<dynamic> detectIOS({
  //   required CameraImage image,
  //   required Future<dynamic> Function(Map<String, dynamic> maps) detectInImage,
  //   required int imageRotation,
  // }) async {
  //   Uint8List? bytes = await _convertImage(image);
  //   Map<String, dynamic> maps = {
  //     'bytes': bytes
  //   };
  //   return detectInImage(maps);
  // }
  //
  // static Future<Uint8List?> _convertImage(CameraImage image) async {
  //   try {
  //     imglib.Image? img;
  //     if (image.format.group == ImageFormatGroup.yuv420) {
  //       // img = _convertYUV420(image);
  //     } else if (image.format.group == ImageFormatGroup.bgra8888) {
  //       // img = _convertBGRA8888(image);
  //     }
  //     if(img==null) return null;
  //
  //     img = _bakeOrientation(img);
  //     List<int> jpg = imglib.encodeJpg(img);
  //     Uint8List jpgBytes = Uint8List.fromList(jpg);
  //
  //     // // Convert to png
  //     // imglib.PngEncoder pngEncoder = new imglib.PngEncoder();
  //     // List<int> png = pngEncoder.encodeImage(img);
  //     // Uint8List pngBytes = Uint8List.fromList(png);
  //     // final imglib.Image capturedImage = imglib.decodeImage(pngBytes);
  //     // final imglib.Image orientedImage = _bakeOrientation(capturedImage);
  //     // List<int> jpg = imglib.encodeJpg(orientedImage);
  //     // Uint8List jpgBytes = Uint8List.fromList(jpg);
  //
  //     return jpgBytes;
  //   } catch (e) {
  //     StringUtils.log(">>>>>>>>>>>> ERROR:" + e.toString());
  //   }
  //   return null;
  // }
  //
  // static imglib.Image _bakeOrientation(imglib.Image image) {
  //   var bakedImage = imglib.Image.from(image);
  //   // if (!image.exif.hasOrientation || image.exif.orientation == 1) {
  //   //   return bakedImage;
  //   // }
  //
  //   // switch (image.exif.orientation) {
  //   //   case 2:
  //   //     return imglib.flipHorizontal(bakedImage);
  //   //   case 3:
  //   //     return imglib.flip(bakedImage, imglib.Flip.both);
  //   //   case 4:
  //   //     return imglib.flipHorizontal(imglib.copyRotate(bakedImage, 180));
  //   //   case 5:
  //   //     return imglib.flipHorizontal(imglib.copyRotate(bakedImage, 90));
  //   //   case 6:
  //   //return imglib.copyRotate(bakedImage, 90);
  //   return imglib.copyRotate(bakedImage, angle: 90);
  //   //   case 7:
  //   //     return imglib.flipHorizontal(imglib.copyRotate(bakedImage, -90));
  //   //   case 8:
  //   //     return imglib.copyRotate(bakedImage, -90);
  //   // }
  //   // return bakedImage;
  // }

// CameraImage YUV420_888 -> PNG -> Image (compresion:0, filter: none)
// Black
//   static Future<List<int>?> convertYUV420toImage(CameraImage image) async {
//
//     try {
//       final int width = image.width;
//       final int height = image.height;
//
//
//       // imgLib -> Image package from https://pub.dartlang.org/packages/image
//       var img = imglib.Image(width: width, height: height); // Create Image buffer
//
//       // Fill image buffer with plane[0] from YUV420_888
//       for(int x=0; x < width; x++) {
//         for(int y=0; y < height; y++) {
//           final pixelColor = image.planes[0].bytes[y * width + x];
//           // color: 0x FF  FF  FF  FF
//           //           A   B   G   R
//           // Calculate pixel color
//           if(img.data!=null){
//             img.data[y * width + x] = (0xFF << 24) | (pixelColor << 16) | (pixelColor << 8) | pixelColor;
//           }
//         }
//       }
//
//       // imglib.PngEncoder pngEncoder = new imglib.PngEncoder(level: 0, filter: 0);
//       imglib.PngEncoder pngEncoder = new imglib.PngEncoder(level: 0, filter: imglib.PngFilter.paeth);
//       //List<int> png = pngEncoder.encodeImage(img);
//       List<int> png = pngEncoder.encode(img);
//       // muteYUVProcessing = false;
//       return png; //Image.memory(png);
//     } catch (e) {
//       StringUtils.log(">>>>>>>>>>>> ERROR:" + e.toString());
//     }
//     return null;
//   }

// CameraImage BGRA8888 -> PNG
// Color
//   static imglib.Image _convertBGRA8888(CameraImage image) {
//     return imglib.Image.fromBytes(
//       width: image.width,
//       height: image.height,
//       bytes: image.planes[0].bytes,
//       format: imglib.Format.bgra,
//     );
//   }

// CameraImage YUV420_888 -> PNG -> Image (compresion:0, filter: none)
// Black
//   static imglib.Image _convertYUV420(CameraImage image) {
//     var img = imglib.Image(width: image.width, height: image.height); // Create Image buffer
//
//     Plane plane = image.planes[0];
//     const int shift = (0xFF << 24);
//
//     // Fill image buffer with plane[0] from YUV420_888
//     for (int x = 0; x < image.width; x++) {
//       for (int planeOffset = 0;
//       planeOffset < image.height * image.width;
//       planeOffset += image.width) {
//         final pixelColor = plane.bytes[planeOffset + x];
//         // color: 0x FF  FF  FF  FF
//         //           A   B   G   R
//         // Calculate pixel color
//         var newVal = shift | (pixelColor << 16) | (pixelColor << 8) | pixelColor;
//
//         img.data[planeOffset + x] = newVal;
//       }
//     }
//
//     return img;
//   }


  // static Future<dynamic> detectAndroid({
  //   required CameraImage image,
  //   required Future<dynamic> Function(FirebaseVisionImage image) detectInImage,
  //   required int imageRotation,
  // }) async {
  //   return detectInImage(
  //     FirebaseVisionImage.fromBytes(
  //       _concatenatePlanes(image.planes),
  //       _buildMetaData(image, _rotationIntToImageRotation(imageRotation)),
  //     ),
  //   );
  // }

  // static Uint8List _concatenatePlanes(List<Plane> planes) {
  //   final WriteBuffer allBytes = WriteBuffer();
  //   for (Plane plane in planes) {
  //     allBytes.putUint8List(plane.bytes);
  //   }
  //   return allBytes.done().buffer.asUint8List();
  // }

  // static FirebaseVisionImageMetadata _buildMetaData(
  //     CameraImage image,
  //     ImageRotation rotation,
  //     ) {
  //   return FirebaseVisionImageMetadata(
  //     rawFormat: image.format.raw,
  //     size: Size(image.width.toDouble(), image.height.toDouble()),
  //     rotation: rotation,
  //     planeData: image.planes.map(
  //           (Plane plane) {
  //         return FirebaseVisionImagePlaneMetadata(
  //           bytesPerRow: plane.bytesPerRow,
  //           height: plane.height,
  //           width: plane.width,
  //         );
  //       },
  //     ).toList(),
  //   );
  // }

  // static ImageRotation _rotationIntToImageRotation(int rotation) {
  //   switch (rotation) {
  //     case 0:
  //       return ImageRotation.rotation0;
  //     case 90:
  //       return ImageRotation.rotation90;
  //     case 180:
  //       return ImageRotation.rotation180;
  //     default:
  //       assert(rotation == 270);
  //       return ImageRotation.rotation270;
  //   }
  // }

}