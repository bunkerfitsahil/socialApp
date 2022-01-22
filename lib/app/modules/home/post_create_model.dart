class CreatePostResp {
  int? id;
  String? updatedAt;
  String? createdAt;
  String? postUuid;
  String? postBody;
  String? attachment;
  int? organization;

  CreatePostResp(
      {this.id,
      this.updatedAt,
      this.createdAt,
      this.postUuid,
      this.postBody,
      this.attachment,
      this.organization});

  CreatePostResp.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    updatedAt = json['updated_at'];
    createdAt = json['created_at'];
    postUuid = json['post_uuid'];
    postBody = json['post_body'];
    attachment = json['attachment'];
    organization = json['organization'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['updated_at'] = this.updatedAt;
    data['created_at'] = this.createdAt;
    data['post_uuid'] = this.postUuid;
    data['post_body'] = this.postBody;
    data['attachment'] = this.attachment;
    data['organization'] = this.organization;
    return data;
  }
}
