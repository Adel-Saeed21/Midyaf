class Product {
  final String name;
  final double price;

  Product({required this.name, required this.price});
}

List<Product> products = [
  Product(name: "Laptop", price: 120),
  Product(name: "Smart Phone", price: 210),
  Product(name: "Tablet", price: 150),
  Product(name: "HeadPhone", price: 300),
];

enum SortType { name, price }
