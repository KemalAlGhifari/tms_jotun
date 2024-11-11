class TicketResponse {
  int? status;
  String? message;
  int? total;
  List<Data>? data;
  String? sId;

  TicketResponse({this.status, this.message, this.total, this.data, this.sId});

  TicketResponse.fromJson(Map<String, dynamic> json) {
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
  String? shipmentId;
  int? orderStatus;
  int? totalProduk;
  String? deliverySchedule;
  Null? countpod;

  Data(
      {this.shipmentId,
      this.orderStatus,
      this.totalProduk,
      this.deliverySchedule,
      this.countpod});

  Data.fromJson(Map<String, dynamic> json) {
    shipmentId = json['shipment_id'];
    orderStatus = json['order_status'];
    totalProduk = json['total_produk'];
    deliverySchedule = json['delivery_schedule'];
    countpod = json['countpod'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['shipment_id'] = this.shipmentId;
    data['order_status'] = this.orderStatus;
    data['total_produk'] = this.totalProduk;
    data['delivery_schedule'] = this.deliverySchedule;
    data['countpod'] = this.countpod;
    return data;
  }
}