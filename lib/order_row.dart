class OrderRow {
  int ProductId = 0;
  String ProductName = '';
  double ProductPrice = 0;
  String ProductPictire = '';
  int qty = 0;

  OrderRow(this.ProductId, this.ProductName, this.ProductPrice,
      this.ProductPictire, this.qty);

  @override
  String toString() {
    return 'ProductId = $ProductId, ProductName = $ProductName, ProductPrice = $ProductPrice, qty = $qty';
  }
}
