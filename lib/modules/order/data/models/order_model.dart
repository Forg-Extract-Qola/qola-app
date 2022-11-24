import 'package:qola_app/core/utils/helper.dart';

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
    total     = Helper.convertNumber(json["total"].toString()).toDouble();
    waiterId  = json["waiterId"];
    tableId   = json["tableId"];
  }

  Map<String, dynamic> toJson() => {
    "status"    : status,
    "notes"     : notes
  };
}