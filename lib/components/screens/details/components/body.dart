import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:store2_flutter/constants.dart';
import 'package:store2_flutter/models/products.dart';

import 'card_counter.dart';
import 'color_select_and_size.dart';
import 'counter_and_like.dart';
import 'description.dart';
import 'product_title.dart';

class Body extends StatelessWidget {
  const Body({Key? key, required this.product}) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        children: [
          SizedBox(
            height: size.height,
            child: Stack(
              children: [
                Container(
                  margin: EdgeInsets.only(top: size.height * 0.3),
                  padding: EdgeInsets.only(
                      top: size.height * 0.12,
                      left: kDefaultPaddin,
                      right: kDefaultPaddin),
                  // height: 500,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(25),
                      topRight: Radius.circular(25),
                    ),
                  ),
                  child: Column(
                    children: [
                      ColorSelectAndSize(product: product),
                      Description(product: product),
                      CounterAndLike(product: product),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          ElevatedButton(
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                product.color,
                              ),
                              shape: MaterialStateProperty.all<
                                  RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
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
                          Expanded(
                            child: ElevatedButton(
                                style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all<Color>(
                                          product.color),
                                ),
                                onPressed: () {},
                                child: Text("Buy Now".toUpperCase())),
                          )
                        ],
                      )
                    ],
                  ),
                ),
                ProductTitle(product: product),
              ],
            ),
          )
        ],
      ),
    );
  }
}
