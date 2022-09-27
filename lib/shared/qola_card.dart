import 'package:flutter/material.dart';
import 'package:qola_app/shared/qola_alignments.dart';
import 'package:qola_app/shared/qola_images.dart';
import 'package:qola_app/shared/qola_texts.dart';

class CustomImageCard extends StatelessWidget {

  final String title;
  final String? description;
  final String image;
  final double height;
  final Widget? action;

  const CustomImageCard({
    Key? key,
    required this.title,
    required this.image,
    this.description,
    this.action,
    this.height = 80
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10.0),
      height: height,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15.0),
          boxShadow: [
            BoxShadow(
              offset: const Offset(4, 6),
              blurRadius: 4,
              color: Colors.black.withOpacity(0.1),
            )
          ]
      ),
      child: Row(
        children: [
          SizedBox(
            height: height,
            width: height,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15.0),
              child: CustomImage(url: image),
            ),
          ),
          const SizedBox(width: 20.0),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(title, color: Colors.black87, weight: FontWeight.w500, size: 18.0),
                  const SizedBox(height: 10.0),
                  CustomText(description ?? '', color: Colors.black45, weight: FontWeight.w500, size: 12.0,)
                ],
              ),
            ),
          ),
          SizedBox(
            width: 70.0,
            child: action ?? Container()
          )
        ],
      ),
    );
  }
}
