import 'package:tek_capsule/business_logic/model/user_model.dart';

abstract class ApplicationEvent {
  double value;
  ApplicationEvent(this.value);
}

class AppLoadEvent extends ApplicationEvent {
  String langCode;
  AppLoadEvent({required this.langCode, value}) : super(value);
}

class LoginEvent extends ApplicationEvent {
  bool isSuccessful;
  UserModel payload;
  LoginEvent({required this.isSuccessful, required this.payload, value})
      : super(value);
}

class LogOutEvent extends ApplicationEvent {
  LogOutEvent(double value) : super(value);
}

class OnRegisterEvent extends ApplicationEvent {
  OnRegisterEvent(double value) : super(value);
}

class OnVerificationEvent extends ApplicationEvent {
  OnVerificationEvent(double value) : super(value);
}

class FirstTimeLoginEvent extends ApplicationEvent {
  FirstTimeLoginEvent(double value) : super(value);
}

class DashBoardLoadEvent extends ApplicationEvent {
  DashBoardLoadEvent(double value) : super(value);
}

class HamburgerOpenEvent extends ApplicationEvent {
  HamburgerOpenEvent(double value) : super(value);
}

class HamburgerCloseEvent extends ApplicationEvent {
  HamburgerCloseEvent(double value) : super(value);
}
