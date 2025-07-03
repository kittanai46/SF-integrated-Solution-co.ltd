import 'package:flutter/material.dart';
import 'package:crimes/resource/fonts.dart';
import 'package:crimes/util/string_utils.dart';

class GradientButton extends StatefulWidget {
  const GradientButton(
    this.text, {
    required this.onPressed,
    this.showLoading = false,
    this.disabledColor = Colors.grey,
    this.icon,
  });

  final String text;
  final VoidCallback onPressed;
  final bool showLoading;
  final Color disabledColor;
  final ExactAssetImage? icon;

  @override
  _GradientButtonState createState() => _GradientButtonState();
}

class _GradientButtonState extends State<GradientButton> {
  bool onHover = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTapDown: (details) {
          setState(() {
            onHover = true;
          });
        },
        onTapUp: (details) {
          setState(() {
            onHover = false;
          });
        },
        onTapCancel: () {
          setState(() {
            onHover = false;
          });
        },
        onTap: widget.onPressed,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(100),
          child: Container(
            child: Stack(
              alignment: Alignment.center,
              children: <Widget>[
                Positioned.fill(
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(colors: <Color>[
                        Color(0xFFFE9B86),
                        Color(0xFFF15887),
                      ]),
                    ),
                  ),
                ),
                if (onHover)
                  Positioned.fill(
                    child: Container(
                      color: Color(0x141e321a),
                    ),
                  ),
                if (!widget.showLoading)
                  Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: 12,
                      horizontal: 24,
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        ImageIcon(widget.icon, color: Colors.white),
                        SizedBox(width: 4),
                        Text(
                          StringUtils.capitalize(widget.text.toUpperCase()),
                          maxLines: 1,
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: Fonts.fontSukhumvit,
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),
                  ),
              ],
            ),
          ),
        ));
  }
}
