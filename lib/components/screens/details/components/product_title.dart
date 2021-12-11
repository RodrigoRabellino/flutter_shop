import 'package:flutter/material.dart';
import 'package:store2_flutter/models/products.dart';

import '../../../../constants.dart';

class ProductTitle extends StatelessWidget {
  const ProductTitle({
    Key? key,
    required this.product,
  }) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kDefaultPaddin),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Aristocratic Hand Bag",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
          ),
          Text(product.title,
              style: Theme.of(context)
                  .textTheme
                  .headline4!
                  .copyWith(color: Colors.white, fontWeight: FontWeight.bold)),
          const SizedBox(
            height: kDefaultPaddin,
          ),
          Row(
            children: [
              Column(
                children: [
                  RichText(
                      text: TextSpan(children: [
                    const TextSpan(text: "Price:\n"),
                    TextSpan(
                        text: "\$${product.price}",
                        style: Theme.of(context).textTheme.headline4!.copyWith(
                            color: Colors.white, fontWeight: FontWeight.bold))
                  ])),
                  const SizedBox(
                    height: kDefaultPaddin * 2.5,
                  )
                ],
              ),
              const SizedBox(
                width: kDefaultPaddin,
              ),
              Expanded(
                child: Image.asset(
                  product.imageUrl,
                  fit: BoxFit.fill,
                  width: 70,
                  height: 250,
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
