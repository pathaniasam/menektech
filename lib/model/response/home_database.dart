class HomeDatabase {
  int? productID;
  int? price;
  int? quantity;
  String? title;
  String? image;

  Map<dynamic, dynamic> toMap() {
    var map = <dynamic, dynamic>{
      productID: productID,
      price: price,
      title: title,
      image: image,
      quantity: quantity,
    };
    if (productID != null) {
      map[productID] = productID;
    }
    return map;
  }

  HomeDatabase();

  HomeDatabase.fromMap(Map<String, dynamic> map) {
    productID = map["productID"];
    price = map["price"];
    title = map["title"];
    image = map["image"];
    quantity = map["quantity"];
  }
}
