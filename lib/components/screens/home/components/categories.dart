import 'package:flutter/material.dart';

import '../../../../constants.dart';

class Categories extends StatefulWidget {
  Categories({
    Key? key,
  }) : super(key: key);

  @override
  _CategoriesState createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  final List<String> _categories = [
    "Hand Bag",
    "Jewellery",
    "Footwear",
    "Dresses"
  ];
  int _selectedIndex = 3;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: kDefaultPaddin),
      child: SizedBox(
        // decoration: BoxDecoration(color: Colors.white, boxShadow: [
        //   BoxShadow(
        //       offset: const Offset(0, 10),
        //       color: kAccent!.withOpacity(0.30),
        //       blurRadius: 10)
        // ]),
        height: 30,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: _categories.length,
          itemBuilder: (context, index) => buildCategory(index),
        ),
      ),
    );
  }

  Widget buildCategory(int index) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: kDefaultPaddin),
        child: GestureDetector(
          onTap: () => setState(() {
            _selectedIndex = index;
          }),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                _categories[index],
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: _selectedIndex == index
                        ? Colors.purple[300]
                        : kTextColor.withOpacity(0.5)),
              ),
              Align(
                child: AnimatedContainer(
                  curve: Curves.easeInBack,
                  duration: const Duration(milliseconds: 600),
                  margin: const EdgeInsets.only(top: kDefaultPaddin / 4),
                  height: 2,
                  width: _selectedIndex == index ? 45 : 25,
                  decoration: BoxDecoration(
                      color: _selectedIndex == index
                          ? kAccent!.withOpacity(0.75)
                          : kTextColor.withOpacity(0.25)),
                ),
              )
            ],
          ),
        ),
      );
}
