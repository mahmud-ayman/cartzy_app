import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProductItemWidget extends StatelessWidget {
  final dynamic product;
  final String imageTest = "https://via.placeholder.com/150";

  const ProductItemWidget({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    // نعمل حماية من null
    final String imageUrl =
        (product != null && product.images != null && product.images.isNotEmpty)
            ? product.images.first
            : imageTest;

    final String title = (product != null && product.title != null)
        ? product.title
        : "Loading...";

    final String price = (product != null && product.price != null)
        ? "EGP ${product.price}"
        : "--";

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: CachedNetworkImage(
                imageUrl: imageUrl,
                placeholder: (context, url) => Container(
                  height: 240,
                  alignment: Alignment.center,
                  child: const CircularProgressIndicator(strokeWidth: 2),
                ),
                errorWidget: (context, url, error) => Container(
                  height: 240,
                  color: Colors.grey[200],
                  alignment: Alignment.center,
                  child: const Icon(Icons.broken_image,
                      size: 40, color: Colors.grey),
                ),
                width: double.infinity,
                height: 240,
                fit: BoxFit.cover,
              ),
            ),
            Positioned(
              top: 8,
              right: 8,
              child: SvgPicture.asset(
                "assets/icons/icon-favourite.svg",
                height: 28,
                width: 28,
                color: Colors.black,
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        Text(
          title,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: Colors.black,
          ),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        const SizedBox(height: 4),
        Text(
          price,
          style: const TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
      ],
    );
  }
}
