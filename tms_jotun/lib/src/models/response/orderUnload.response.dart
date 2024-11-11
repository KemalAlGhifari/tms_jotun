class OrderUnload {
  int? status;
  String? message;
  int? total;
  List<Data>? data;
  String? sId;

  OrderUnload({this.status, this.message, this.total, this.data, this.sId});

  OrderUnload.fromJson(Map<String, dynamic> json) {
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
  String? customerPoNo;
  String? realShipmentId;
  String? shipmentId;
  String? partNo;
  String? partDescription;
  int? qty;
  Null? qtyReceived;
  Null? remarks;
  int? orderStatus;
  String? aopid;
  Null? resi;

  Data(
      {this.customerPoNo,
      this.realShipmentId,
      this.shipmentId,
      this.partNo,
      this.partDescription,
      this.qty,
      this.qtyReceived,
      this.remarks,
      this.orderStatus,
      this.aopid,
      this.resi});

  Data.fromJson(Map<String, dynamic> json) {
    customerPoNo = json['customer_po_no'];
    realShipmentId = json['real_shipment_id'];
    shipmentId = json['shipment_id'];
    partNo = json['part_no'];
    partDescription = json['part_description'];
    qty = json['qty'];
    qtyReceived = json['qty_received'];
    remarks = json['remarks'];
    orderStatus = json['order_status'];
    aopid = json['aopid'];
    resi = json['resi'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['customer_po_no'] = this.customerPoNo;
    data['real_shipment_id'] = this.realShipmentId;
    data['shipment_id'] = this.shipmentId;
    data['part_no'] = this.partNo;
    data['part_description'] = this.partDescription;
    data['qty'] = this.qty;
    data['qty_received'] = this.qtyReceived;
    data['remarks'] = this.remarks;
    data['order_status'] = this.orderStatus;
    data['aopid'] = this.aopid;
    data['resi'] = this.resi;
    return data;
  }
}