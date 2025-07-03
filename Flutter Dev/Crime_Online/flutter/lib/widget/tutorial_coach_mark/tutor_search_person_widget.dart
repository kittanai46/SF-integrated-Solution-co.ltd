import 'package:crimes/widget/tutorial_coach_mark/tutor_search_person_enumkey.dart';
import 'package:crimes/widget/tutorial_coach_mark/tutor_utils.dart';
import 'package:crimes/widget/tutorial_coach_mark/tutorial_coach_mark_custom.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:tutorial_coach_mark/tutorial_coach_mark.dart';

class TutorSPersonWidget{
  final TutorSPerosnEnumKey mKey;
  final BuildContext mContext;
  final Function(TargetFocus)? onNextTarget;
  final Function? onFinish;
  final Function? onSkip;

  TutorialCoachMarkCustom? tutorialCoachMark;
  List<TargetFocus> targets = [];
  bool isTabTarget = false;
  TutorSPersonWidget({
    required this.mContext,
    required this.mKey,
    this.onNextTarget,
    this.onFinish,
    this.onSkip
  });

  void initTargets(){
    if(targets.length > 0){
      targets.clear();
    }
      targets.add(
        TargetFocus(
          identify: "Target 0",
          keyTarget: mKey.keyPersonScanCardId,
          color: Colors.black,
          enableOverlayTab: true,
          contents: [
            TargetContent(
              align: ContentAlign.bottom,
              child: Container(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "ระบบอ่านตัวเลขบัตรประชาชน",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 20.0),
                    ),
                    Padding(
                        padding: const EdgeInsets.only(top: 10.0),
                        child: Text(
                          "เปิดกล้องถ่ายรูปบัตรต่างๆ ที่มีเลข 13 หลัก อำนวยความสะดวกการพิมพ์เงื่อนไข หรือแตะที่ไอคอนกล้องถ่ายรูปเพื่อถ่ายภาพใบหน้า",
                          style: TextStyle(color: Colors.white),
                        )
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Container(
                        padding: EdgeInsets.fromLTRB(50, 30, 50, 32),
                        child: Image.asset('assets/images/smartcard02.png', fit: BoxFit.contain,),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
          shape: ShapeLightFocus.RRect,
          radius: 5,
        ),
      );
      targets.add(
        TargetFocus(
          identify: "Target 1",
          keyTarget: mKey.keyPersonParams1,
          color: Colors.black,
          enableOverlayTab: true,
          contents: [
            TargetContent(
              align: ContentAlign.top,
              child: Container(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "เงื่อนไขพื้นฐาน",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 20.0),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: Text(
                        "ระบุเงื่อนไขการสืบค้นจากเลขบัตร ปชช 13 หลัก หรือ ชื่อ นามสกุล",
                        style: TextStyle(color: Colors.white),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
          shape: ShapeLightFocus.RRect,
          radius: 5,
        ),
      );

      targets.add(
        TargetFocus(
          identify: "Target 2",
          keyTarget: mKey.keyPersonParams2,
          color: Colors.black,
          enableOverlayTab: true,
          contents: [
            TargetContent(
              align: ContentAlign.bottom,
              child: Container(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "เงื่อนไขเพิ่มเติมสำหรับข้อมูลของ ตม.",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 20.0),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "เลขบัตรต่างด้าว สำหรับค้น ที่พักแรงงานต่างด้าว",
                            style: TextStyle(color: Colors.white),
                          ),
                          Text(
                            "เลขพาสปอร์ต สำหรับค้น การเดินทางเข้าออกประเทศ",
                            style: TextStyle(color: Colors.white),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
          shape: ShapeLightFocus.RRect,
          radius: 5,
        ),
      );

      targets.add(
        TargetFocus(
          identify: "Target 3",
          keyTarget: mKey.keyPersonParams3,
          color: Colors.black,
          enableOverlayTab: true,
          contents: [
            TargetContent(
              align: ContentAlign.top,
              child: Container(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "เงื่อนไขเพิ่มเติมสำหรับข้อมูลของ กรมการขนส่งทางบก",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 20.0),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "ประเภทใบอนุญาตขับรถ สำหรับค้น ใบอนุญาตขับรถ",
                            style: TextStyle(color: Colors.white),
                          ),
                          Text(
                            "ประเภทใบอนุญาตขับรถ-ขนส่ง สำหรับค้น ใบอนุญาตขับรถขนส่ง",
                            style: TextStyle(color: Colors.white),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
          shape: ShapeLightFocus.RRect,
          radius: 5,
        ),
      );

    targets.add(
      TargetFocus(
        identify: "Target 3-1",
        keyTarget: mKey.keyPersonParams4,
        color: Colors.black,
        enableOverlayTab: true,
        contents: [
          TargetContent(
            align: ContentAlign.top,
            child: Container(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "เงื่อนไขเพิ่มเติมสำหรับข้อมูลของ กรมการปกครอง",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 20.0),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "หมายเลขทะเบียนอาวุธปืน สำหรับค้น ใบอนุญาต ป.4",
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          )
        ],
        shape: ShapeLightFocus.RRect,
        radius: 5,
      ),
    );

      targets.add(
        TargetFocus(
          identify: "Target 4",
          keyTarget: mKey.keyPersonActionClear,
          color: Colors.black,
          enableOverlayTab: true,
          contents: [
            TargetContent(
              align: ContentAlign.top,
              child: Container(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "ล้างเงื่อนไขทั้งหมด เพื่อระบุใหม่",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 18.0),
                    ),
                  ],
                ),
              ),
            )
          ],
          shape: ShapeLightFocus.RRect,
          radius: 5,
        ),
      );

      targets.add(
        TargetFocus(
          identify: "Target 5",
          keyTarget: mKey.keyPersonActionNext,
          color: Colors.black,
          enableOverlayTab: true,
          contents: [
            TargetContent(
              align: ContentAlign.top,
              child: Container(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "เมื่อระบุเงื่อนไขแล้ว กดปุ่ม ถัดไป เพื่อไปหน้าเลือกแหล่งข้อมูล",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 18.0),
                    ),
                  ],
                ),
              ),
            )
          ],
          shape: ShapeLightFocus.RRect,
          radius: 5,
        ),
      );
  }

  void showTutorial(BuildContext _context) async{
    final bool isRead = await TutorUtils.getTutorSPersonIsRead();
    if(isRead == false) {
      initTargets();
      if(targets.length > 0) {
        print('show TutorSPersonWidget');
        try {
          tutorialCoachMark = TutorialCoachMarkCustom(
            _context,
            targets: targets,
            colorShadow: Colors.white,
            textSkip: "ปิดการแนะนำ",
            paddingFocus: 10,
            opacityShadow: 0.92,
            onFinish: () {
              //print("finish");
                TutorUtils.saveTutorSPersonIsRead(true);
                onFinish!();
            },
            onClickTarget: (target) {
              isTabTarget = true;
              onNextTarget!(target);
            },
            onSkip: () {
              print("skip");
              TutorUtils.saveTutorSPersonIsRead(true);
              onSkip!();
            },
            onClickOverlay: (target) {
              isTabTarget = true;
              onNextTarget!(target);
            },
          )
            ..show();
        }catch(e){
          print(e);
        }
      }
    }
  }

  void close(){
    tutorialCoachMark?.close();
  }
}

