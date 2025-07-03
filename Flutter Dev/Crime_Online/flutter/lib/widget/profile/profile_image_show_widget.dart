import 'package:crimes/resource/app_image.dart';
import 'package:crimes/widget/profile/profile_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ProfileImageShowWidget extends StatefulWidget {
  final String image;

  const ProfileImageShowWidget({Key? key, required this.image}) : super(key: key);
  @override
  _ProfileImageShowWidgetState createState() => _ProfileImageShowWidgetState();
}

class _ProfileImageShowWidgetState extends State<ProfileImageShowWidget> {
  @override
  Widget build(BuildContext context) {
    if(widget.image == null || widget.image == ''){
      return Container(
        height: 40.0,
        width: 40.0,
        decoration: BoxDecoration(
            color: Colors.transparent,
            shape: BoxShape.circle,
            image: DecorationImage(
                fit: BoxFit.cover,
                image:  AssetImage(AppImage.ic_profile)
            )
        ),
      );
    }
    else {
      return Container(
        height: 40.0,
        width: 40.0,
        decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: Colors.white,
                blurRadius: 1.0,
                spreadRadius: 1.0,
              ),
            ],
            image: DecorationImage(
                fit: BoxFit.cover,
                image: ProfileUtils.imageFromBase64String(widget.image)
            )
        ),
      );
    }
  }
}
