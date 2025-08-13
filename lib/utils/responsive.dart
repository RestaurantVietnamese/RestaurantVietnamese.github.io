import 'package:flutter/material.dart';

///
/// ✅ Core Dimens class (Dynamic responsive scaling)
///
class Dimens {
  final Size screenSize;
  final Size designSize;
  final DeviceType deviceType;

  Dimens._(this.screenSize, this.designSize, this.deviceType);

  /// Không dùng cache để tránh vấn đề **không rebuild khi thay đổi kích thước**
  factory Dimens.of(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final width = screenSize.width;

    DeviceType deviceType;
    Size designSize;
    if (width >= 1024) {
      deviceType = DeviceType.web;
      designSize = const Size(1440, 1024); // Web design size
    } else if (width >= 600) {
      deviceType = DeviceType.tablet;
      designSize = const Size(800, 1280); // Tablet design size
    } else {
      deviceType = DeviceType.mobile;
      designSize = const Size(375, 812); // Mobile design size
    }

    return Dimens._(screenSize, designSize, deviceType);
  }

  double scaleWidth(double value) =>
      value * screenSize.width / designSize.width;

  double scaleHeight(double value) =>
      value * screenSize.height / designSize.height;

  double scaleFont(double value) => value * screenSize.width / designSize.width;

  static DeviceType device(BuildContext context) =>
      Dimens.of(context).deviceType;
}

enum DeviceType { mobile, tablet, web }

//
// ✅ Extensions for easy usage
//

/// For double values (h, w, sp)
extension ResponsiveNumExtension on num {
  double h(BuildContext context) => Dimens.of(context).scaleHeight(toDouble());
  double w(BuildContext context) => Dimens.of(context).scaleWidth(toDouble());
  double sp(BuildContext context) => Dimens.of(context).scaleFont(toDouble());
}

/// For EdgeInsets
extension ResponsiveEdgeInsetsExtension on EdgeInsets {
  EdgeInsets r(BuildContext context) => EdgeInsets.only(
        left: left.w(context),
        top: top.h(context),
        right: right.w(context),
        bottom: bottom.h(context),
      );
}

/// For BorderRadius
extension ResponsiveBorderRadiusExtension on BorderRadius {
  BorderRadius r(BuildContext context) => BorderRadius.only(
        topLeft: topLeft.r(context),
        topRight: topRight.r(context),
        bottomLeft: bottomLeft.r(context),
        bottomRight: bottomRight.r(context),
      );
}

/// For Radius
extension ResponsiveRadiusExtension on Radius {
  Radius r(BuildContext context) => Radius.circular(x.w(context));
}

/// For Size
extension ResponsiveSizeExtension on Size {
  Size r(BuildContext context) => Size(width.w(context), height.h(context));
}

//
// ✅ Responsive Builder
//
class ResponsiveBuilder extends StatelessWidget {
  final Widget mobile;
  final Widget tablet;
  final Widget web;

  const ResponsiveBuilder({
    Key? key,
    required this.mobile,
    required this.tablet,
    required this.web,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Dùng LayoutBuilder để rebuild khi thay đổi kích thước
    return LayoutBuilder(
      builder: (context, constraints) {
        final width = constraints.maxWidth;

        if (width >= 1024) {
          return web;
        } else if (width >= 600) {
          return tablet;
        } else {
          return mobile;
        }
      },
    );
  }
}
