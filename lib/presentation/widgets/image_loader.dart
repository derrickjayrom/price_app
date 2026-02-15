import 'dart:io';
import 'package:shimmer/shimmer.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:price_app/utils/constants.dart';

class ImageLoader extends StatelessWidget {
  const ImageLoader({
    super.key,
    this.radius = 10,
    this.imageUrl = '',
    this.height,
    this.width,
    this.fit = BoxFit.cover,
    this.isAsset = false,
    this.isFile = false,
    this.errorWidget,
    this.fileImage,
    this.borderRadius,
    this.color,
  });

  final double radius;
  final BorderRadius? borderRadius;
  final String imageUrl;
  final double? height;
  final double? width;
  final BoxFit fit;
  final bool isAsset;
  final bool isFile;
  final Widget? errorWidget;
  final File? fileImage;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? MediaQuery.of(context).size.width,
      height: height ?? MediaQuery.of(context).size.height,
      child: ClipRRect(
        borderRadius: borderRadius ?? BorderRadius.circular(radius),
        clipBehavior: Clip.hardEdge,
        child: isFile && fileImage != null
            ? Image.file(
                fileImage!,
                fit: fit,
                height: height,
                color: color,
                width: width ?? MediaQuery.of(context).size.width,
              )
            : isAsset || imageUrl == emptyAssetImage
            ? Image.asset(
                imageUrl,
                fit: fit,
                height: height,
                color: color,
                width: width ?? MediaQuery.of(context).size.width,
              )
            : CachedNetworkImage(
                imageUrl: imageUrl,
                fit: fit,
                color: color,
                // memCacheHeight: height?.toInt(),
                // memCacheWidth: width?.toInt(),
                height: height,
                width: width,
                useOldImageOnUrlChange: true,
                progressIndicatorBuilder: (context, url, downloadProgress) {
                  return Center(
                    child: Shimmer.fromColors(
                      baseColor: const Color.fromARGB(255, 255, 255, 255),
                      highlightColor: const Color.fromARGB(255, 232, 230, 230),
                      child: Container(
                        color: const Color.fromARGB(255, 255, 255, 255),
                        height: double.infinity,
                        width: double.infinity,
                        child: Icon(
                          Icons.image,
                          color: const Color.fromARGB(255, 255, 255, 255),
                          size: radius > 10 ? radius : 20,
                        ),
                      ),
                    ),
                  );
                },
                errorWidget: (context, url, error) {
                  return errorWidget ??
                      Container(
                        color: const Color(0xEECDCDCD),
                        height: height,
                        width: width ?? MediaQuery.of(context).size.width,
                        child: const Icon(
                          Icons.error_outline,
                          size: 40,
                          color: Colors.white,
                        ),
                      );
                },
              ),
      ),
    );
  }
}
