import 'package:flutter/material.dart';

class GridViewBuilder extends StatelessWidget {
  final int count;
  final bool shrinkWrap;
  final Widget Function(BuildContext, int) itemBuilder;
  final ScrollController scrollController;

  const GridViewBuilder({
    super.key,
    required this.count,
    required this.itemBuilder,
    this.shrinkWrap = true,
    required this.scrollController,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        shrinkWrap: shrinkWrap,
        itemCount: count,
        controller: scrollController,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 16.0,
          childAspectRatio: 4 / 2.4,
        ),
        itemBuilder: (context, index) => itemBuilder(context, index));
  }
}
