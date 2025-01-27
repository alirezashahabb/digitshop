/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';

class $AssetsImgGen {
  const $AssetsImgGen();

  /// File path: assets/img/active_fav_product.png
  AssetGenImage get activeFavProduct =>
      const AssetGenImage('assets/img/active_fav_product.png');

  /// File path: assets/img/avatar.png
  AssetGenImage get avatar => const AssetGenImage('assets/img/avatar.png');

  /// File path: assets/img/icon_apple_blue.png
  AssetGenImage get iconAppleBlue =>
      const AssetGenImage('assets/img/icon_apple_blue.png');

  /// File path: assets/img/icon_application.png
  AssetGenImage get iconApplication =>
      const AssetGenImage('assets/img/icon_application.png');

  /// File path: assets/img/icon_back.png
  AssetGenImage get iconBack => const AssetGenImage('assets/img/icon_back.png');

  /// File path: assets/img/icon_basket.png
  AssetGenImage get iconBasket =>
      const AssetGenImage('assets/img/icon_basket.png');

  /// File path: assets/img/icon_basket_active.png
  AssetGenImage get iconBasketActive =>
      const AssetGenImage('assets/img/icon_basket_active.png');

  /// File path: assets/img/icon_category.png
  AssetGenImage get iconCategory =>
      const AssetGenImage('assets/img/icon_category.png');

  /// File path: assets/img/icon_category_active.png
  AssetGenImage get iconCategoryActive =>
      const AssetGenImage('assets/img/icon_category_active.png');

  /// File path: assets/img/icon_favorite_deactive.png
  AssetGenImage get iconFavoriteDeactive =>
      const AssetGenImage('assets/img/icon_favorite_deactive.png');

  /// File path: assets/img/icon_home.png
  AssetGenImage get iconHome => const AssetGenImage('assets/img/icon_home.png');

  /// File path: assets/img/icon_home_active.png
  AssetGenImage get iconHomeActive =>
      const AssetGenImage('assets/img/icon_home_active.png');

  /// File path: assets/img/icon_left_categroy.png
  AssetGenImage get iconLeftCategroy =>
      const AssetGenImage('assets/img/icon_left_categroy.png');

  /// File path: assets/img/icon_options.png
  AssetGenImage get iconOptions =>
      const AssetGenImage('assets/img/icon_options.png');

  /// File path: assets/img/icon_profile.png
  AssetGenImage get iconProfile =>
      const AssetGenImage('assets/img/icon_profile.png');

  /// File path: assets/img/icon_profile_active.png
  AssetGenImage get iconProfileActive =>
      const AssetGenImage('assets/img/icon_profile_active.png');

  /// File path: assets/img/icon_right_arrow_cricle.png
  AssetGenImage get iconRightArrowCricle =>
      const AssetGenImage('assets/img/icon_right_arrow_cricle.png');

  /// File path: assets/img/icon_search.png
  AssetGenImage get iconSearch =>
      const AssetGenImage('assets/img/icon_search.png');

  /// File path: assets/img/icon_star.png
  AssetGenImage get iconStar => const AssetGenImage('assets/img/icon_star.png');

  /// File path: assets/img/icon_trash.png
  AssetGenImage get iconTrash =>
      const AssetGenImage('assets/img/icon_trash.png');

  /// File path: assets/img/iphone.png
  AssetGenImage get iphone => const AssetGenImage('assets/img/iphone.png');

  /// File path: assets/img/login_photo.jpg
  AssetGenImage get loginPhoto =>
      const AssetGenImage('assets/img/login_photo.jpg');

  /// File path: assets/img/register.jpg
  AssetGenImage get register => const AssetGenImage('assets/img/register.jpg');

  /// List of all assets
  List<AssetGenImage> get values => [
        activeFavProduct,
        avatar,
        iconAppleBlue,
        iconApplication,
        iconBack,
        iconBasket,
        iconBasketActive,
        iconCategory,
        iconCategoryActive,
        iconFavoriteDeactive,
        iconHome,
        iconHomeActive,
        iconLeftCategroy,
        iconOptions,
        iconProfile,
        iconProfileActive,
        iconRightArrowCricle,
        iconSearch,
        iconStar,
        iconTrash,
        iphone,
        loginPhoto,
        register
      ];
}

class Assets {
  Assets._();

  static const $AssetsImgGen img = $AssetsImgGen();
}

class AssetGenImage {
  const AssetGenImage(
    this._assetName, {
    this.size,
    this.flavors = const {},
  });

  final String _assetName;

  final Size? size;
  final Set<String> flavors;

  Image image({
    Key? key,
    AssetBundle? bundle,
    ImageFrameBuilder? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? scale,
    double? width,
    double? height,
    Color? color,
    Animation<double>? opacity,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = true,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.low,
    int? cacheWidth,
    int? cacheHeight,
  }) {
    return Image.asset(
      _assetName,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      scale: scale,
      width: width,
      height: height,
      color: color,
      opacity: opacity,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      package: package,
      filterQuality: filterQuality,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
    );
  }

  ImageProvider provider({
    AssetBundle? bundle,
    String? package,
  }) {
    return AssetImage(
      _assetName,
      bundle: bundle,
      package: package,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}
