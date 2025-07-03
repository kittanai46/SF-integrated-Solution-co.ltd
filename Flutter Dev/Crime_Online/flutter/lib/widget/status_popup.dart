import 'package:crimes/resource/app_color.dart';
import 'package:crimes/resource/app_image.dart';
import 'package:crimes/resource/styles.dart';
import 'package:crimes/widget/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class StatusPopup extends StatelessWidget {
  const StatusPopup({
    required this.title,
    required this.buttonText,
    required this.onPress,
    this.description,
    this.cancelText,
    this.onCancel,
    this.showImg = false,
    this.body
  });

  final String? title, description, buttonText, cancelText;
  final VoidCallback onPress;
  final VoidCallback? onCancel;
  final bool showImg;
  final Widget? body;

  @override
  Widget build(BuildContext context) => Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(Consts.padding),
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
        child: _buildDialogContent(context),
      );

  Widget _buildDialogContent(BuildContext context) => Stack(
        children: <Widget>[
          _buildContent(context),
        ],
      );

  Widget _buildContent(BuildContext context) => Container(
        padding: EdgeInsets.all(Consts.padding),
        decoration: BoxDecoration(
          color: Colors.white,
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(Consts.padding.w),
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 10,
              offset: const Offset(0, 10),
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min, // To make the card compact
          children: <Widget>[
            SizedBox(height: 12.h),
            Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if(showImg)
                    Image.asset(AppImage.ic_policestation, fit: BoxFit.contain, width: 24.w,height: 24.h , color: AppColor.blue_text_dialog),
                  if(showImg)
                    SizedBox(width: 8.w),
                  Text(
                    title!,
                    textAlign: TextAlign.center,
                    style: TextStyles.titleBold.copyWith(
                      color: AppColor.blue_text_dialog,
                    ),
                  ),
                ],
            ),

            if(description!=null)
              SizedBox(height: 6.w),
            if(description!=null)
              Text(
                description!,
                textAlign: TextAlign.center,
                style: TextStyles.bodySemi.copyWith(
                  color: AppColor.blue_text_dialog,
                ),
              ),
            if(body != null)
              Container(
                child: body
              ),
            SizedBox(height: 24.w),
            _buildButton(context),
            SizedBox(height: 12.w),
          ],
        ),
      );

  Widget _buildButton(BuildContext context) => Container(
    child: Row(
      children: [
        if(onCancel != null)
          Expanded(
            child: SecondaryCustomButton(
              cancelText!,
              onPressed: () => {
                onCancel!()
              },
              isFullWidth: false,
            ),
          ),
        if(onCancel != null)
          SizedBox(width: 10.w),
        if(onCancel != null)
          Expanded(
            child: PrimaryCustomButton(
              buttonText!,
              onPressed: onPress,
              isFullWidth: false,
            ),
          ),
        if(onCancel == null)
          Expanded(
            child: PrimaryCustomButton(
              buttonText!,
              onPressed: onPress,
            ),
          ),
      ],
    ),
  );
  
}

class Consts {
  Consts._();

  static const double padding = 12;
}
