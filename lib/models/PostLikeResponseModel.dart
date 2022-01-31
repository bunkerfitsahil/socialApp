class PostLikeResponse {
  int? id;
  UserData? userData;
  String? updatedAt;
  String? createdAt;
  int? post;

  PostLikeResponse(
      {this.id, this.userData, this.updatedAt, this.createdAt, this.post});

  PostLikeResponse.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userData = json['user_data'] != null
        ? new UserData.fromJson(json['user_data'])
        : null;
    updatedAt = json['updated_at'];
    createdAt = json['created_at'];
    post = json['post'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    if (this.userData != null) {
      data['user_data'] = this.userData!.toJson();
    }
    data['updated_at'] = this.updatedAt;
    data['created_at'] = this.createdAt;
    data['post'] = this.post;
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

class CommentLikeResponse {
  int? id;
  UserData? userData;
  String? updatedAt;
  String? createdAt;
  int? comment;

  CommentLikeResponse(
      {this.id, this.userData, this.updatedAt, this.createdAt, this.comment});

  CommentLikeResponse.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userData = json['user_data'] != null
        ? new UserData.fromJson(json['user_data'])
        : null;
    updatedAt = json['updated_at'];
    createdAt = json['created_at'];
    comment = json['comment'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    if (this.userData != null) {
      data['user_data'] = this.userData!.toJson();
    }
    data['updated_at'] = this.updatedAt;
    data['created_at'] = this.createdAt;
    data['comment'] = this.comment;
    return data;
  }
}
