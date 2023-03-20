import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class CustomGridView extends StatelessWidget {
  const CustomGridView({
    super.key,
    required this.itemCount,
    required this.itemBuilder,
    this.arrangeAsPerSize = false,
    this.isSliverType = false,
  });

  final int itemCount;
  final Widget Function(BuildContext, int) itemBuilder;
  final bool arrangeAsPerSize;
  final bool isSliverType;

  List<Widget> productRows(BuildContext context) {
    List<Widget> productRowsList = [];
    for (int i = 0; i < 10; i += 2) {
      productRowsList.add(
        _GridRow(
          itemBuilder: itemBuilder,
          i: i,
          itemCount: itemCount,
        ),
      );
    }
    return productRowsList;
  }

  @override
  Widget build(BuildContext context) {
    if (isSliverType) {
      return SliverList(
        delegate: SliverChildListDelegate(
          productRows(context),
        ),
      );
    }
    return ListView(
      children: productRows(context),
    );
  }
}

class _GridRow extends StatelessWidget {
  const _GridRow({
    required this.itemBuilder,
    required this.i,
    required this.itemCount,
  });

  final Widget Function(BuildContext p1, int p2) itemBuilder;
  final int i;
  final int itemCount;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Flexible(child: itemBuilder(context, i)),
        if (i + 1 < itemCount) Flexible(child: itemBuilder(context, i + 1)),
      ],
    );
  }
}
