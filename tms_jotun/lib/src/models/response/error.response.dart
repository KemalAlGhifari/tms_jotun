import 'dart:convert';

class ErrorLog {
  int? status;
  String? message;
  String? trace;
  String? sId;
  List<ErrorDetails> errorDetails = []; // List to hold multiple error details

  ErrorLog({this.status, this.message, this.trace, this.sId, required this.errorDetails});

  // Modify the fromJson constructor to parse 'trace' and extract all error details
  ErrorLog.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    trace = json['trace'];
    sId = json['_id'];

    // Decode the trace string to a Map and extract error details
    if (trace != null) {
      try {
        var traceData = jsonDecode(trace!); // Decode the trace field
        if (traceData is Map<String, dynamic> && traceData['error'] != null) {
          var errorList = traceData['error'];
          if (errorList is List) {
            // Loop through all errors and extract details
            for (var error in errorList) {
              if (error is Map<String, dynamic>) {
                errorDetails.add(ErrorDetails.fromJson(error));
              }
            }
          }
        }
      } catch (e) {
        print("Failed to parse trace field: $e");
      }
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    data['trace'] = this.trace;
    data['_id'] = this.sId;
    return data;
  }
}

// Class to hold the error details
class ErrorDetails {
  String? code;
  List<dynamic>? param;
  String? enMsg;

  ErrorDetails({this.code, this.param, this.enMsg});

  // Constructor to create ErrorDetails from JSON
  ErrorDetails.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    param = json['param'];
    enMsg = json['en_msg'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['param'] = this.param;
    data['en_msg'] = this.enMsg;
    return data;
  }
}
