import 'package:flutter/material.dart';

class RatingStar extends StatelessWidget {
  const RatingStar({super.key, required this.rating, required this.size});
  final double rating;
  final double size;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(5, (index) {
        final icon = rating >= index + 1
            ? Icons.star
            : rating > index && rating < index + 1
                ? Icons.star_half
                : Icons.star_border;
        return Icon(icon, color: Colors.amber, size: size);
      }),
    );
  }
}
