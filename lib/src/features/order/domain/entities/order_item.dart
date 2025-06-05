class OrderItemEntity {
  final String name;
  final int quantity;
  final String? image;
  final double price;
  final String productId;

  OrderItemEntity({required this.name, required this.quantity, this.image,required this.price,required this.productId});
  


}