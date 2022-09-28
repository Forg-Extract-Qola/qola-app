class EmployeeModel {
  EmployeeModel({
    this.id,
    this.uid,
    this.fullName,
    this.charge,
    this.restaurantId,
  });

  int? id;
  String? uid;
  String? fullName;
  String? charge;
  int? restaurantId;

  EmployeeModel.fromJson(Map<String, dynamic> json){
    id = json["id"];
    uid = json["uid"];
    fullName = json["fullName"];
    charge = json["charge"];
    restaurantId = json["restaurantId"];
  }

  Map<String, dynamic> toJson() => {
    "id": id,
    "uid": uid,
    "fullName": fullName,
    "charge": charge,
    "restaurantId": restaurantId,
  };
}
