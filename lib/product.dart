class Product {
  int id = 0;
  String productName = '';
  double price = 0;
  String pictures = '';

  Product(this.id, this.productName, this.price, this.pictures);

  Product.empty() {
    id = 0;
    productName = '';
    price = 0;
    pictures = '';
  }

  @override
  String toString() {
    return 'id = $id, productName = $productName, price = $price, pictures = $pictures';
  }
}
