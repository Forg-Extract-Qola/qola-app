import 'package:hive/hive.dart';
import 'package:qola_app/core/base/reflection.dart';

part 'employee_entity.g.dart';

@reflector
@HiveType(typeId: 0)
class EmployeeEntity extends HiveObject {
  @HiveField(0)
  int? id;
  @HiveField(1)
  String? uid;
  @HiveField(2)
  String? fullName;
  @HiveField(3)
  String? charge;
  @HiveField(4)
  int? restaurantId;

  EmployeeEntity({
    this.id,
    this.uid,
    this.fullName,
    this.charge,
    this.restaurantId,
  });

  EmployeeEntity.fromJson(Map<String, dynamic> json){
    id            = json["id"];
    uid           = json["uid"];
    fullName      = json["fullName"];
    charge        = json["charge"];
    restaurantId  = json["restaurantId"];
  }

  Map<String, dynamic> toJson() => {
    "id": id,
    "uid": uid,
    "fullName": fullName,
    "charge": charge,
    "restaurantId": restaurantId,
  };
}