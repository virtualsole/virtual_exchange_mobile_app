import 'package:flutter/material.dart';

void main() {}

class CustomWidget extends Widget {
  const CustomWidget({super.key});

  @override
  Element createElement() {
    throw UnimplementedError();
  }

  @override
  noSuchMethod(Invocation invocation) {
    // TODO: implement noSuchMethod
    return super.noSuchMethod(invocation);
  }
}

class MyWidget extends CustomWidget {
  const MyWidget({super.key});
}
