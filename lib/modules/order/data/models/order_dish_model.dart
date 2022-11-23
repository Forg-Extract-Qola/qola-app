class OrderDishModel {
  int? id;
  int? orderId;
  int? dishId;

  OrderDishModel({
    this.id,
    this.orderId,
    this.dishId
  });

  OrderDishModel.fromJson(Map<String, dynamic> json) {
    id      = json["id"];
    orderId = json["orderId"];
    dishId  = json["dishId"];
  }
}