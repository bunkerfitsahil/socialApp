import 'package:social_feed_flutter/utils/pref_utils.dart';

class PendingDataModel {
  int? id;
  Follower? follower;
  Follower? followee;
  String? createdAt;

  PendingDataModel({this.id, this.follower, this.followee, this.createdAt});

  PendingDataModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    follower = json['follower'] != null
        ? new Follower.fromJson(json['follower'])
        : null;
    followee = json['followee'] != null
        ? new Follower.fromJson(json['followee'])
        : null;
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    if (this.follower != null) {
      data['follower'] = this.follower!.toJson();
    }
    if (this.followee != null) {
      data['followee'] = this.followee!.toJson();
    }
    data['created_at'] = this.createdAt;
    return data;
  }
}

class Follower {
  String? profilePicture;
  String? firstName;
  String? lastName;
  String? gender;
  String? location;
  String? dept;

  Follower(
      {this.profilePicture,
      this.firstName,
      this.lastName,
      this.gender,
      this.location,
      this.dept});

  Follower.fromJson(Map<String, dynamic> json) {
    profilePicture = (PrefUtils.isNullEmptyOrFalse(json['profile_picture']))
        ? " "
        : json['profile_picture'];
    firstName = (PrefUtils.isNullEmptyOrFalse(json['first_name']))
        ? " "
        : json['first_name'];
    lastName = (PrefUtils.isNullEmptyOrFalse(json['last_name']))
        ? " "
        : json['last_name'];
    gender =
        (PrefUtils.isNullEmptyOrFalse(json['gender'])) ? " " : json['gender'];
    location = (PrefUtils.isNullEmptyOrFalse(json['location']))
        ? " "
        : json['location'];
    dept = (PrefUtils.isNullEmptyOrFalse(json['department']))
        ? " "
        : json['department'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['profile_picture'] = this.profilePicture;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['gender'] = this.gender;
    data['location'] = this.location;
    return data;
  }
}
