import 'package:crimes/resource/styles.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:crimes/resource/app_color.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class CustomButton extends StatelessWidget {
  CustomButton(
    this.text, {
    required this.onPressed,
    this.textColor = AppColor.grey_btn_text,
    this.bgColor,
    this.borderColor,
    this.bgTopColor,
    this.bgBottomColor,
    this.borderRadius,
    this.isFullWidth = true,
    this.padding,
    this.icon,
  });

  final GestureTapCallback onPressed;
  final String text;
  final Color textColor;
  final Color? bgColor;
  final Color? borderColor;
  final Color? bgTopColor;
  final Color? bgBottomColor;
  final double? borderRadius;
  final bool isFullWidth;
  final EdgeInsets? padding;
  final String? icon;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        splashColor: Colors.white,
        borderRadius: BorderRadius.circular(8.0),
        onTap: onPressed,
        child: Container(
          decoration: bgColor != null
              ? BoxDecoration(
                  color: bgColor,
                  border: borderColor!=null
                    ? Border.all(
                        color: borderColor!,
                        style: BorderStyle.solid,
                        width: 2.w,
                      )
                    : Border.all(
                        color: Colors.transparent,
                        style: BorderStyle.solid,
                        width: 2.w,
                      ),
                  borderRadius: BorderRadius.circular(borderRadius ?? 8.w),
                )
              : bgTopColor!=null && bgBottomColor!=null
                ? BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [bgTopColor!, bgBottomColor!],
                    ),
                    border: borderColor!=null
                      ? Border.all(
                          color: borderColor!,
                          style: BorderStyle.solid,
                          width: 2.w,
                        )
                      : Border.all(
                          color: Colors.transparent,
                          style: BorderStyle.solid,
                          width: 2.w,
                        ),
                    borderRadius: BorderRadius.circular(borderRadius ?? 8.w),
                  )
                : BoxDecoration(
                    color: AppColor.accentColor,
                    border: borderColor!=null
                      ? Border.all(
                          color: borderColor!,
                          style: BorderStyle.solid,
                          width: 2.w,
                        )
                      : Border.all(
                          color: Colors.transparent,
                          style: BorderStyle.solid,
                          width: 2.w,
                        ),
                    borderRadius: BorderRadius.circular(borderRadius ?? 8.w),
                  ),
          width: isFullWidth
            ? MediaQuery.of(context).size.width
            : null,
          padding: padding == null
            ? EdgeInsets.symmetric(vertical: 11.h)
            : padding,
          child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if(icon!=null)
                    Image.asset(icon!, fit: BoxFit.contain, width: 24.w),
                  if(icon!=null)
                    SizedBox(width: 8.w,),
                  Text(
                    text,
                    style: TextStyles.bodyBold.copyWith(
                      color: textColor,
                    ),
                  ),
                ],
              ),
            ),
        ),
      ),
    );
  }
}

class PrimaryCustomButton extends StatelessWidget {
  PrimaryCustomButton(
    this.text, {
    required this.onPressed,
    this.isFullWidth = true,
    this.isEnabled = true,
    this.padding,
    this.icon,
  });

  final String text;
  final GestureTapCallback onPressed;
  final bool isFullWidth;
  final bool isEnabled;
  final EdgeInsets? padding;
  final String? icon;

  @override
  Widget build(BuildContext context) {
    return isEnabled == true
      ? CustomButton(
          text,
          onPressed: onPressed,
          textColor: AppColor.brown_text,
          bgTopColor: AppColor.yellow_light,
          bgBottomColor: AppColor.yellow_hard,
          isFullWidth: isFullWidth,
          padding: padding,
          icon: icon
        )
      : CustomButton(
          text,
          onPressed: (){},
          textColor: AppColor.grey_btn_text,
          bgColor: AppColor.grey_btn_bg,
          isFullWidth: isFullWidth,
          padding: padding,
          icon: icon
        );
  }
}

class SecondaryCustomButton extends StatelessWidget {
  SecondaryCustomButton(
    this.text, {
    required this.onPressed,
    this.isFullWidth = true,
    this.isEnabled = true,
    this.padding,
    this.icon,
  });

  final String text;
  final GestureTapCallback onPressed;
  final bool isFullWidth;
  final bool isEnabled;
  final EdgeInsets? padding;
  final String? icon;

  @override
  Widget build(BuildContext context) {
    return isEnabled == true
      ? CustomButton(
          text,
          onPressed: onPressed,
          textColor: AppColor.brown_text,
          bgColor: Colors.white,
          borderColor: AppColor.yellow_hard,
          isFullWidth: isFullWidth,
          padding: padding,
          icon: icon
        )
      : CustomButton(
          text,
          onPressed: onPressed,
          textColor: AppColor.grey_btn_text,
          bgColor: Colors.white,
          borderColor: AppColor.grey_btn_text,
          isFullWidth: isFullWidth,
          padding: padding,
          icon: icon
        );
  }
}