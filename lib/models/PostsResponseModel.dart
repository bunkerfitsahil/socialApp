class PostDataModel {
  int? count;
  String? next;
  String? previous;
  List<PostsList>? results;

  PostDataModel({this.count, this.next, this.previous, this.results});

  PostDataModel.fromJson(Map<String, dynamic> json) {
    count = json['count'];
    next = json['next'];
    previous = json['previous'];
    if (json['results'] != null) {
      results = <PostsList>[];
      json['results'].forEach((v) {
        results!.add(new PostsList.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['count'] = this.count;
    data['next'] = this.next;
    data['previous'] = this.previous;
    if (this.results != null) {
      data['results'] = this.results!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class PostsList {
  int? id;
  UserData? userData;
  bool? isLiked;
  int? numberOfLikes;
  int? numberOfComments;
  int? loggedInUserPostLikeId;
  String? updatedAt;
  String? createdAt;
  String? postUuid;
  String? postBody;
  String? attachment;
  String? fileType;
  int? organization;

  PostsList(
      {this.id,
      this.userData,
      this.isLiked,
      this.numberOfLikes,
      this.numberOfComments,
      this.loggedInUserPostLikeId,
      this.updatedAt,
      this.createdAt,
      this.postUuid,
      this.postBody,
      this.attachment,
      this.fileType,
      this.organization});

  PostsList.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userData = json['user_data'] != null
        ? new UserData.fromJson(json['user_data'])
        : null;
    isLiked = json['is_liked'];
    numberOfLikes = json['number_of_likes'];
    numberOfComments = json['number_of_comments'];
    loggedInUserPostLikeId = json['logged_in_user_post_like_id'];
    updatedAt = json['updated_at'];
    createdAt = json['created_at'];
    postUuid = json['post_uuid'];
    postBody = json['post_body'];
    attachment = json['attachment'];
    fileType = json['file_type'];
    organization = json['organization'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    if (this.userData != null) {
      data['user_data'] = this.userData!.toJson();
    }
    data['is_liked'] = this.isLiked;
    data['number_of_likes'] = this.numberOfLikes;
    data['number_of_comments'] = this.numberOfComments;
    data['logged_in_user_post_like_id'] = this.loggedInUserPostLikeId;
    data['updated_at'] = this.updatedAt;
    data['created_at'] = this.createdAt;
    data['post_uuid'] = this.postUuid;
    data['post_body'] = this.postBody;
    data['attachment'] = this.attachment;
    data['file_type'] = this.fileType;
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
