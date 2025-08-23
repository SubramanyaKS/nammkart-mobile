class WishlistProductEntity {
  final String id;
  final String productName;
  final String imageUrl;
  final String? productId;

  WishlistProductEntity(
      {this.productId,
      required this.id,
      required this.productName,
      required this.imageUrl});
}
