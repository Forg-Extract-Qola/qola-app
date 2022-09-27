import 'dart:io';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomImage extends StatelessWidget {

  final String url;
  final double? height;
  final double? width;
  final BoxFit fit;
  final Duration fadeInDuration;

  const CustomImage({
    Key? key,
    required this.url,
    this.height,
    this.width,
    this.fit = BoxFit.contain,
    this.fadeInDuration = const Duration(milliseconds: 500)
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: buildImageByImageType(getImageTypeByUrl(url), url),
    );
  }

  Widget buildImageByImageType(ImageType imageType, String url) {
    switch(imageType) {
      case ImageType.local: return Image.file(File(url), width: width, height: height, fit: fit);
      case ImageType.localSvg: return SvgPicture.file(File(url), width: width, height: height, fit: fit);
      case ImageType.asset: return Image.asset(url, width: width, height: height, fit: fit);
      case ImageType.assetSvg: return SvgPicture.asset(url, width: width, height: height, fit: fit);
      case ImageType.network: return CachedNetworkImage(imageUrl: url, width: width, height: height, fit: fit, fadeInDuration: fadeInDuration);
      case ImageType.networkSvg: return SvgPicture.network(url, width: width, height: height, fit: fit);
      default: return Container();
    }
  }

  ImageType getImageTypeByUrl(String url) {
    if (url.startsWith('assets/')) {
      if (url.endsWith('.svg')) return ImageType.assetSvg;
      return ImageType.asset;
    }
    if (url.startsWith('http://') || url.startsWith('https://')) {
      if (url.endsWith('.svg')) return ImageType.networkSvg;
      return ImageType.network;
    }
    if (url.startsWith('/var/mobile/') || url.startsWith('/data/user/')) {
      if (url.endsWith('.svg')) return ImageType.localSvg;
      return ImageType.local;
    }
    return ImageType.none;
  }
}


enum ImageType {
  local,
  localSvg,
  asset,
  assetSvg,
  network,
  networkSvg,
  none
}