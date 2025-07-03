import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ConnectionError extends StatefulWidget {
  const ConnectionError({
    required this.onRetry,
  });

  final VoidCallback onRetry;

  @override
  _ConnectionErrorState createState() => _ConnectionErrorState();
}

class _ConnectionErrorState extends State<ConnectionError> {
  @override
  Widget build(BuildContext context) => RefreshIndicator(
      backgroundColor: const Color.fromRGBO(44, 46, 63, 1),
      onRefresh: () async{
        widget.onRetry();
      },
      child: ListView(children: <Widget>[
        Stack(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(
                top: 292.h,
              ),
              padding: EdgeInsets.only(top: 15.h),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Whoops',
                    style: TextStyle(
                      fontSize: 24.sp,
                      fontFamily: 'Prompt',
                      fontWeight: FontWeight.normal,
                      color: const Color.fromRGBO(255, 255, 255, 1),
                    ),
                  ),
                  Padding(padding: EdgeInsets.symmetric(vertical: 5.h)),
                  Text(
                    'Slow or no internet connection.\nPlease check your internet settings',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 13.sp,
                      fontFamily: 'Prompt',
                      fontWeight: FontWeight.normal,
                      color: const Color.fromRGBO(193, 192, 200, 1),
                    ),
                  ),
                  Padding(padding: EdgeInsets.symmetric(vertical: 10.h)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Image.asset(
                        'images/common/connection_error/refresh.png',
                        color: const Color.fromRGBO(79, 82, 101, 1),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 5.w),
                      ),
                      Text(
                        'Pull Down To Refresh',
                        style: TextStyle(
                          fontSize: 13.sp,
                          fontFamily: 'Prompt',
                          fontWeight: FontWeight.normal,
                          color: const Color.fromRGBO(255, 255, 255, 1),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ]));
}
