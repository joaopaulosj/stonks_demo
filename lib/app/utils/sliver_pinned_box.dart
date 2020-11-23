import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class SliverPinnedBox extends SingleChildRenderObjectWidget {
  @override
  final Widget child;

  @override
  RenderObject createRenderObject(BuildContext context) {
    return _RenderSliverPinnedBox();
  }

  const SliverPinnedBox({
    @required this.child,
    Key key,
  }) : super(key: key, child: child);
}

class _RenderSliverPinnedBox extends RenderSliverSingleBoxAdapter {
  _RenderSliverPinnedBox({RenderBox child}) : super(child: child);

  @override
  void performLayout() {
    if (child == null) {
      geometry = SliverGeometry.zero;
      return;
    }

    child.layout(constraints.asBoxConstraints(), parentUsesSize: true);
    double childExtent;
    switch (constraints.axis) {
      case Axis.horizontal:
        childExtent = child.size.width;
        break;
      case Axis.vertical:
        childExtent = child.size.height;
        break;
    }

    assert(childExtent != null);

    final paintedChildSize = calculatePaintOffset(
      constraints,
      from: 0.0,
      to: childExtent,
    );
    final cacheExtent = calculateCacheOffset(
      constraints,
      from: 0.0,
      to: childExtent,
    );

    assert(paintedChildSize.isFinite);
    assert(paintedChildSize >= 0.0);

    geometry = SliverGeometry(
      scrollExtent: childExtent,
      paintExtent: paintedChildSize,
      cacheExtent: cacheExtent,
      maxPaintExtent: childExtent,
      hitTestExtent: childExtent,
      hasVisualOverflow: childExtent > constraints.remainingPaintExtent ||
          constraints.scrollOffset > 0.0,
      paintOrigin: constraints.overlap,
      visible: true,
    );
  }

  @override
  double childMainAxisPosition(RenderBox child) => constraints.overlap;
}
