import 'package:flutter/material.dart';

class CustomGridview extends GridView {
  CustomGridview({
    Key? key,
    this.delegate,
    this.children,
  }) : super(
          key: key,
          gridDelegate: delegate ??
              const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 20,
                childAspectRatio: 2,
              ),
          children: children!,
        );

  final SliverGridDelegate? delegate;
  final List<Widget>? children;
}
