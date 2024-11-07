class MmsiRequest {
  final String mmsiCode;
  final String mmsiName;
  final int transit;
  final String assignmentOrderId;

  MmsiRequest({
    required this.mmsiCode,
    required this.mmsiName,
    required this.transit,
    required this.assignmentOrderId,
  });

  Map<String, dynamic> toJson() {
    return {
      'mmsi_code': mmsiCode,
      'mmsi_name': mmsiName,
      'transit': transit,
      'assignment_order_id': assignmentOrderId,
    };
  }
}
