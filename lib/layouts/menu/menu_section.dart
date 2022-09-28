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
        color: primaryColor,
        child: Stack(
          children: [
            Positioned.fill(
              child: SafeArea(
                top: true,
                child: Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20.0),
                        child: TextBold('Qola', color: textColor, size: 30.0),
                      ),
                      const SizedBox(height: 20.0),
                      ListView.builder(
                        shrinkWrap: true,
                        itemCount: items.length,
                        itemBuilder: (context, index) {
                          final item = items[index];
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
                splashRadius: 20.0,
                icon: const Icon(Icons.close, color: textColor),
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
    return SizedBox(
      height: 50.0,
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: item.route != null ? () => Navigator.pushNamed(context, item.route!) : null,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Row(
              children: [
                if (item.icon != null) Padding(
                  padding: const EdgeInsets.only(right: 10.0),
                  child: Icon(item.icon, color: textColor),
                ),
                CustomText(item.displayName, color: textColor, size: 18.0)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
