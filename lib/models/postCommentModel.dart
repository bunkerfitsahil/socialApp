class PostCommentsModel {
  int? id;
  Null? parent;
  int? post;
  UserData? userData;
  int? numberOfLikes;
  String? updatedAt;
  String? createdAt;
  String? commentUuid;
  String? commentBody;
  Null? attachment;

  PostCommentsModel(
      {this.id,
      this.parent,
      this.post,
      this.userData,
      this.numberOfLikes,
      this.updatedAt,
      this.createdAt,
      this.commentUuid,
      this.commentBody,
      this.attachment});

  PostCommentsModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    parent = json['parent'];
    post = json['post'];
    userData = json['user_data'] != null
        ? new UserData.fromJson(json['user_data'])
        : null;
    numberOfLikes = json['number_of_likes'];
    updatedAt = json['updated_at'];
    createdAt = json['created_at'];
    commentUuid = json['comment_uuid'];
    commentBody = json['comment_body'];
    attachment = json['attachment'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['parent'] = this.parent;
    data['post'] = this.post;
    if (this.userData != null) {
      data['user_data'] = this.userData!.toJson();
    }
    data['number_of_likes'] = this.numberOfLikes;
    data['updated_at'] = this.updatedAt;
    data['created_at'] = this.createdAt;
    data['comment_uuid'] = this.commentUuid;
    data['comment_body'] = this.commentBody;
    data['attachment'] = this.attachment;
    return data;
  }
}

class UserData {
  String? name;
  String? profilePicture;
  int? userProfileId;

  UserData({this.name, this.profilePicture, this.userProfileId});

  UserData.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    profilePicture = json['profile_picture'];
    userProfileId = json['user_profile_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['profile_picture'] = this.profilePicture;
    data['user_profile_id'] = this.userProfileId;
    return data;
  }
}
