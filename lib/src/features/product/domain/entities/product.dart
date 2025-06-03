class ProductEntity {
  final String productID;
  final String productName;
  final String description;
  final double price;
  final String category;
  final String? brand;
  final int quantity;
  final double rating;
  final bool isAvailable;
  final String imageUrl;
  final bool? isDiscount;
  final String? seller;
  final double? discountPrice;

  ProductEntity({
    required this.productID,
    required this.productName,
    required this.description,
    required this.price,
    required this.category,
    required this.brand,
    required this.quantity,
    required this.rating,
    required this.isAvailable,
    required this.imageUrl,
    this.isDiscount,
    this.seller,
    this.discountPrice,
  });
}