import 'package:flutter/material.dart';

abstract class Render {
  Widget render();
}

class ImageRender extends Render {
  @override
  Widget render() {
    return Image.network('https://picsum.photos/250?image=9');
  }
}

class ButtonRender extends Render {
  @override
  Widget render() {
    return ElevatedButton(
      onPressed: () {
        debugPrint('button clicked');
      },
      child: const Text('click'),
    );
  }
}

class WidgetRender extends Render {
  @override
  Widget render() {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Icon(
          Icons.local_fire_department_rounded,
          color: Colors.amber,
        ),
        Text('Ahmed yosry'),
        Icon(
          Icons.local_fire_department_rounded,
          color: Colors.redAccent,
        ),
      ],
    );
  }
}
