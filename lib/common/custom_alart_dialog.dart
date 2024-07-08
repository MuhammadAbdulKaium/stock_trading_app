import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomAlartDialog extends StatelessWidget {
  final Widget dialogHeader;
  final Widget dialogContent;
  final VoidCallback? onClose;
  final double? horizontalPadding;
  final double? begin;
  final double? end;
  final Color? backgroundColor;
  final AlignmentGeometry? alignment;
  final BorderRadiusGeometry? borderRadius;
  final int? duration;
  final Widget? closeIcon;
  const CustomAlartDialog({
    Key? key,
    this.dialogHeader = const Row(children: []),
    this.dialogContent = const Column(children: [Text('This is a custom slide-in dialog.')]),
    this.onClose,
    this.horizontalPadding,
    this.begin,
    this.end,
    this.backgroundColor,
    this.alignment,
    this.borderRadius,
    this.duration,
    this.closeIcon,
  })
  : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<double>(
      tween: Tween(begin: begin ?? 1.0, end: end ?? -0.1),
      duration: Duration(milliseconds: duration ?? 300),
      builder: (context, value, child) {
        return Transform.translate(
          offset: Offset(0, value * MediaQuery.of(context).size.height),
          child: AlertDialog(
            alignment: alignment ?? Alignment.center,
            contentPadding: const EdgeInsets.all(0),
            backgroundColor: backgroundColor ?? Colors.white,
            insetPadding: EdgeInsets.symmetric(horizontal: horizontalPadding ?? 15),
            shape: RoundedRectangleBorder(
              borderRadius: borderRadius ?? const BorderRadius.all(Radius.circular(10)),
            ),
            // title: const Text('Slide-In Dialog'),
            content: SizedBox(
              width: double.maxFinite,
              // width: MediaQuery.of(context).size.width,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 18, right: 0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Flexible(
                            child:dialogHeader,
                          ),
                          IconButton(
                            onPressed: () {
                              // Navigator.of(context, rootNavigator: true).pop();
                              Get.back();
                              onClose?.call();
                            },
                            icon: closeIcon ?? const Icon(Icons.close),
                            iconSize: 19,
                          ),
                        ],
                      ),
                    ),
                
                    dialogContent,
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
