import 'package:hive/hive.dart';
import 'package:qola_app/core/base/reflection.dart';

part 'table_entity.g.dart';

@reflector
@HiveType(typeId: 1)
class TableEntity extends HiveObject {
  @HiveField(0)
  int? id;
  @HiveField(1)
  String? name;
  @HiveField(2)
  bool? isOccupied;
  @HiveField(3)
  int? restaurantId;

  TableEntity({
    this.id,
    this.name,
    this.isOccupied,
    this.restaurantId
  });

  TableEntity.fromJson(Map<String, dynamic> json) {
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
}