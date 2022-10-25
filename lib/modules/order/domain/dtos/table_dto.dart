class TableDto {
  int? id;
  String? name;
  bool? isOccupied;
  int? restaurantId;
  TableDto({
    this.id,
    this.name,
    this.isOccupied,
    this.restaurantId,
  });

  String getTableName() {
    return name!;
  }

  void changeTableName(String name) {
    this.name = name;
  }

  bool getTableOccupied() {
    return isOccupied!;
  }

  void changeTableOccupied(bool isOccupied) {
    this.isOccupied = isOccupied;
  }
}
