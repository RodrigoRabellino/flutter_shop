import 'package:flutter/material.dart';
import 'package:store2_flutter/models/products.dart';

import '../../../../constants.dart';

class ColorSelectAndSize extends StatelessWidget {
  const ColorSelectAndSize({
    Key? key,
    required this.product,
  }) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Color:"),
            Row(
              children: [
                ColorDot(
                  color: product.color,
                  isSelected: true,
                ),
                const ColorDot(
                  color: Colors.red,
                ),
                const ColorDot(
                  color: Colors.blue,
                )
              ],
            )
          ],
        ),
        const Spacer(),
        RichText(
          text: TextSpan(
            style: const TextStyle(color: kTextColor),
            children: [
              const TextSpan(text: "Size: \n"),
              TextSpan(
                text: product.size.toString(),
                style: Theme.of(context).textTheme.headline5!.copyWith(
                      color: kTextColor,
                      fontWeight: FontWeight.bold,
                    ),
              )
            ],
          ),
        )
      ],
    );
  }
}

class ColorDot extends StatelessWidget {
  const ColorDot({
    Key? key,
    required this.color,
    this.isSelected = false,
  }) : super(key: key);

  final Color color;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
          top: kDefaultPaddin / 4, right: kDefaultPaddin / 2),
      padding: const EdgeInsets.all(2),
      width: 24,
      height: 24,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            offset: const Offset(0, 0),
            color: !isSelected ? Colors.transparent : color.withOpacity(.50),
          )
        ],
        shape: BoxShape.circle,
        border: Border.all(color: Colors.black26),
      ),
      child: DecoratedBox(
        decoration: BoxDecoration(color: color, shape: BoxShape.circle),
      ),
    );
  }
}
