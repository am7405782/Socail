import 'package:flutter_application_2/core/Model/SocailModel.dart';

SocailModel? model;

abstract class CratAccountState {}

class InitalState extends CratAccountState {}

class ChangeIconSuffix extends CratAccountState {}

class CreatLodingState extends CratAccountState {}

class CreatScafullState extends CratAccountState {}

class CreatErrorState extends CratAccountState {
  final Error;
  CreatErrorState(this.Error);
}

class SaveDataFireStoreLoding extends CratAccountState {}

class SaveDataFireStoreScafull extends CratAccountState {
  final String? uid = model!.uid;
}

class SaveDataFireStoreerror extends CratAccountState {
  final error;
  SaveDataFireStoreerror({this.error});
}
