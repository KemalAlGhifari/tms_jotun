class Trouble {
  int? status;
  String? message;
  List<Data>? data;
  String? sId;

  Trouble({this.status, this.message, this.data, this.sId});

  Trouble.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
    sId = json['_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['_id'] = this.sId;
    return data;
  }
}

class Data {
  int? id;
  String? issuesId;
  String? deliveryIssueType;

  Data({this.id, this.issuesId, this.deliveryIssueType});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    issuesId = json['issues_id'];
    deliveryIssueType = json['delivery_issue_type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['issues_id'] = this.issuesId;
    data['delivery_issue_type'] = this.deliveryIssueType;
    return data;
  }
}