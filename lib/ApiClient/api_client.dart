import 'dart:convert';
import 'dart:io';

import 'package:connectivity/connectivity.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:social_feed_flutter/utils/progress_dialog_utils.dart';

import 'exception_handler.dart';

class ApiClient extends GetConnect {
  Connectivity connectivity = Connectivity();
  static final Base_url = "https://api-staging.bunkerfit.com/api/v1/";
  static final organization = "1";

  static final token =
      "Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNjQ2NzExNDM3LCJqdGkiOiI0M2ExMzhlMzllMjk0ZGM2YjcyNjRkODZiNGEwNDM1NSIsInVzZXJfaWQiOjN9.bcjPUI6bCniBz90Rpj8cd7ngLO7rX8xZGvCVZKbfuD8";

  callPostCreateApi(
      {Function(dynamic data)? onSuccess,
      Function(dynamic error)? onError,
      File? file,
      String? fileType,
      String? discription}) async {
    Map<String, String> headers = {};
    headers["Content-Type"] = "multipart/form-data";

    headers["Authorization"] = token;
    ProgressDialogUtils.showProgressDialog();
    try {
      var headers = {
        'accept': 'application/json',
        'Authorization': token,
        'X-CSRFToken':
            'SNQ0WMqMnmIMMdhQsWrFPGezmFZsTI5DyhZczK47dShij2iK4ectwU4RWre6PitR'
      };
      var request = http.MultipartRequest(
          'POST',
          Uri.parse(
              'https://api-staging.bunkerfit.com/api/v1/social-feed-posts/'));
      request.fields.addAll({
        'post_body': discription!,
        'organization': "1",
        "file_type": fileType!
      });
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
      String msg =
          ExceptionWrapper(DionewExceptions.getExceptions(error)).message;
      ProgressDialogUtils.hideProgressDialog();
      onError!(msg);
      Fluttertoast.showToast(msg: msg);
    }
  }

  callApiForGetPosts({
    Function(dynamic data)? onSuccess,
    Function(dynamic error)? onError,
    File? file,
    bool? isLoad,
    int? page,
  }) async {
    Map<String, String> headers = {};
    headers["Content-Type"] = "application/json";

    headers["Authorization"] = token;
    (isLoad) {
      ProgressDialogUtils.showProgressDialog();
    };
    try {
      final response = await get(Base_url + 'social-feed-posts/?page=$page',
          contentType: "application/json", headers: headers);

      onSuccess!(response.body);
    } catch (error) {
      String msg =
          ExceptionWrapper(DionewExceptions.getExceptions(error)).message;
      (isLoad) {
        ProgressDialogUtils.hideProgressDialog();
      };
      onError!(msg);
      Fluttertoast.showToast(msg: msg);
    }
  }

  callApiForGetPostsById({
    Function(dynamic data)? onSuccess,
    Function(dynamic error)? onError,
    bool? isLoad,
    int? id,
  }) async {
    Map<String, String> headers = {};
    headers["Content-Type"] = "application/json";

    headers["Authorization"] = token;
    (isLoad) {
      ProgressDialogUtils.showProgressDialog();
    };
    try {
      final response = await get(
          Base_url + 'social-feed-posts/?user__userprofile__id=$id',
          contentType: "application/json",
          headers: headers);

      onSuccess!(response.body);
    } catch (error) {
      String msg =
          ExceptionWrapper(DionewExceptions.getExceptions(error)).message;
      (isLoad) {
        ProgressDialogUtils.hideProgressDialog();
      };
      onError!(msg);
      Fluttertoast.showToast(msg: msg);
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
      String msg =
          ExceptionWrapper(DionewExceptions.getExceptions(error)).message;

      onError!(msg);
      Fluttertoast.showToast(msg: msg);
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
      String msg =
          ExceptionWrapper(DionewExceptions.getExceptions(error)).message;
      onError!(msg);
      Fluttertoast.showToast(msg: msg);
    }
  }

  callApiForCreatePostsComment({
    Function(dynamic data)? onSuccess,
    Function(dynamic error)? onError,
    String? message,
    int? id,
    int? parentId,
  }) async {
    Map<String, String> headers = {};
    headers["Content-Type"] = "application/json";

    headers["Authorization"] = token;
    Map<String, dynamic> data = {};
    data["post"] = id;
    data["comment_body"] = message;
    data["parent"] = parentId;

    //ProgressDialogUtils.showProgressDialog();
    try {
      final response = await post(Base_url + 'social-feed-comments/', data,
          contentType: "application/json", headers: headers);

      onSuccess!(response.body);
    } catch (error) {
      //ProgressDialogUtils.hideProgressDialog();
      String msg =
          ExceptionWrapper(DionewExceptions.getExceptions(error)).message;
      onError!(msg);
      Fluttertoast.showToast(msg: msg);
    }
  }

