class Product {
  int? number;
  String productname;
  double rupees; // Changed from int to double

  Product({this.number, required this.productname, required this.rupees});

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      number: json['number'],
      productname: json['productname'],
      rupees: json['rupees'], // Ensure it's parsed as a double
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'number': number,
      'productname': productname,
      'rupees': rupees,
    };
  }
}
