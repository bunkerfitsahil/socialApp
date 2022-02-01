import 'dart:convert';
import 'dart:io';

import 'package:connectivity/connectivity.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:social_feed_flutter/utils/progress_dialog_utils.dart';

class ApiClient extends GetConnect {
  Connectivity connectivity = Connectivity();
  static final Base_url = "https://api-staging.bunkerfit.com/api/v1/";
  static final organization = "1";

  static final token =
      "Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNjQ1NDIwOTM5LCJqdGkiOiI2MWZkMGJhMDJmMGQ0NTgyODI1ZDU3NTQzN2ViN2I0NSIsInVzZXJfaWQiOjN9.Xu3c94eWlBqveKLA7ju9-lui0otVziNKMh08MttqgEw";

  callPostCreateApi(
      {Function(dynamic data)? onSuccess,
      Function(dynamic error)? onError,
      File? file,
      String? discription}) async {
    Map<String, String> headers = {};
    headers["Content-Type"] = "multipart/form-data";

    headers["Authorization"] =
        "Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNjQ1NDIwOTM5LCJqdGkiOiI2MWZkMGJhMDJmMGQ0NTgyODI1ZDU3NTQzN2ViN2I0NSIsInVzZXJfaWQiOjN9.Xu3c94eWlBqveKLA7ju9-lui0otVziNKMh08MttqgEw";
    ProgressDialogUtils.showProgressDialog();
    try {
      // Map<String, dynamic> req = <String, dynamic>{};
      // req['post_body'] = 'dsdsd';
      // req['organization'] = 1;
      // List<int> imageBytes = file!.readAsBytesSync();
      // String base64Image = base64Encode(imageBytes);
      // req['attachment'] = MultipartFile(file, filename: file.path);
      //
      // FormData form = FormData(req);
      // final response = await post(Base_url + 'social-feed-posts/', form,
      //     contentType: "multipart/form-data", headers: headers);
      // // print(response.body);
      // // print(jsonDecode(response.body)[0]);
      // onSuccess!(response.body);
      var headers = {
        'accept': 'application/json',
        'Authorization':
            'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNjQ1NDIwOTM5LCJqdGkiOiI2MWZkMGJhMDJmMGQ0NTgyODI1ZDU3NTQzN2ViN2I0NSIsInVzZXJfaWQiOjN9.Xu3c94eWlBqveKLA7ju9-lui0otVziNKMh08MttqgEw',
        'X-CSRFToken':
            'SNQ0WMqMnmIMMdhQsWrFPGezmFZsTI5DyhZczK47dShij2iK4ectwU4RWre6PitR'
      };
      var request = http.MultipartRequest(
          'POST',
          Uri.parse(
              'https://api-staging.bunkerfit.com/api/v1/social-feed-posts/'));
      request.fields.addAll({'post_body': discription!, 'organization': "1"});
      request.files
          .add(await http.MultipartFile.fromPath('attachment', file!.path));
      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();
      if (response.statusCode == 201) {
        var resp = await http.Response.fromStream(response);
        onSuccess!(jsonDecode(resp.body));
        print(await response.stream);
      } else {
        print(response.reasonPhrase);
      }
    } catch (error) {
      ProgressDialogUtils.hideProgressDialog();
      onError!(error);
      Fluttertoast.showToast(msg: "$error");
    }
  }

  callApiForGetPosts({
    Function(dynamic data)? onSuccess,
    Function(dynamic error)? onError,
    File? file,
  }) async {
    Map<String, String> headers = {};
    headers["Content-Type"] = "application/json";

    headers["Authorization"] = token;
    ProgressDialogUtils.showProgressDialog();
    try {
      final response = await get(Base_url + 'social-feed-posts/',
          contentType: "application/json", headers: headers);

      onSuccess!(response.body);
    } catch (error) {
      ProgressDialogUtils.hideProgressDialog();
      onError!(error);
      Fluttertoast.showToast(msg: "$error");
    }
  }

  callApiForGetPostsComment({
    Function(dynamic data)? onSuccess,
    Function(dynamic error)? onError,
    int? id,
  }) async {
    Map<String, String> headers = {};
    headers["Content-Type"] = "application/json";

    headers["Authorization"] = token;
    // ProgressDialogUtils.showProgressDialog();
    try {
      final response = await get(Base_url + 'social-feed-comments/?post_id=$id',
          contentType: "application/json", headers: headers);

      onSuccess!(response.body);
    } catch (error) {
      // ProgressDialogUtils.hideProgressDialog();
      onError!(error);
      Fluttertoast.showToast(msg: "$error");
    }
  }

  callApiForGetUsersData({
    Function(dynamic data)? onSuccess,
    Function(dynamic error)? onError,
    int? id,
  }) async {
    Map<String, String> headers = {};
    headers["Content-Type"] = "application/json";

    headers["Authorization"] = token;
    //ProgressDialogUtils.showProgressDialog();
    try {
      final response = await get(Base_url + 'user-profile/$id',
          contentType: "application/json", headers: headers);

      onSuccess!(response.body);
    } catch (error) {
      //ProgressDialogUtils.hideProgressDialog();
      onError!(error);
      Fluttertoast.showToast(msg: "$error");
    }
  }

  callApiForCreatePostsComment({
    Function(dynamic data)? onSuccess,
    Function(dynamic error)? onError,
    String? message,
    int? id,
  }) async {
    Map<String, String> headers = {};
    headers["Content-Type"] = "application/json";

    headers["Authorization"] = token;
    Map<String, dynamic> data = {};
    data["post"] = id;
    data["comment_body"] = message;
    data["parent"] = null;

    //ProgressDialogUtils.showProgressDialog();
    try {
      final response = await post(Base_url + 'social-feed-comments/', data,
          contentType: "application/json", headers: headers);

      onSuccess!(response.body);
    } catch (error) {
      //ProgressDialogUtils.hideProgressDialog();
      onError!(error);
      Fluttertoast.showToast(msg: "$error");
    }
  }
}
