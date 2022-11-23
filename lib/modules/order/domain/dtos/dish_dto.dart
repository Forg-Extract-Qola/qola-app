class DishDto {
  int? id;
  String? name;
  String? description;
  String? image;
  String? categoryDish;
  double? price;

  DishDto({
    this.id,
    this.name,
    this.description,
    this.image,
    this.categoryDish,
    this.price,
  });

  String getDishName() {
    return name!;
  }

  void changeDishName(String name) {
    this.name = name;
  }

  String getDishDescription() {
    return description!;
  }

  void changeDishDescription(String description) {
    this.description = description;
  }

  String getDishImage() {
    return image!;
  }

  void changeDishImage(String image) {
    this.image = image;
  }

  String getDishCategory() {
    return categoryDish!;
  }

  void changeDishCategory(String categoryDish) {
    this.categoryDish = categoryDish;
  }

  double getDishPrice() {
    return price!;
  }

  void changeDishPrice(double price) {
    this.price = price;
  }

}