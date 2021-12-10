import 'package:flutter/material.dart';
import 'package:store2_flutter/constants.dart';
import 'package:store2_flutter/models/products.dart';

import 'categories.dart';
import 'item_card.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: kDefaultPaddin),
          child: Text(
            "Women",
            style: Theme.of(context)
                .textTheme
                .headline4!
                .copyWith(color: kTextColor, fontWeight: FontWeight.bold),
          ),
        ),
        Categories(),
        Expanded(
            child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: kDefaultPaddin),
          child: GridView.builder(
            itemCount: products.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.75,
                mainAxisSpacing: kDefaultPaddin,
                crossAxisSpacing: kDefaultPaddin),
            itemBuilder: (context, index) =>
                ItemCard(product: products![index], onPress: () {}),
          ),
        ))
      ],
    );
  }
}
