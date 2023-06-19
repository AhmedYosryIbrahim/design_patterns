import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

abstract class PlatformIndecator {
  Widget build();

  factory PlatformIndecator(TargetPlatform platform) {
    switch (platform) {
      case TargetPlatform.iOS:
        return IosIndecator();
      case TargetPlatform.android:
        return AndroidIndecator();
      default:
        return IosIndecator();
    }
  }
}

class AndroidIndecator implements PlatformIndecator {
  @override
  Widget build() {
    return const CircularProgressIndicator(
      color: Colors.deepPurple,
    );
  }
}

class IosIndecator implements PlatformIndecator {
  @override
  Widget build() {
    return const CupertinoActivityIndicator(
      color: Colors.black,
    );
  }
}
