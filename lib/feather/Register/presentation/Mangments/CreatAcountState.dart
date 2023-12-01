abstract class CratAccountState {}

class InitalState extends CratAccountState {}

class ChangeIconSuffix extends CratAccountState {}

class CreatLodingState extends CratAccountState {}

class CreatScafullState extends CratAccountState {}

class CreatErrorState extends CratAccountState {
  final Error;
  CreatErrorState(this.Error);
}
