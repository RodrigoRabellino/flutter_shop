import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:store2_flutter/models/products.dart';

import 'card_counter.dart';

class CounterAndLike extends StatelessWidget {
  const CounterAndLike({
    Key? key,
    required this.product,
  }) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CardCounter(product: product),
        Container(
          width: 32,
          height: 32,
          decoration:
              BoxDecoration(color: product.color, shape: BoxShape.circle),
          child: SvgPicture.asset(
            "assets/icons/heart.svg",
            fit: BoxFit.scaleDown,
          ),
        )
      ],
    );
  }
}
