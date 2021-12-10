import 'package:flutter/material.dart';
import 'package:store2_flutter/constants.dart';
import 'package:store2_flutter/models/products.dart';

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
                      Row(
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
                                const TextSpan(text: "Size: "),
                                TextSpan(
                                  text: product.size.toString(),
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline5!
                                      .copyWith(color: kTextColor),
                                )
                              ],
                            ),
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
