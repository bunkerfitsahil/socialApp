import 'dart:convert';

import 'package:connectivity/connectivity.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:social_feed_flutter/utils/progress_dialog_utils.dart';

class ApiClient extends GetConnect {
  Connectivity connectivity = Connectivity();

  callLogInApi({
    Function(dynamic data)? onSuccess,
    Function(dynamic error)? onError,
  }) async {
    Map<String, String> headers = {"Content-Type": "multipart/form-data"};
    ProgressDialogUtils.showProgressDialog();
    try {
      Map<String, dynamic> req = <String, dynamic>{};
      req['txt_username'] = 'admin';
      req['txt_password'] = 'admin';
      final form = FormData(req);
      final response = await post(
          "https://hofficedemo4.ondemandcrm.co/AppRequestAPI", form,
          contentType: "multipart/form-data", headers: headers);
      print(response.body);
      print(jsonDecode(response.body)[0]);
      onSuccess!(jsonDecode(response.body)[0]);
    } catch (error) {
      ProgressDialogUtils.hideProgressDialog();
      onError!(error);
      Fluttertoast.showToast(msg: "$error");
    }
  }
}
