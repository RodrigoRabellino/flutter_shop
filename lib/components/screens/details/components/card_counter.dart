import 'package:flutter/material.dart';
import 'package:store2_flutter/models/products.dart';
import '../../../../constants.dart';

class CardCounter extends StatefulWidget {
  CardCounter({
    Key? key,
    required this.product,
  }) : super(key: key);

  final Product product;

  @override
  _CardCounterState createState() => _CardCounterState();
}

class _CardCounterState extends State<CardCounter> {
  int itemCount = 1;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: Row(
        children: [
          buildButton(
              Icons.remove,
              () => setState(
                    () => itemCount > 1 ? itemCount-- : itemCount,
                  ),
              widget.product.color),
          const SizedBox(
            width: kDefaultPaddin,
          ),
          Text(
            itemCount.toString(),
            style: Theme.of(context).textTheme.headline6!.copyWith(
                  color: widget.product.color.withOpacity(1),
                  fontWeight: FontWeight.bold,
                ),
          ),
          const SizedBox(
            width: kDefaultPaddin,
          ),
          buildButton(
              Icons.add,
              () => setState(
                    () => itemCount < 5 ? itemCount++ : itemCount,
                  ),
              widget.product.color)
        ],
      ),
    );
  }

  Widget buildButton(IconData icon, VoidCallback onPress, Color color) {
    return TextButton(
      style: ButtonStyle(
        backgroundColor:
            MaterialStateProperty.all<Color>(color.withOpacity(.2)),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
        ),
      ),
      onPressed: onPress,
      child: Icon(
        icon,
        color: color,
      ),
    );
  }
}
