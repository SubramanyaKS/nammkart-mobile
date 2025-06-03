class CartEntity {
  final String productId;
  int quantity;

  CartEntity({required this.productId, this.quantity = 1});
}