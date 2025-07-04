import 'package:bordered_text/bordered_text.dart';
import 'package:crimes/resource/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:crimes/resource/app_color.dart';
import 'package:crimes/widget/connection_error.dart';
import 'package:crimes/screen/action_status.dart';

class StatusAwareContainer extends StatelessWidget {
  const StatusAwareContainer(
    this.actionStatus, {
    required this.idle,
    this.onRetry,
    this.width,
    this.height,
    this.content,
    this.error,
    this.loading,
    this.showError = false,
  });

  final ActionStatus actionStatus;
  final VoidCallback? onRetry;
  final double? width;
  final double? height;
  final Widget? content;
  final Widget? idle;
  final Widget? error;
  final Widget? loading;
  final bool showError;

  @override
  Widget build(BuildContext context) => Stack(
        children: <Widget>[
          idle ?? Container(),
          _buildStatusAwareContainer(),
        ],
      );

  Widget _buildStatusAwareContainer() {
    final status = actionStatus;
    switch (status) {
      case ActionStatus.error:{
        if(showError)
          return error ?? _buildConnectionError();
        else
          return Container();
      } break;
      case ActionStatus.inProgress:
        return loading ?? _buildDefaultLoading();
      case ActionStatus.success:
        return content ?? Container();
      default:
        return Container();
    }
  }

  Widget _buildDefaultLoading() => Stack(
    children: <Widget>[
      Container(color: const Color.fromRGBO(0, 0, 0, 0.5)),
      Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              child: SpinKitWave(
                  color: Colors.white.withOpacity(0.5),
                  size: 60,
              )
              //Lottie.asset('assets/lotties/loading-animation.json'),
            ),
            SizedBox(height: 10,),
            BorderedText(
              strokeWidth: 1.0,
              strokeColor: Colors.black54,
              child: Text('กำลังโหลด...',style: TextStyles.titleBold.copyWith(color: Colors.white.withOpacity(0.8),fontSize: 24))
            )
            //Text('กำลังโหลด...',style: TextStyles.titleBold.copyWith(color: Colors.white,letterSpacing: 2.0,),)
          ],
        ),
      ),
    ],
  );


  Widget _buildConnectionError() => Container(
        width: width,
        height: height,
        color: AppColor.primaryColor.withOpacity(1),
        // child: ConnectionError(
        //   onRetry: onRetry,
        // ),
      );

}
