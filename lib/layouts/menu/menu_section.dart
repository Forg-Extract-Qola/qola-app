import 'package:flutter/material.dart';
import 'package:qola_app/layouts/menu/menu_item.dart';
import 'package:qola_app/shared/qola_texts.dart';
import 'package:qola_app/theme/colors.dart';

class MenuSection extends StatelessWidget {

  final List<Item> items;

  const MenuSection({
    Key? key,
    this.items = const []
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        child: Stack(
          children: [
            Positioned.fill(
              child: SafeArea(
                top: true,
                child: Padding(
                  padding: const EdgeInsets.only(top: 20.0, left: 20.0, right: 20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const TextBold('Qola', color: Colors.black87, size: 25.0),
                      const SizedBox(height: 20.0),
                      ListView.builder(
                        shrinkWrap: true,
                        itemCount: items.length,
                        itemBuilder: (context, index) {
                          return _Item(item: items[index]);
                        }
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              top: 35,
              right: 20,
              child: IconButton(
                splashRadius: 25.0,
                icon: const Icon(Icons.close),
                onPressed: () => Navigator.pop(context),
              ),
            )
          ],
        ),
      ),
    );
  }
}


class _Item extends StatelessWidget {

  final Item item;

  const _Item({
    Key? key,
    required this.item
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Row(
        children: [
          item.icon != null ? Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: Icon(item.icon, color: primaryColor),
          ): Container(),
          GestureDetector(
            onTap: item.route != null ? () => Navigator.pushNamed(context, item.route!) : null,
            child: CustomText(item.displayName, color: Colors.black87, size: 18.0,)
          )
        ],
      ),
    );
  }
}

