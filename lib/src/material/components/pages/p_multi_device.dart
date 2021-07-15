import 'package:flutter/material.dart';

enum BuilderCase { tv, desktop, tablet, phone, watch }

class OwMultiDevice extends StatefulWidget {
  final Widget Function(BuildContext) tvBuilder;
  final Widget Function(BuildContext) desktopBuilder;
  final Widget Function(BuildContext) tabletBuilder;
  final Widget Function(BuildContext) phoneBuilder;
  final Widget Function(BuildContext) watchBuilder;
  final BuilderCase builderCase;

  const OwMultiDevice({
    Key key,
    this.tvBuilder,
    this.desktopBuilder,
    this.tabletBuilder,
    this.phoneBuilder,
    this.watchBuilder,
    this.builderCase,
  }) : super(key: key);

  @override
  _OwMultiDeviceState createState() => _OwMultiDeviceState(
    this.tvBuilder,
    this.desktopBuilder,
    this.tabletBuilder,
    this.phoneBuilder,
    this.watchBuilder,
    this.builderCase,
  );
}

class _OwMultiDeviceState extends State<OwMultiDevice> { // ! Add orientation device
  final Widget Function(BuildContext) tvBuilder;
  final Widget Function(BuildContext) desktopBuilder;
  final Widget Function(BuildContext) tabletBuilder;
  final Widget Function(BuildContext) phoneBuilder;
  final Widget Function(BuildContext) watchBuilder;
  final BuilderCase builderCase;

  _OwMultiDeviceState(
    this.tvBuilder, 
    this.desktopBuilder, 
    this.tabletBuilder, 
    this.phoneBuilder, 
    this.watchBuilder,
    this.builderCase,
  );

  @override
  Widget build(BuildContext context) {
    switch (builderCase) {
      case BuilderCase.tv:
        return tvBuilder?.call(context);
      case BuilderCase.desktop:
        return desktopBuilder(context);
      case BuilderCase.tablet:
        return tabletBuilder(context);
      case BuilderCase.phone:
        return phoneBuilder(context);
      case BuilderCase.watch:
        return watchBuilder(context);
      default:
        return desktopBuilder(context);
    }
  }
}




// class DevicesSize {
//   final double tvWidth;
//   final double tvHeight;
//   final double desktopWidth;
//   final double desktopHeight;
//   final double tabletWidth;
//   final double tabletHeight;
//   final double phoneWidth;
//   final double phoneHeight;
//   final double watchWidth;
//   final double watchHeight;

//   DevicesSize({
//     this.tvWidth = double.infinity,
//     this.tvHeight = double.infinity,
//     this.desktopWidth,
//     this.desktopHeight = double.infinity,
//     this.tabletWidth,
//     this.tabletHeight,
//     this.phoneWidth,
//     this.phoneHeight = double.infinity,
//     this.watchWidth,
//     this.watchHeight,
//   });
// }
