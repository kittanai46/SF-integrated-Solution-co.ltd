import 'package:crimes/resource/styles.dart';
import 'package:flutter/material.dart';
import 'package:crimes/resource/app_color.dart';
import 'package:crimes/util/string_utils.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField({
    this.obscureText = false,
    this.obscureIcon = false,
    this.enable = true,
    this.hintText = '',
    this.controller,
    this.textInputAction,
    this.onFieldSubmitted,
    this.focusNode,
    this.nextFocusNode,
    required this.keyboardType,
    this.fieldKey,
    this.labelText,
    this.maxLines = 1,
    this.maxLength,
    this.error = false,
    this.suffixIcon,
    this.onTap,
    this.onChanged,
    this.assetImage,
    this.assetImageColor,
    this.bgColor,
    this.textColor,
    this.hintTextColor
  });

  final bool obscureText;
  final bool obscureIcon;
  final String hintText;
  final TextEditingController? controller;
  final TextInputAction? textInputAction;
  final ValueChanged<String>? onFieldSubmitted;
  final FocusNode? focusNode;
  final FocusNode? nextFocusNode;
  final TextInputType keyboardType;
  final Key? fieldKey;
  final bool enable;
  final String? labelText;
  final int? maxLines;
  final int? maxLength;
  final bool error;
  final Widget? suffixIcon;
  final GestureTapCallback? onTap;
  final ValueChanged<String>? onChanged;
  final String? assetImage;
  final Color? assetImageColor;
  final Color? bgColor;
  final Color? textColor;
  final Color? hintTextColor;

  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool hasText = false;
  bool passwordVisibility = true;
  FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    if (widget.focusNode != null) {
      _focusNode = widget.focusNode!;
    }
    _focusNode.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) => Material(
      elevation: 1,
      borderRadius: BorderRadius.circular(10),
      color: widget.bgColor == null
        ? AppColor.bg.withOpacity(0.2)
        : widget.bgColor,
      child: Container(
        padding: EdgeInsets.only(top: 8),
        decoration: BoxDecoration(
          color: widget.bgColor == null
            ? widget.enable
              ? AppColor.bg.withOpacity(0.2)
              : AppColor.grey_btn_bg
            : widget.bgColor
          ,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: _focusNode.hasFocus == true
                ? AppColor.accentColor
                : widget.error
                    ? Colors.red
                    : widget.bgColor == null
                      ? widget.enable
                        ? AppColor.bg.withOpacity(0.2)
                        : AppColor.grey_btn_bg
                      : widget.bgColor == null ? AppColor.bg.withOpacity(0.2) : widget.bgColor!
          ),
        ),
        child: TextField(
          key: widget.fieldKey,
          onTap: widget.onTap,
          obscureText: widget.obscureText ? passwordVisibility : false,
          maxLines: widget.maxLines,
          maxLength: widget.maxLength,
          controller: widget.controller,
          textInputAction: widget.textInputAction == null
              ? widget.nextFocusNode != null
                  ? TextInputAction.next
                  : TextInputAction.done
              : widget.textInputAction,
          focusNode: _focusNode,
          keyboardType: widget.keyboardType,
          enabled: widget.enable,
          onChanged: (value) {
            setState(() {
              hasText = value.isNotEmpty;
            });
            if (widget.onChanged != null) {
              widget.onChanged!(value);
            }
          },
          style: TextStyles.body.copyWith(
            color: widget.textColor == null
              ? Colors.white
              : widget.textColor,
          ),
          decoration: InputDecoration(
            fillColor: widget.bgColor == null
                ? widget.enable
                  ? AppColor.bg.withOpacity(0.2)
                  : AppColor.grey_btn_bg
                : widget.bgColor
            ,
            prefixIcon: widget.assetImage != null
              ? Padding(
                    padding: const EdgeInsets.only(
                        top: 15,
                        left: 5,
                        right: 0,
                        bottom: 15),
                    child: new SizedBox(
                      height: 4,
                      child: widget.assetImageColor != null
                        ? Image.asset(widget.assetImage!, color: widget.assetImageColor,)
                        : Image.asset(widget.assetImage!,)
                      ,
                    ),
                )
              : null,
            border: OutlineInputBorder(
              borderSide: BorderSide(color: AppColor.accentColor),
              borderRadius: BorderRadius.circular(8),
            ),
            alignLabelWithHint: true,
            counterText: "",
            contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            suffixIcon: widget.obscureIcon
                ? IconButton(
                    icon: Icon(
                      passwordVisibility
                          ? Icons.visibility_off
                          : Icons.visibility,
                      color: AppColor.grey_btn_bg,
                    ),
                    onPressed: () {
                      setState(() {
                        passwordVisibility = !passwordVisibility;
                      });
                    },
                  )
                : null,
            filled: true,
            hintText: widget.hintText != null
                ? StringUtils.capitalize(widget.hintText)
                : null,
            hintStyle: TextStyles.body.copyWith(
                color: widget.hintTextColor == null
                    ? Colors.white
                    : widget.hintTextColor,
            ),
            labelText: widget.labelText != null
                ? StringUtils.capitalize(widget.labelText!)
                : null,
            labelStyle: TextStyles.body.copyWith(
              color: AppColor.grey_hint,
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.transparent),
              borderRadius: BorderRadius.circular(8),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.transparent),
              borderRadius: BorderRadius.circular(8),
            ),
            disabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.transparent),
              borderRadius: BorderRadius.circular(8),
            ),
            errorBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.transparent),
              borderRadius: BorderRadius.circular(8),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.transparent),
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        ),
      ),
    );

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }
}

class AlwaysDisabledFocusNode extends FocusNode {
  @override
  bool get hasFocus => false;
}

class SuOutlineInputBorder extends OutlineInputBorder {
  @override
  bool get isOutline => false;
}
