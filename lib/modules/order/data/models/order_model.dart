class OrderModel {
  int? id;
  String? status;
  String? notes;
  double? total;
  int? waiterId;
  int? tableId;

  OrderModel({
    this.id,
    this.status,
    this.notes,
    this.total,
    this.waiterId,
    this.tableId
  });

  OrderModel.fromJson(Map<String, dynamic> json) {
    id        = json["id"];
    status    = json["status"];
    notes     = json["notes"];
    total     = json["total"];
    waiterId  = json["waiterId"];
    tableId   = json["tableId"];
  }

  Map<String, dynamic> toJson() => {
    "status"    : status,
    "notes"     : notes
  };
}