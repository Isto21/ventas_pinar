// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PinterestBar extends StatelessWidget {
  final List<Items> items;
  Color activeColor = Colors.blue;
  Color boxShadow = Colors.black;
  Color inactiveColor = Colors.black;
  PinterestBar({
    Key? key,
    required this.items,
    required this.activeColor,
    required this.boxShadow,
    required this.inactiveColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 55,
        width: 150,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          boxShadow:  <BoxShadow>[
            BoxShadow(
                color: boxShadow,
                spreadRadius: -5,
                blurRadius: 2,
                blurStyle: BlurStyle.outer)
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: List.generate(
                items.length,
                (index) => ItemsButton(
                      index: index,
                      items: items[index],
                      activeColor: activeColor,
                      inactiveColor: inactiveColor,
                    )),
          ),
        ));
  }
}

class ItemsButton extends StatelessWidget {
  const ItemsButton({
    super.key,
    required this.index,
    required this.items,
    required this.inactiveColor,
    required this.activeColor,
  });

  final int index;
  final Items items;
  final Color activeColor;
  final Color inactiveColor;

  @override
  Widget build(BuildContext context) {
    final itemSelected = Provider.of<OptionSelected>(context).itemSelected;
    return GestureDetector(
      onTap: () {
        Provider.of<OptionSelected>(context, listen: false).itemSelected =
            index;
        items.onpress();
      },
      child: Icon(items.icon,
          size: (itemSelected == index) ? 26 : 24,
          color: (itemSelected == index) ? activeColor : inactiveColor),
    );
  }
}

class OptionSelected extends ChangeNotifier {
  int _itemSelected = 0;

  int get itemSelected => _itemSelected;

  set itemSelected(int index) {
    _itemSelected = index;
    notifyListeners();
  }
}

class Items {
  final Function onpress;
  final IconData icon;
  Items({
    required this.onpress,
    required this.icon,
  });
}
