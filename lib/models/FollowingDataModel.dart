import 'package:social_feed_flutter/utils/pref_utils.dart';

class FollowerDataModel {
  String? profilePicture;
  String? firstName;
  String? lastName;
  String? gender;
  String? location;

  FollowerDataModel(
      {this.profilePicture,
      this.firstName,
      this.lastName,
      this.gender,
      this.location});

  FollowerDataModel.fromJson(Map<String, dynamic> json) {
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
