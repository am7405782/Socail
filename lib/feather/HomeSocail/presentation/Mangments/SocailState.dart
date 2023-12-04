abstract class SocailState {}

class InitalState extends SocailState {}

class ChangeBottonSheet extends SocailState {}

class GetUserDataLoding extends SocailState {}

class GetUserDataScafull extends SocailState {}

class GetDataerror extends SocailState {
  final Error;
  GetDataerror(this.Error);
}

class HomeerrorState extends SocailState {
  final String Error;
  HomeerrorState(this.Error);
}

////////////////////////////get image ///////////////
class LodingImageProfailState extends SocailState {}

class ScafullImageProfailState extends SocailState {}

class ErorrImageProfailState extends SocailState {}

class LodingUploadImageProfailState extends SocailState {}

class ScafullUploadImageProfailState extends SocailState {}

class ErrorUploadImageProfailState extends SocailState {}

class LodingImageCoverState extends SocailState {}

class ScafullImagecoverState extends SocailState {}

class ErorrImagecoverState extends SocailState {}

class UdateUserDataLoding extends SocailState {}

class UdateUserDataScafull extends SocailState {}

class UdateUserDataEror extends SocailState {}

class LodingUploadcoverProfailState extends SocailState {}

class ScafullUploadcoverProfailState extends SocailState {}

class ErrorUploadcoverProfailState extends SocailState {}

class LodinggetPostImageState extends SocailState {}

class ScafullgetPostImageState extends SocailState {}

class ErrorgetPostImageState extends SocailState {}

class LodingUploadPostImageState extends SocailState {}

class ScafullUploadPostImageState extends SocailState {}

class ErrorUploadPostImageState extends SocailState {}

class LodingCreatPostState extends SocailState {}

class ScafullCreatPoststate extends SocailState {}

class ErorrCreatPostState extends SocailState {}
