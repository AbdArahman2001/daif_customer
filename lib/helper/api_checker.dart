import 'package:flutter/material.dart';

import '../data/model/response/base/api_response.dart';


class ApiChecker {
  // called when an exception occurred to navigate to auth_screen or show error snackBar.
  static void checkApi(BuildContext context, ApiResponse apiResponse) {
    if(apiResponse.error is! String && apiResponse.error.errors[0].message == 'Unauthorized.') {
      // Provider.of<ProfileProvider>(context,listen: false).clearHomeAddress();
      // Provider.of<ProfileProvider>(context,listen: false).clearOfficeAddress();
      // Provider.of<AuthProvider>(context,listen: false).clearSharedData();
      // Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => AuthScreen()), (route) => false);
    }else {
      String _errorMessage;
      if (apiResponse.error is String) {
        _errorMessage = apiResponse.error.toString();
      } else {
        _errorMessage = apiResponse.error.errors[0].message;
      }
      print(_errorMessage);
     ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(_errorMessage, style: TextStyle(color: Colors.white)), backgroundColor: Colors.red));
    }
  }
}