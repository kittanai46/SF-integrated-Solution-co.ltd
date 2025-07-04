import 'package:crimes/widget/tutorial_coach_mark/tutor_home_enumkey.dart';
import 'package:crimes/widget/tutorial_coach_mark/tutor_utils.dart';
import 'package:crimes/widget/tutorial_coach_mark/tutorial_coach_mark_custom.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:tutorial_coach_mark/tutorial_coach_mark.dart';

class TutorHomeWidget{
  final TutorHomeEnumKey mKey;
  final BuildContext mContext;

  TutorialCoachMarkCustom? tutorialCoachMark;
  List<TargetFocus> targets = [];
  bool isTabTarget = false;
  TutorHomeWidget({
    required this.mContext,
    required this.mKey,
  });

  void initTargets(){
      if(targets.length > 0){
        targets.clear();
      }
      targets.add(
        TargetFocus(
          identify: "Target 0",
          keyTarget: mKey.keyNoti,
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
                      "ข้อความแจ้งเตือน",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 20.0),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: Text(
                        "แจ้งเตือนข่าวสารต่างๆ , แจ้งเตือนหัวหน้าสถานี เช่น การขออนุมัติถอนหมาย , การขออนุมัติคัดสำเนาประจำวัน , หรือข้อมูลสำคัญ",
                        style: TextStyle(color: Colors.white),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      );
      targets.add(
        TargetFocus(
          identify: "Target 1",
          keyTarget: mKey.keyMenu,
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
                      "ข้อมูลส่วนตัวและการตั้งค่า",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 20.0),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: Text(
                        "รายละเอียดสิทธิ์ที่ท่านได้รับเข้าถึงแหล่งข้อมูล , ตั้งค่าการเข้าใช้งาน",
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
          keyTarget: mKey.keyFavourite,
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
                      "ตั้งค่ารายการโปรด",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 20.0),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: Text(
                        "ท่านสามารถตั้งค่าการค้นหาที่ใช้เป็นประจำ เพื่อความสะดวกรวดเร็วในการสืบค้นครั้งหน้า",
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
          identify: "Target 3",
          keyTarget: mKey.keyInfomation,
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
                      "ข่าวประชาสัมพันธ์",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 20.0),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: Text(
                        "แหล่งรวบรวมข้อมูลข่าวสารของสำนักงานตำรวจแห่งชาติ",
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
          identify: "Target 4",
          keyTarget: mKey.keyDataSource,
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
                      "แหล่งข้อมูลการสืบค้น",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 20.0),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: Text(
                        "เมนูหลักระบบการสืบค้น CRIMES Online ได้แก่ ข้อมูลบุคคล ยานพาหนะ และข้อมูลดคี",
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
          identify: "Target 5",
          keyTarget: mKey.keyScanCardId,
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
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Container(
                        padding: EdgeInsets.fromLTRB(50, 80, 50, 32),
                        child: Image.asset('assets/images/smartcard02.png', fit: BoxFit.contain,),
                      ),
                    ),
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
                          "เปิดกล้องถ่ายรูปบัตรต่างๆ ที่มีเลข 13 หลัก อำนวยความสะดวกการพิมพ์เงื่อนไข",
                          style: TextStyle(color: Colors.white),
                        )
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
  }

  void showTutorial(BuildContext _context) async{
    final bool isRead = await TutorUtils.getTutorHomeIsRead();
    if(isRead == false) {
      initTargets();
      if(targets.length > 0){
        print('call show TutorHomeWidget');
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
              TutorUtils.saveTutorHomeIsRead(true);
            },
            onClickTarget: (target) {
              isTabTarget = true;
              //print('onClickTarget: $target');
            },
            onSkip: () {
              //print("skip");
              TutorUtils.saveTutorHomeIsRead(true);
            },
            onClickOverlay: (target) {
              isTabTarget = true;
              //print('onClickOverlay: $target');
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

