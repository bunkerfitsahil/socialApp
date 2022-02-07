class PostCommentsModel {
  int? id;
  Null? parent;
  int? post;
  UserData? userData;
  int? numberOfReplies;
  int? numberOfLikes;

  List<Replies>? replies;
  int? commentLikeId;
  bool? isLiked;
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
      this.numberOfReplies,
      this.numberOfLikes,
      this.replies,
      this.commentLikeId,
      this.isLiked,
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
    numberOfReplies = json['number_of_replies'];

    numberOfLikes = json['number_of_likes'];
    if (json['replies'] != null) {
      replies = <Replies>[];
      json['replies'].forEach((v) {
        replies!.add(new Replies.fromJson(v));
      });
    }
    commentLikeId = json['logged_in_user_comment_like_id'];
    isLiked = json['is_liked'];
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
    data['number_of_replies'] = this.numberOfReplies;
    data['number_of_likes'] = this.numberOfLikes;
    if (this.replies != null) {
      data['replies'] = this.replies!.map((v) => v.toJson()).toList();
    }
    data['comment_like_id'] = this.commentLikeId;
    data['is_liked'] = this.isLiked;
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

class Replies {
  List<Replies>? replies;
  UserData? userData;
  int? numberOfLikes;
  int? replyLikeId;
  bool? isLiked;
  int? parent;
  int? id;
  String? commentBody;

  Replies(
      {this.replies,
      this.userData,
      this.numberOfLikes,
      this.isLiked,
      this.parent,
      this.replyLikeId,
      this.id,
      this.commentBody});

  Replies.fromJson(Map<String, dynamic> json) {
    if (json['replies'] != null) {
      replies = <Replies>[];
      json['replies'].forEach((v) {
        replies!.add(new Replies.fromJson(v));
      });
    }
    userData = json['user_data'] != null
        ? new UserData.fromJson(json['user_data'])
        : null;
    numberOfLikes = json['number_of_likes'];
    replyLikeId = json['logged_in_user_comment_like_id'];
    isLiked = json['is_liked'];
    parent = json['parent'];
    commentBody = json['comment_body'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.replies != null) {
      data['replies'] = this.replies!.map((v) => v.toJson()).toList();
    }
    if (this.userData != null) {
      data['user_data'] = this.userData!.toJson();
    }
    data['number_of_likes'] = this.numberOfLikes;
    data['is_liked'] = this.isLiked;
    data['parent'] = this.parent;
    data['id'] = this.id;
    return data;
  }
}
