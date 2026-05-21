import 'package:flutter/cupertino.dart';

class ResponsiveLayoutDevice extends StatelessWidget {
  final Widget mobilescreen;
  final Widget desktopscreen;

  const ResponsiveLayoutDevice({
    super.key,
    required this.mobilescreen,
    required this.desktopscreen,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth < 600) {
          return mobilescreen;
        } else {
          return desktopscreen;
        }
      },
    );
  }
}
