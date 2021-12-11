import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:store2_flutter/models/products.dart';

import '../../../../constants.dart';

class CartActions extends StatelessWidget {
  const CartActions({
    Key? key,
    required this.product,
    required this.size,
  }) : super(key: key);

  final Product product;
  final Size size;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: kDefaultPaddin),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ElevatedButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(product.color),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              minimumSize: MaterialStateProperty.all<Size>(
                Size(size.width * 0.2, size.height * 0.1),
              ),
            ),
            onPressed: () {},
            child: SvgPicture.asset(
              "assets/icons/add_to_cart.svg",
              color: Colors.white,
            ),
          ),
          const SizedBox(
            width: kDefaultPaddin,
          ),
          ElevatedButton(
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(
                  product.color,
                ),
                minimumSize: MaterialStateProperty.all<Size>(
                  Size(size.width * 0.65, size.height * 0.1),
                ),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)))),
            onPressed: () {},
            child: Text(
              "Buy  Now".toUpperCase(),
              style: Theme.of(context).textTheme.headline5!.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
            ),
          )
        ],
      ),
    );
  }
}
