class DishModel {
  int? id;
  String? name;
  String? description;
  String? image;
  String? categoryDish;
  double? price;

  DishModel({
    this.id,
    this.name,
    this.description,
    this.image,
    this.categoryDish,
    this.price
  });

  DishModel.fromJson(Map<String, dynamic> json) {
    id            = json["id"];
    name          = json["name"];
    description   = json["description"];
    image         = json["image"];
    categoryDish  = json["category_dish"];
    price         = json["price"];
  }

  Map<String, dynamic> toJson() => {
    "id"            : id,
    "name"          : name,
    "description"   : description,
    "image"         : image,
    "category_dish" : categoryDish,
    "price"         : price
  };
}