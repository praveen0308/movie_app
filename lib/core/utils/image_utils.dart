import 'package:movie_app/core/utils/constants.dart';

enum ImageQuality {
  w100,
  w200,
  w300,
  w400,
  w500,
  original;
}

class ImageUtils {

  static String getFinalImageUrl(ImageQuality quality, String path) {
    return baseImageUrl
        .replaceFirst(imageQuality, quality.name)
        .replaceFirst(imagePath, path);
  }
}
