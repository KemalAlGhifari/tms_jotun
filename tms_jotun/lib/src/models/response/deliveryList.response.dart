class DeliveryList {
  int? status;
  String? message;
  int? total;
  List<DataDelivery>? data;
  String? sId;

  DeliveryList({this.status, this.message, this.total, this.data, this.sId});

  DeliveryList.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    total = json['total'];
    if (json['data'] != null) {
      data = <DataDelivery>[];
      json['data'].forEach((v) {
        data!.add(new DataDelivery.fromJson(v));
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

class DataDelivery {
  String? sRowNumber;
  String? customerNo;
  String? customerName;
  int? orderStatus;
  String? isUsingApps;
  String? deliverySchedule;
  Null? feedbackStar;
  int? minRouteOrder;
  String? orderStatusName;
  String? assignmentId;

  DataDelivery(
      {this.sRowNumber,
      this.customerNo,
      this.customerName,
      this.orderStatus,
      this.isUsingApps,
      this.deliverySchedule,
      this.feedbackStar,
      this.minRouteOrder,
      this.orderStatusName,
      this.assignmentId});

  DataDelivery.fromJson(Map<String, dynamic> json) {
    sRowNumber = json['_row_number'];
    customerNo = json['customer_no'];
    customerName = json['customer_name'];
    orderStatus = json['order_status'];
    isUsingApps = json['is_using_apps'];
    deliverySchedule = json['delivery_schedule'];
    feedbackStar = json['feedback_star'];
    minRouteOrder = json['min_route_order'];
    orderStatusName = json['order_status_name'];
    assignmentId = json['assignment_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_row_number'] = this.sRowNumber;
    data['customer_no'] = this.customerNo;
    data['customer_name'] = this.customerName;
    data['order_status'] = this.orderStatus;
    data['is_using_apps'] = this.isUsingApps;
    data['delivery_schedule'] = this.deliverySchedule;
    data['feedback_star'] = this.feedbackStar;
    data['min_route_order'] = this.minRouteOrder;
    data['order_status_name'] = this.orderStatusName;
    data['assignment_id'] = this.assignmentId;
    return data;
  }
}