  callApiForPostLike({
    int? id,
    Function(dynamic data)? onSuccess,
    Function(dynamic error)? onError,
  }) async {
    Map<String, String> headers = {};
    headers["Content-Type"] = "application/json";

    headers["Authorization"] = token;
    //ProgressDialogUtils.showProgressDialog();
    Map<String, dynamic> data = {};
    data["post"] = id;

    try {
      final response = await post(Base_url + 'social-feed-post-likes/', data,
          contentType: "application/json", headers: headers);
      if (response.statusCode == 201) {
        onSuccess!(response.body);
      } else {
        onSuccess!(null);
      }
    } catch (error) {
      //ProgressDialogUtils.hideProgressDialog();
      String msg =
          ExceptionWrapper(DionewExceptions.getExceptions(error)).message;
      onError!(msg);
      Fluttertoast.showToast(msg: msg);
    }
  }

  callApiForDeletePostLike({
    int? id,
    Function(dynamic data)? onSuccess,
    Function(dynamic error)? onError,
  }) async {
    Map<String, String> headers = {};
    headers["Content-Type"] = "application/json";

    headers["Authorization"] = token;
    //ProgressDialogUtils.showProgressDialog();

    try {
      final response = await delete(Base_url + 'social-feed-post-likes/$id/',
          contentType: "application/json", headers: headers);
      if (response.statusCode == 204) {
        onSuccess!(true);
      } else {
        onSuccess!(null);
      }
    } catch (error) {
      //ProgressDialogUtils.hideProgressDialog();
      String msg =
          ExceptionWrapper(DionewExceptions.getExceptions(error)).message;
      onError!(msg);
      Fluttertoast.showToast(msg: msg);
    }
  }

  callApiForCommentLike({
    int? id,
    Function(dynamic data)? onSuccess,
    Function(dynamic error)? onError,
  }) async {
    Map<String, String> headers = {};
    headers["Content-Type"] = "application/json";

    headers["Authorization"] = token;
    //ProgressDialogUtils.showProgressDialog();
    Map<String, dynamic> data = {};
    data["comment"] = id;

    try {
      final response = await post(Base_url + 'social-feed-comment-likes/', data,
          contentType: "application/json", headers: headers);
      if (response.statusCode == 201) {
        onSuccess!(response.body);
      } else {
        onSuccess!(null);
      }
    } catch (error) {
      //ProgressDialogUtils.hideProgressDialog();
      String msg =
          ExceptionWrapper(DionewExceptions.getExceptions(error)).message;
      onError!(msg);
      Fluttertoast.showToast(msg: msg);
    }
  }

  callApiForDeleteCommentLike({
    int? id,
    Function(dynamic data)? onSuccess,
    Function(dynamic error)? onError,
  }) async {
    Map<String, String> headers = {};
    headers["Content-Type"] = "application/json";

    headers["Authorization"] = token;
    //ProgressDialogUtils.showProgressDialog();

    try {
      final response = await delete(Base_url + 'social-feed-comment-likes/$id/',
          contentType: "application/json", headers: headers);
      if (response.statusCode == 204) {
        onSuccess!(true);
      } else {
        onSuccess!(null);
      }
    } catch (error) {
      //ProgressDialogUtils.hideProgressDialog();
      String msg =
          ExceptionWrapper(DionewExceptions.getExceptions(error)).message;
      onError!(msg);
      Fluttertoast.showToast(msg: msg);
    }
  }

  callApiForGetPendingRequest({
    Function(dynamic data)? onSuccess,
    Function(dynamic error)? onError,
  }) async {
    Map<String, String> headers = {};
    headers["Content-Type"] = "application/json";

    headers["Authorization"] = token;
    ProgressDialogUtils.showProgressDialog();
    try {
      final response = await get(
          Base_url + 'user/profile-actions/followrequests/pending',
          contentType: "application/json",
          headers: headers);
      if (response.statusCode == 200) {
        ProgressDialogUtils.hideProgressDialog();

        onSuccess!(response.body);
      }
    } catch (error) {
      String msg =
          ExceptionWrapper(DionewExceptions.getExceptions(error)).message;
      ProgressDialogUtils.hideProgressDialog();
      onError!(msg);
      Fluttertoast.showToast(msg: msg);
    }
  }

