import 'package:crimes/resource/app_color.dart';
import 'package:crimes/resource/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomAppBar extends StatefulWidget {
  const CustomAppBar({
    this.title,
    this.showRightIcon = false,
    this.onPressed,
    this.icon,
    this.showback = true,
  });

  final String? title;
  final VoidCallback? onPressed;
  final Icon? icon;
  final bool showback;
  final bool showRightIcon;

  @override
  _CustomAppBarState createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 24, 0, 0),
      child: Row(
        children: <Widget>[
          if(widget.showback)
            IconButton(
              onPressed: () => Navigator.pop(context),
              icon: Icon(Icons.arrow_back, color: Colors.white),
            ),
          if(!widget.showback)
            IconButton(
              icon: Icon(Icons.arrow_back, color: Colors.transparent),
              onPressed: () {
              },
            ),
          Expanded(
            child: Center(
              child: Text(
                widget.title!,
                style: TextStyles.bodyBold.copyWith(
                    color: Colors.white
                ),
              ),
            ),
          ),
          if (widget.showRightIcon)
            IconButton(
                icon: widget.icon!,
                onPressed: widget.onPressed
            ),
          if (!widget.showRightIcon)
            IconButton(
              icon: Icon(Icons.arrow_back, color: Colors.transparent),
              onPressed: () {},
            ),
        ],
      ),
    );
  }
}
