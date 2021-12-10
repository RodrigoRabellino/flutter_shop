import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:store2_flutter/components/screens/home/home_screen.dart';
import 'package:store2_flutter/models/products.dart';

import '../../../constants.dart';
import 'components/body.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({Key? key, required this.product}) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: product.color,
      appBar: buildAppBar(context),
      body: Body(product: product),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: product.color,
      elevation: 0,
      leading: IconButton(
        splashColor: product.color.withOpacity(0.5),
        onPressed: () => Navigator.pop(context),
        icon: SvgPicture.asset(
          "assets/icons/back.svg",
          color: Colors.white,
        ),
      ),
      actions: [
        IconButton(
          splashColor: product.color.withOpacity(0.5),
          onPressed: () => Navigator.push(context,
              MaterialPageRoute(builder: (context) => const HomeScreen())),
          icon: SvgPicture.asset(
            "assets/icons/search.svg",
            color: Colors.white,
          ),
        ),
        IconButton(
          splashColor: product.color.withOpacity(0.5),
          onPressed: () {},
          icon: SvgPicture.asset(
            "assets/icons/cart.svg",
            color: Colors.white,
          ),
        ),
        const SizedBox(
          width: kDefaultPaddin / 2,
        )
      ],
    );
  }
}
