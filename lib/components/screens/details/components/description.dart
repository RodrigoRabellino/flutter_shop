import 'package:flutter/material.dart';
import 'package:store2_flutter/models/products.dart';

import '../../../../constants.dart';

class Description extends StatelessWidget {
  const Description({
    Key? key,
    required this.product,
  }) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: kDefaultPaddin / 2,
        vertical: kDefaultPaddin,
      ),
      child: Text(
        product.description,
        style:
            Theme.of(context).textTheme.bodyText1!.copyWith(color: kTextColor),
      ),
    );
  }
}