  callApiForGetFollowerData({
    Function(dynamic data)? onSuccess,
    Function(dynamic error)? onError,
  }) async {
    Map<String, String> headers = {};
    headers["Content-Type"] = "application/json";

    headers["Authorization"] = token;
    ProgressDialogUtils.showProgressDialog();
    try {
      final response = await get(
          Base_url + 'user/profile-actions/followrequests/get-followers/',
          contentType: "application/json",
          headers: headers);
      if (response.statusCode == 200) {
        ProgressDialogUtils.hideProgressDialog();

        onSuccess!(response.body);
      } else {
        ProgressDialogUtils.hideProgressDialog();
      }
    } catch (error) {
      String msg =
          ExceptionWrapper(DionewExceptions.getExceptions(error)).message;
      ProgressDialogUtils.hideProgressDialog();
      onError!(msg);
      Fluttertoast.showToast(msg: msg);
    }
  }

  callApiForGetFollowingData({
    Function(dynamic data)? onSuccess,
    Function(dynamic error)? onError,
  }) async {
    Map<String, String> headers = {};
    headers["Content-Type"] = "application/json";

    headers["Authorization"] = token;
    ProgressDialogUtils.showProgressDialog();
    try {
      final response = await get(
          Base_url + 'user/profile-actions/followrequests/get-following/',
          contentType: "application/json",
          headers: headers);
      if (response.statusCode == 200) {
        ProgressDialogUtils.hideProgressDialog();

        onSuccess!(response.body);
      } else {
        ProgressDialogUtils.hideProgressDialog();
      }
    } catch (error) {
      String msg =
          ExceptionWrapper(DionewExceptions.getExceptions(error)).message;
      ProgressDialogUtils.hideProgressDialog();
      onError!(msg);
      Fluttertoast.showToast(msg: msg);
    }
  }

  callApiForAceepOrRejectRequest({
    Function(dynamic data)? onSuccess,
    Function(dynamic error)? onError,
    String? acceptOrReject,
    int? id,
  }) async {
    Map<String, String> headers = {};
    headers["Content-Type"] = "application/json";

    headers["Authorization"] = token;
    Map<String, dynamic> data = {};
    data["follow_request_id"] = id;
    data["user_input"] = acceptOrReject;

    ProgressDialogUtils.showProgressDialog();
    try {
      final response = await patch(
          Base_url + 'user/profile-actions/followrequests/confirm/', data,
          contentType: "application/json", headers: headers);
      if (response.statusCode == 200) {
        onSuccess!(response.body);
        ProgressDialogUtils.hideProgressDialog();
      } else {
        ProgressDialogUtils.hideProgressDialog();

        onError!(response.statusCode);
      }
    } catch (error) {
      ProgressDialogUtils.hideProgressDialog();
      String msg =
          ExceptionWrapper(DionewExceptions.getExceptions(error)).message;
      onError!(msg);
      Fluttertoast.showToast(msg: msg);
    }
  }

  callApiForSendRequest({
    Function(dynamic data)? onSuccess,
    Function(dynamic error)? onError,
    int? id,
  }) async {
    Map<String, String> headers = {};
    headers["Content-Type"] = "application/json";

    headers["Authorization"] = token;
    Map<String, dynamic> data = {};
    data["followee_id"] = id;

    ProgressDialogUtils.showProgressDialog();
    try {
      final response = await post(
          Base_url + 'user/profile-actions/followrequests/follow/', data,
          contentType: "application/json", headers: headers);
      if (response.statusCode == 200) {
        onSuccess!(response.body);
        ProgressDialogUtils.hideProgressDialog();
      } else if (response.statusCode == 409) {
        ProgressDialogUtils.hideProgressDialog();
        Fluttertoast.showToast(msg: "request already sent.");
        onError!(response.statusCode);
      }
    } catch (error) {
      ProgressDialogUtils.hideProgressDialog();
      String msg =
          ExceptionWrapper(DionewExceptions.getExceptions(error)).message;
      onError!(msg);
      Fluttertoast.showToast(msg: msg);
    }
  }
}
