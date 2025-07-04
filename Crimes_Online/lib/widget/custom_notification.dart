import 'package:bot_toast/bot_toast.dart';
import 'package:crimes/resource/app_color.dart';
import 'package:crimes/resource/app_image.dart';
import 'package:crimes/resource/styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomNotification extends StatefulWidget {
  final CancelFunc? cancelFunc;
  final String title;
  final GestureTapCallback? onPressed;

  const CustomNotification(this.title, {Key? key, this.cancelFunc, this.onPressed}) : super(key: key);

  @override
  CustomNotificationState createState() => CustomNotificationState();
}

class CustomNotificationState extends State<CustomNotification> {
  bool loveMe = true;

  @override
  Widget build(BuildContext context) => GestureDetector(
    onTap: widget.onPressed != null ? widget.onPressed : (){},
    child:  Container(
      padding: EdgeInsets.symmetric(vertical: 24.h, horizontal: 8.w),
      child: Container(
        padding: EdgeInsets.all(16.w),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: [AppColor.green_light, AppColor.green_hard],
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(8.0),
          ),
        ),
        child: Row(
          children: <Widget>[
            Image.asset(AppImage.ic_check_circle, fit: BoxFit.contain, width: 24.w,),
            SizedBox(width: 8.w,),
            Expanded(
              child: Text(
                '${widget.title}',
                overflow: TextOverflow.ellipsis,
                style: TextStyles.bodyBold.copyWith(color: Colors.white),
              ),
            ),
            SizedBox(width: 16.w,),
            GestureDetector(
              onTap: widget.cancelFunc,
              child: Image.asset(AppImage.ic_close, fit: BoxFit.contain, width: 24.w,),
            ),
          ],
        ),
      ),
    )
  );
}