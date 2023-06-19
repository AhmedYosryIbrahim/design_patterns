import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

abstract class PlatformButton {
  Widget build({required VoidCallback onPressed, required Widget child});
  factory PlatformButton(TargetPlatform platform) {
    switch (platform) {
      case TargetPlatform.android:
        return AndroidButton();
      case TargetPlatform.iOS:
        return IosButton();
      default:
        return AndroidButton();
    }
  }
}

class AndroidButton implements PlatformButton {
  @override
  Widget build({required VoidCallback onPressed, required Widget child}) {
    return ElevatedButton(
      onPressed: onPressed,
      child: child,
    );
  }
}

class IosButton implements PlatformButton {
  @override
  Widget build({required VoidCallback onPressed, required Widget child}) {
    return CupertinoButton(
      onPressed: onPressed,
      child: child,
    );
  }
}
