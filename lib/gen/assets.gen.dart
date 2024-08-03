/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:vector_graphics/vector_graphics.dart';

class $AssetsFontsGen {
  const $AssetsFontsGen();

  /// File path: assets/fonts/bold.ttf
  String get bold => 'assets/fonts/bold.ttf';

  /// File path: assets/fonts/demibold.ttf
  String get demibold => 'assets/fonts/demibold.ttf';

  /// File path: assets/fonts/extrabold.ttf
  String get extrabold => 'assets/fonts/extrabold.ttf';

  /// File path: assets/fonts/extralight.ttf
  String get extralight => 'assets/fonts/extralight.ttf';

  /// File path: assets/fonts/light.ttf
  String get light => 'assets/fonts/light.ttf';

  /// File path: assets/fonts/medium.ttf
  String get medium => 'assets/fonts/medium.ttf';

  /// File path: assets/fonts/regular.ttf
  String get regular => 'assets/fonts/regular.ttf';

  /// File path: assets/fonts/thin.ttf
  String get thin => 'assets/fonts/thin.ttf';

  /// File path: assets/fonts/ultrabold.ttf
  String get ultrabold => 'assets/fonts/ultrabold.ttf';

  /// List of all assets
  List<String> get values => [
        bold,
        demibold,
        extrabold,
        extralight,
        light,
        medium,
        regular,
        thin,
        ultrabold
      ];
}

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/arrow.png
  AssetGenImage get arrow => const AssetGenImage('assets/images/arrow.png');

  /// File path: assets/images/avatar.png
  AssetGenImage get avatar => const AssetGenImage('assets/images/avatar.png');

  /// File path: assets/images/bmic.png
  AssetGenImage get bmic => const AssetGenImage('assets/images/bmic.png');

  /// File path: assets/images/bot.svg
  SvgGenImage get bot => const SvgGenImage('assets/images/bot.svg');

  /// File path: assets/images/flash.png
  AssetGenImage get flash => const AssetGenImage('assets/images/flash.png');

  /// File path: assets/images/hashtag.png
  AssetGenImage get hashtag => const AssetGenImage('assets/images/hashtag.png');

  /// File path: assets/images/home.png
  AssetGenImage get home => const AssetGenImage('assets/images/home.png');

  /// File path: assets/images/imagenotfound.jpg
  AssetGenImage get imagenotfound =>
      const AssetGenImage('assets/images/imagenotfound.jpg');

  /// File path: assets/images/pen.png
  AssetGenImage get pen => const AssetGenImage('assets/images/pen.png');

  /// File path: assets/images/podcast.png
  AssetGenImage get podcast => const AssetGenImage('assets/images/podcast.png');

  /// File path: assets/images/poster.png
  AssetGenImage get poster => const AssetGenImage('assets/images/poster.png');

  /// File path: assets/images/radio.png
  AssetGenImage get radio => const AssetGenImage('assets/images/radio.png');

  /// File path: assets/images/ramzon.png
  AssetGenImage get ramzon => const AssetGenImage('assets/images/ramzon.png');

  /// File path: assets/images/single_place_holder.jpg
  AssetGenImage get singlePlaceHolder =>
      const AssetGenImage('assets/images/single_place_holder.jpg');

  /// File path: assets/images/splashscreen.png
  AssetGenImage get splashscreen =>
      const AssetGenImage('assets/images/splashscreen.png');

  /// File path: assets/images/tecno.png
  AssetGenImage get tecno => const AssetGenImage('assets/images/tecno.png');

  /// File path: assets/images/user.png
  AssetGenImage get user => const AssetGenImage('assets/images/user.png');

  /// File path: assets/images/writer.png
  AssetGenImage get writer => const AssetGenImage('assets/images/writer.png');

  /// List of all assets
  List<dynamic> get values => [
        arrow,
        avatar,
        bmic,
        bot,
        flash,
        hashtag,
        home,
        imagenotfound,
        pen,
        podcast,
        poster,
        radio,
        ramzon,
        singlePlaceHolder,
        splashscreen,
        tecno,
        user,
        writer
      ];
}

class Assets {
  Assets._();

  static const $AssetsFontsGen fonts = $AssetsFontsGen();
  static const $AssetsImagesGen images = $AssetsImagesGen();
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
    bool gaplessPlayback = false,
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

class SvgGenImage {
  const SvgGenImage(
    this._assetName, {
    this.size,
    this.flavors = const {},
  }) : _isVecFormat = false;

  const SvgGenImage.vec(
    this._assetName, {
    this.size,
    this.flavors = const {},
  }) : _isVecFormat = true;

  final String _assetName;
  final Size? size;
  final Set<String> flavors;
  final bool _isVecFormat;

  SvgPicture svg({
    Key? key,
    bool matchTextDirection = false,
    AssetBundle? bundle,
    String? package,
    double? width,
    double? height,
    BoxFit fit = BoxFit.contain,
    AlignmentGeometry alignment = Alignment.center,
    bool allowDrawingOutsideViewBox = false,
    WidgetBuilder? placeholderBuilder,
    String? semanticsLabel,
    bool excludeFromSemantics = false,
    SvgTheme? theme,
    ColorFilter? colorFilter,
    Clip clipBehavior = Clip.hardEdge,
    @deprecated Color? color,
    @deprecated BlendMode colorBlendMode = BlendMode.srcIn,
    @deprecated bool cacheColorFilter = false,
  }) {
    final BytesLoader loader;
    if (_isVecFormat) {
      loader = AssetBytesLoader(
        _assetName,
        assetBundle: bundle,
        packageName: package,
      );
    } else {
      loader = SvgAssetLoader(
        _assetName,
        assetBundle: bundle,
        packageName: package,
        theme: theme,
      );
    }
    return SvgPicture(
      loader,
      key: key,
      matchTextDirection: matchTextDirection,
      width: width,
      height: height,
      fit: fit,
      alignment: alignment,
      allowDrawingOutsideViewBox: allowDrawingOutsideViewBox,
      placeholderBuilder: placeholderBuilder,
      semanticsLabel: semanticsLabel,
      excludeFromSemantics: excludeFromSemantics,
      colorFilter: colorFilter ??
          (color == null ? null : ColorFilter.mode(color, colorBlendMode)),
      clipBehavior: clipBehavior,
      cacheColorFilter: cacheColorFilter,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}
