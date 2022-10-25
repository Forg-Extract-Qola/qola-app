class TableModel {
  TableModel({this.id, this.name, this.isOccupied, this.restaurantId});

  int? id;
  String? name;
  bool? isOccupied;
  int? restaurantId;

  TableModel.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    name = json["name"];
    isOccupied = json["isOcupied"];
    restaurantId = json["restaurantId"];
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "isOcupied": isOccupied,
        "restaurantId": restaurantId
      };
  Map<String, dynamic> toSaveResource() =>
      {"name": name, "isOcupied": isOccupied};
}
