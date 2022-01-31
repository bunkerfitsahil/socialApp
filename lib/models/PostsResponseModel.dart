class PostsList {
  int? id;
  UserData? userData;
  int? numberOfLikes;
  int? numberOfComments;
  String? updatedAt;
  String? createdAt;
  String? postUuid;
  String? postBody;
  String? attachment;
  int? organization;
  bool? isLiked;

  PostsList(
      {this.id,
      this.userData,
      this.numberOfLikes,
      this.numberOfComments,
      this.updatedAt,
      this.createdAt,
      this.postUuid,
      this.postBody,
      this.attachment,
      this.organization,
      this.isLiked});

  PostsList.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userData =
        json['user_data'] != null ? UserData.fromJson(json['user_data']) : null;
    numberOfLikes = json['number_of_likes'];
    numberOfComments = json['number_of_comments'];
    updatedAt = json['updated_at'];
    createdAt = json['created_at'];
    postUuid = json['post_uuid'];
    isLiked = json['is_liked'];
    postBody = json['post_body'];
    attachment = json['attachment'];
    organization = json['organization'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    if (this.userData != null) {
      data['user_data'] = this.userData!.toJson();
    }
    data['number_of_likes'] = this.numberOfLikes;
    data['is_liked'] = this.isLiked;
    data['number_of_comments'] = this.numberOfComments;
    data['updated_at'] = this.updatedAt;
    data['created_at'] = this.createdAt;
    data['post_uuid'] = this.postUuid;
    data['post_body'] = this.postBody;
    data['attachment'] = this.attachment;
    data['organization'] = this.organization;
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
