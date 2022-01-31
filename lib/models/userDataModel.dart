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
  String? parent;
  List<String>? children;
  String? preferredLanguage;
  CorporateProfile? corporateProfile;

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
    height = json['height'];
    weight = json['weight'];
    profilePicture = json['profile_picture'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
    gender = json['gender'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    if (json['goals'] != null) {
      goals = <String>[];
      json['goals'].forEach((v) {
        goals!.add(v);
      });
    }
    dateOfBirth = json['date_of_birth'];
    age = json['age'];
    bmi = json['bmi'];
    bio = json['bio'];
    followerCount = json['follower_count'];
    followingCount = json['following_count'];
    parent = json['parent'];
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
    data['profile_picture'] = this.profilePicture;
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
    id = json['id'];
    uuid = json['uuid'];
    email = json['email'];
    dateJoined = json['date_joined'];
    isActive = json['is_active'];
    currentCountry = json['current_country'];
    phoneNumber = json['phone_number'];
    userType = json['user_type'];
    verified = json['verified'];
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

  CorporateProfile({this.department, this.branch, this.organization});

  CorporateProfile.fromJson(Map<String, dynamic> json) {
    department = json['department'];
    branch = json['branch'];
    organization = json['organization'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['department'] = this.department;
    data['branch'] = this.branch;
    data['organization'] = this.organization;
    return data;
  }
}
