class CategoryModel {
  final String name;
  final String image;
  CategoryModel({required this.name, required this.image});
}

class ProductModel {
  final String name;
  final String image;
  final String price;
  final String rate;
  final String ratecount;
  ProductModel(
    this.price,
    this.rate,
    this.ratecount, {
    required this.name,
    required this.image,
  });
}
