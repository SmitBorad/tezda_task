class Product {
  final String? name;
  final double? price;
  final String? imageUrl;
  final String? discription;
  final String? category;
  final double? rate;

  Product({this.name, this.price, this.imageUrl, this.discription, this.category, this.rate});

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      name: json['title'],
      price: json['price'].toDouble(),
      imageUrl: json['image'],
      discription: json['description'],
      category: json['category'],
      rate: json['rating']['rate'].toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'price': price,
      'imageUrl': imageUrl,
      'discription': discription,
      'category': category,
      'rate': rate,
    };
  }
}
