import 'package:firebase_messaging/firebase_messaging.dart';

class ReceivePushNotiEvent {
  ReceivePushNotiEvent(this.message, this.state);
  final RemoteMessage message;
  final String state;
}

class PingSocErrorEvent {
  PingSocErrorEvent();
}

class OnThaiDEvent {
  OnThaiDEvent(this.code, this.state);
  final String code;
  final String state;
}

class OnThaiDLK2Event {
  OnThaiDLK2Event(this.code, this.state, this.authen);
  final String code;
  final String state;
  final String authen;
}
