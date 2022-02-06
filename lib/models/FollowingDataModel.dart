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
    profilePicture = json['profile_picture'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    gender = json['gender'];
    location = json['location'];
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
