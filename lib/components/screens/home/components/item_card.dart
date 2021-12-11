import 'package:flutter/material.dart';
import 'package:store2_flutter/constants.dart';
import 'package:store2_flutter/models/products.dart';

class ItemCard extends StatelessWidget {
  const ItemCard({Key? key, required this.product, required this.onPress})
      : super(key: key);

  final Product product;
  final VoidCallback onPress;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: const BorderRadius.all(
        Radius.circular(20),
      ),
      splashColor: product.color,
      onTap: onPress,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(kDefaultPaddin),
              // height: 180,
              // width: 160,
              decoration: BoxDecoration(
                color: product.color,
                borderRadius: const BorderRadius.all(
                  Radius.circular(20),
                ),
              ),
              child: Hero(
                tag: "${product.id}",
                child: Image.asset(product.imageUrl),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(kDefaultPaddin / 4),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product.title,
                  style: const TextStyle(
                    color: kTextColor,
                  ),
                ),
                Text(
                  "\$${product.price.toString()}",
                  style: TextStyle(color: kAccent, fontWeight: FontWeight.bold),
                )
              ],
            ),
          ),

          // Padding(
          //   padding: const EdgeInsets.symmetric(vertical: kDefaultPaddin / 4),
          //   child: Text(
          //     product.title,
          //     style: const TextStyle(
          //       color: kTextColor,
          //     ),
          //   ),
          // ),
          // Text(
          //   "\$${product.price.toString()}",
          //   style: TextStyle(color: kAccent, fontWeight: FontWeight.bold),
          // )
        ],
      ),
    );
  }
}
