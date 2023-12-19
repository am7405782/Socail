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

class LodingGetPostState extends SocailState {}

class ScafullGetPostState extends SocailState {}

class ErrorGetPostState extends SocailState {}

class RemovepostImage extends SocailState {}

class SingnOutState extends SocailState {}

////////////////////////////////////////////////////////////////////////////////////
class LodingGetUserDataChat extends SocailState {}

class ScafullGetUserDataChat extends SocailState {}

class EroorGetUserDataChat extends SocailState {}

///////////////////////////////////////
class LodingLikeState extends SocailState {}

class ScafullLikeState extends SocailState {}

class ErrorLikeState extends SocailState {}

class ScafullSendMessageState extends SocailState {}

class ErrorSendMessageState extends SocailState {}

class GetMessageScafull extends SocailState {}

class LodinggetChatimageState extends SocailState {}

class ScafulltChatimageState extends SocailState {}

class ErrorChatimageState extends SocailState {}

class LodingUploadChatImageState extends SocailState {}

class ScafullUploadChatImageState extends SocailState {}

class ErorrUploadChatImageState extends SocailState {}

class LodingSendCommentState extends SocailState {}

class ScafullSendCommentState extends SocailState {}

class ErrorSendCommentState extends SocailState {}

class ToggleLikeState extends SocailState {}

class LodingCraeatAppPhoto extends SocailState {}

class ScafullCraeatAppPhoto extends SocailState {}

class LoadingUpdateAppPhoto extends SocailState {}

class SuccessfulUpdateAppPhoto extends SocailState {}

class ErrorUpdatePostState extends SocailState {}

class LodindupdatePhotoImage extends SocailState {}

class SuccessupdatePhotoImage extends SocailState {}

class ErrorupdatePhotoImage extends SocailState {}

class DeletPersonpost extends SocailState {}

class LodingGetCommentsState extends SocailState {}

class ScafullGetCommentsState extends SocailState {}

class ErrorGetCommentsState extends SocailState {}

class DisLikeState extends SocailState {}
