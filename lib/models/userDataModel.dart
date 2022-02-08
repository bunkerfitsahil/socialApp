import 'package:social_feed_flutter/utils/pref_utils.dart';

class UserDataModel {
  String? height;
  String? weight;
  String? profilePicture;
  User? user;
  String? gender;
  String? firstName;
  String? lastName;
  List<String>? goals;
  String? dateOfBirth;
  int? age;
  double? bmi;
  String? bio;
  int? followerCount;
  int? followingCount;
  int? postCount;
  String? parent;
  List<String>? children;
  String? preferredLanguage;
  CorporateProfile? corporateProfile;
  String? followRequestStatus;

  UserDataModel(
      {this.height,
      this.weight,
      this.profilePicture,
      this.user,
      this.gender,
      this.firstName,
      this.lastName,
      this.goals,
      this.dateOfBirth,
      this.age,
      this.bmi,
      this.bio,
      this.followerCount,
      this.followingCount,
      this.parent,
      this.children,
      this.preferredLanguage,
      this.corporateProfile});

  UserDataModel.fromJson(Map<String, dynamic> json) {
    height =
        (PrefUtils.isNullEmptyOrFalse(json['height'])) ? 0 : json['height'];
    weight =
        (PrefUtils.isNullEmptyOrFalse(json['weight'])) ? 0 : json['weight'];
    profilePicture = (PrefUtils.isNullEmptyOrFalse(json['profile_picture']))
        ? ""
        : json['profile_picture'];

    user = json['user'] != null ? new User.fromJson(json['user']) : null;
    gender =
        (PrefUtils.isNullEmptyOrFalse(json['gender'])) ? "N/A" : json['gender'];
    postCount = (PrefUtils.isNullEmptyOrFalse(json['posts_count']))
        ? 0
        : json['posts_count'];
    followRequestStatus =
        (PrefUtils.isNullEmptyOrFalse(json['follow_request_status']))
            ? " "
            : json['follow_request_status'];
    firstName = (PrefUtils.isNullEmptyOrFalse(json['first_name']))
        ? " "
        : json['first_name'];
    lastName = (PrefUtils.isNullEmptyOrFalse(json['last_name']))
        ? " "
        : json['last_name'];

    if (json['goals'] != null) {
      goals = <String>[];
      json['goals'].forEach((v) {
        goals!.add(v);
      });
    }
    dateOfBirth = (PrefUtils.isNullEmptyOrFalse(json['date_of_birth']))
        ? " "
        : json['date_of_birth'];
    age = (PrefUtils.isNullEmptyOrFalse(json['age'])) ? 0 : json['age'];
    bmi = (PrefUtils.isNullEmptyOrFalse(json['bmi'])) ? 0.0 : json['bmi'];
    bio = (PrefUtils.isNullEmptyOrFalse(json['bio'])) ? " " : json['bio'];
    followerCount = (PrefUtils.isNullEmptyOrFalse(json['follower_count']))
        ? 0
        : json['follower_count'];
    followingCount = (PrefUtils.isNullEmptyOrFalse(json['following_count']))
        ? 0
        : json['following_count'];
    parent =
        (PrefUtils.isNullEmptyOrFalse(json['parent'])) ? " " : json['parent'];
    if (json['children'] != null) {
      children = <String>[];
      json['children'].forEach((v) {
        children!.add(v);
      });
    }
    preferredLanguage = json['preferred_language'];
    corporateProfile = json['corporate_profile'] != null
        ? new CorporateProfile.fromJson(json['corporate_profile'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['height'] = this.height;
    data['weight'] = this.weight;
    data['profile_picture'] =
        PrefUtils.isNullEmptyOrFalse(profilePicture) ? "" : profilePicture;
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    data['gender'] = this.gender;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    if (this.goals != null) {
      data['goals'] = this.goals!.map((v) => v).toList();
    }
    data['date_of_birth'] = this.dateOfBirth;
    data['age'] = this.age;
    data['bmi'] = this.bmi;
    data['bio'] = this.bio;
    data['follower_count'] = this.followerCount;
    data['following_count'] = this.followingCount;
    data['parent'] = this.parent;
    if (this.children != null) {
      data['children'] = this.children!.map((v) => v).toList();
    }
    data['preferred_language'] = this.preferredLanguage;
    if (this.corporateProfile != null) {
      data['corporate_profile'] = this.corporateProfile!.toJson();
    }
    return data;
  }
}

class User {
  int? id;
  String? uuid;
  String? email;
  String? dateJoined;
  bool? isActive;
  int? currentCountry;
  String? phoneNumber;
  String? userType;
  bool? verified;

  User(
      {this.id,
      this.uuid,
      this.email,
      this.dateJoined,
      this.isActive,
      this.currentCountry,
      this.phoneNumber,
      this.userType,
      this.verified});

  User.fromJson(Map<String, dynamic> json) {
    id = (PrefUtils.isNullEmptyOrFalse(json['id'])) ? 0 : json['id'];
    uuid = (PrefUtils.isNullEmptyOrFalse(json['uuid'])) ? " " : json['uuid'];
    email = (PrefUtils.isNullEmptyOrFalse(json['email'])) ? " " : json['email'];
    dateJoined = (PrefUtils.isNullEmptyOrFalse(json['date_joined']))
        ? " "
        : json['date_joined'];
    isActive = (PrefUtils.isNullEmptyOrFalse(json['is_active']))
        ? false
        : json['is_active'];
    currentCountry = (PrefUtils.isNullEmptyOrFalse(json['current_country']))
        ? 0
        : json['current_country'];
    phoneNumber = (PrefUtils.isNullEmptyOrFalse(json['phone_number']))
        ? " "
        : json['phone_number'];
    userType = (PrefUtils.isNullEmptyOrFalse(json['user_type']))
        ? " "
        : json['user_type'];

    verified = (PrefUtils.isNullEmptyOrFalse(json['verified']))
        ? false
        : json['verified'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['uuid'] = this.uuid;
    data['email'] = this.email;
    data['date_joined'] = this.dateJoined;
    data['is_active'] = this.isActive;
    data['current_country'] = this.currentCountry;
    data['phone_number'] = this.phoneNumber;
    data['user_type'] = this.userType;
    data['verified'] = this.verified;
    return data;
  }
}

class CorporateProfile {
  int? department;
  int? branch;
  int? organization;
  String? organizationName;
  String? branchName;
  String? departmentName;

  CorporateProfile(
      {this.department,
      this.branch,
      this.organization,
      this.organizationName,
      this.branchName,
      this.departmentName});

  CorporateProfile.fromJson(Map<String, dynamic> json) {
    department = (PrefUtils.isNullEmptyOrFalse(json['department']))
        ? 0
        : json['department'];
    branch =
        (PrefUtils.isNullEmptyOrFalse(json['branch'])) ? 0 : json['branch'];
    organization = (PrefUtils.isNullEmptyOrFalse(json['organization']))
        ? 0
        : json['organization'];
    organizationName = (PrefUtils.isNullEmptyOrFalse(json['organization_name']))
        ? "N/A"
        : json['organization_name'];
    branchName = (PrefUtils.isNullEmptyOrFalse(json['branch_name']))
        ? "N/A"
        : json['branch_name'];
    departmentName = (PrefUtils.isNullEmptyOrFalse(json['department_name']))
        ? "N/A"
        : json['department_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['department'] = this.department;
    data['branch'] = this.branch;
    data['organization'] = this.organization;
    data['organization_name'] = this.organizationName;
    data['branch_name'] = this.branchName;
    data['department_name'] = this.departmentName;
    return data;
  }
}
