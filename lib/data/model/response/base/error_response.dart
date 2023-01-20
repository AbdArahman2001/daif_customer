/// errors : [{"code":"l_name","message":"The last name field is required."},{"code":"password","message":"The password field is required."}]

class ErrorResponse {
 late List<Error>? errors;


  ErrorResponse(this.errors);

  ErrorResponse.fromJson(dynamic json) {
    if (json["errors"] != null) {
      errors = [];
      json["errors"].forEach((e) {
        errors!.add(Error.fromJson(e));
      });
    }
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    if (errors != null) {
      map["errors"] = errors!.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

/// code : "l_name"
/// message : "The last name field is required."

class Error {
  late String code;
  late String message;

  Error({required String code, required String message});

  Error.fromJson(Map<String, dynamic> json) {
    code = json["code"];
    message = json["message"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["code"] = code;
    map["message"] = message;
    return map;
  }
}
