// ignore_for_file: file_names

abstract class LoginState {}

class InitalState extends LoginState {}

class LoadingLoginState extends LoginState {}

class ScafullLoginState extends LoginState {
  final String uid;
  ScafullLoginState(this.uid);
}

class ErorrLoginState extends LoginState {
  final Error;
  ErorrLoginState(this.Error);
}

class ChangeIconSuffix extends LoginState {}
