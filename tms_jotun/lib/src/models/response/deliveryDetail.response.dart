class DeliveryDetail {
  int? status;
  String? message;
  int? total;
  List<Data>? data;
  String? sId;

  DeliveryDetail({this.status, this.message, this.total, this.data, this.sId});

  DeliveryDetail.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    total = json['total'];
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
    data['total'] = this.total;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['_id'] = this.sId;
    return data;
  }
}

class Data {
  String? customerName;
  String? customerAddress;
  Null? cpName;
  Null? mobile;
  int? orderStatus;
  Null? issuesId;
  Null? deliveryIssueType;
  Null? deliveryIssueTypeId;
  String? assignmentId;
  String? route;
  double? latitude;
  double? longitude;
  Null? mmsiCode;
  Null? mmsiName;
  Null? transit;
  String? remaining;
  Null? latitudeStart;
  Null? longitudeStart;
  Null? latitudeLatest;
  Null? longitudeLatest;

  Data(
      {this.customerName,
      this.customerAddress,
      this.cpName,
      this.mobile,
      this.orderStatus,
      this.issuesId,
      this.deliveryIssueType,
      this.deliveryIssueTypeId,
      this.assignmentId,
      this.route,
      this.latitude,
      this.longitude,
      this.mmsiCode,
      this.mmsiName,
      this.transit,
      this.remaining,
      this.latitudeStart,
      this.longitudeStart,
      this.latitudeLatest,
      this.longitudeLatest});

  Data.fromJson(Map<String, dynamic> json) {
    customerName = json['customer_name'];
    customerAddress = json['customer_address'];
    cpName = json['cp_name'];
    mobile = json['mobile'];
    orderStatus = json['order_status'];
    issuesId = json['issues_id'];
    deliveryIssueType = json['delivery_issue_type'];
    deliveryIssueTypeId = json['delivery_issue_type_id'];
    assignmentId = json['assignment_id'];
    route = json['route'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    mmsiCode = json['mmsi_code'];
    mmsiName = json['mmsi_name'];
    transit = json['transit'];
    remaining = json['remaining'];
    latitudeStart = json['latitudeStart'];
    longitudeStart = json['longitudeStart'];
    latitudeLatest = json['latitudeLatest'];
    longitudeLatest = json['longitudeLatest'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['customer_name'] = this.customerName;
    data['customer_address'] = this.customerAddress;
    data['cp_name'] = this.cpName;
    data['mobile'] = this.mobile;
    data['order_status'] = this.orderStatus;
    data['issues_id'] = this.issuesId;
    data['delivery_issue_type'] = this.deliveryIssueType;
    data['delivery_issue_type_id'] = this.deliveryIssueTypeId;
    data['assignment_id'] = this.assignmentId;
    data['route'] = this.route;
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    data['mmsi_code'] = this.mmsiCode;
    data['mmsi_name'] = this.mmsiName;
    data['transit'] = this.transit;
    data['remaining'] = this.remaining;
    data['latitudeStart'] = this.latitudeStart;
    data['longitudeStart'] = this.longitudeStart;
    data['latitudeLatest'] = this.latitudeLatest;
    data['longitudeLatest'] = this.longitudeLatest;
    return data;
  }
}