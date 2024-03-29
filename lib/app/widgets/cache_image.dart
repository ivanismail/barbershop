import 'package:cached_network_image/cached_network_image.dart';

import '../export.dart';

class XNetworkImage extends StatelessWidget {
  final String? url;
  final BorderRadiusGeometry borderRadius;
  final BoxFit fit;

  const XNetworkImage({
    Key? key,
    this.url,
    this.borderRadius = BorderRadius.zero,
    this.fit = BoxFit.fitWidth,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: url ?? '',
      imageBuilder: (context, imageProvider) => Container(
        decoration: BoxDecoration(
          borderRadius: borderRadius,
          image: DecorationImage(
            image: imageProvider,
            fit: fit,
          ),
        ),
      ),
      progressIndicatorBuilder: (context, url, downloadProgress) => Center(
        child: SizedBox(
          width: 25,
          height: 25,
          child: CircularProgressIndicator(
            value: downloadProgress.progress,
            color: XColor.primary().withOpacity(0.2),
          ),
        ),
      ),
      // errorWidget: (context, url, error) => Container(
      //   color: const Color(0xffF3F3F3),
      //   width: Get.width,
      //   child: Lottie.asset(
      //     "assets/lottie/images.json",
      //   ),
      // ),
    );
  }
}

class XCachedImage extends StatelessWidget {
  final String? url, errorImage;
  final BorderRadiusGeometry borderRadius;
  final BoxFit fit;

  const XCachedImage({
    Key? key,
    this.url,
    this.borderRadius = BorderRadius.zero,
    this.fit = BoxFit.cover,
    this.errorImage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      // memCacheWidth: 45,
      // memCacheHeight: 60,
      // maxHeightDiskCache: 60,
      // maxWidthDiskCache: 45,
      imageUrl: this.url ?? '',
      imageBuilder: (context, imageProvider) => Container(
        decoration: BoxDecoration(
          borderRadius: borderRadius,
          image: DecorationImage(
            image: imageProvider,
            fit: fit,
          ),
        ),
      ),
      progressIndicatorBuilder: (context, url, downloadProgress) => Center(
        child: Container(
          width: 25,
          height: 25,
          child: CircularProgressIndicator(value: downloadProgress.progress),
        ),
      ),
      errorWidget: (context, url, error) =>
          this.errorImage != null || this.errorImage != ''
              ? CachedNetworkImage(
                  memCacheWidth: 45,
                  memCacheHeight: 60,
                  maxHeightDiskCache: 60,
                  maxWidthDiskCache: 45,
                  imageUrl:
                      "https://ui-avatars.com/api/?name=$errorImage&background=random",
                  imageBuilder: (context, imageProvider) => Container(
                    decoration: BoxDecoration(
                      borderRadius: borderRadius,
                      image: DecorationImage(
                        image: imageProvider,
                        fit: fit,
                      ),
                    ),
                  ),
                  progressIndicatorBuilder: (context, url, downloadProgress) =>
                      Center(
                    child: Container(
                      width: 25,
                      height: 25,
                      child: CircularProgressIndicator(
                          value: downloadProgress.progress),
                    ),
                  ),
                  errorWidget: (context, url, error) => Center(
                    child: Container(
                      width: 25,
                      height: 25,
                      child: Icon(Icons.error),
                    ),
                  ),
                )
              : CachedNetworkImage(
                  memCacheWidth: 45,
                  memCacheHeight: 60,
                  maxHeightDiskCache: 60,
                  maxWidthDiskCache: 45,
                  imageUrl: IMAGE_PLACEHOLDER,
                  imageBuilder: (context, imageProvider) => Container(
                    decoration: BoxDecoration(
                      borderRadius: borderRadius,
                      image: DecorationImage(
                        image: imageProvider,
                        fit: fit,
                      ),
                    ),
                  ),
                  progressIndicatorBuilder: (context, url, downloadProgress) =>
                      Center(
                    child: Container(
                      width: 25,
                      height: 25,
                      child: CircularProgressIndicator(
                          value: downloadProgress.progress),
                    ),
                  ),
                  errorWidget: (context, url, error) => Center(
                    child: Container(
                      width: 25,
                      height: 25,
                      child: Icon(Icons.error),
                    ),
                  ),
                ),
    );
  }
}
