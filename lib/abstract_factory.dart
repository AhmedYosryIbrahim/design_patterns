import 'package:factory_design_patterne/platfom_button.dart';
import 'package:factory_design_patterne/platform_indecator.dart';
import 'package:flutter/material.dart';

abstract class AbstractFactory {
  Widget buildButton(BuildContext context, String text, VoidCallback onPressed);
  Widget buildIndecator(BuildContext context);
}

class AbstractFactoryImpl implements AbstractFactory {
  @override
  Widget buildButton(
      BuildContext context, String text, VoidCallback onPressed) {
    return PlatformButton(Theme.of(context).platform)
        .build(onPressed: onPressed, child: Text(text));
  }

  @override
  Widget buildIndecator(BuildContext context) {
    return PlatformIndecator(Theme.of(context).platform).build();
  }
}

class AbstractFactorySecoundImpl {
  static Widget buildButton(
      BuildContext context, String text, VoidCallback onPressed) {
    return PlatformButton(Theme.of(context).platform)
        .build(onPressed: onPressed, child: Text(text));
  }

  static Widget buildIndecator(BuildContext context) {
    return PlatformIndecator(Theme.of(context).platform).build();
  }
}
