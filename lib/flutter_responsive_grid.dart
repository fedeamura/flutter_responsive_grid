import 'package:flutter/widgets.dart';

class ResponsiveGrid extends StatelessWidget {
  final double runSpacing;
  final double spacing;
  final List<ResponsiveGridItem> children;
  final int colCount;
  final MainAxisAlignment mainAxisAlignment;
  final CrossAxisAlignment crossAxisAlignment;

  ResponsiveGrid({
    this.children,
    this.runSpacing = 0.0,
    this.spacing = 0.0,
    this.colCount = 12,
    this.mainAxisAlignment = MainAxisAlignment.center,
      this.crossAxisAlignment = CrossAxisAlignment.stretch,
  });

  List<List<ResponsiveGridItem>> _processItems(BuildContext context, BoxConstraints constraints) {
    double screenWidth = constraints.maxWidth;
    List<List<ResponsiveGridItem>> rows = [];
    List<ResponsiveGridItem> row = [];
    int count = 0;
    children.forEach((element) {
      var elementCol = element.cols(screenWidth: screenWidth, colCount: colCount);

      if (count + elementCol > colCount) {
        rows.add(List.from(row));
        row = [];
        count = 0;
      }

      row.add(element);
      count += elementCol;
    });

    if (row.length != 0) {
      rows.add(List.from(row));
    }

    return rows;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          var items = _processItems(context, constraints);
          double screenWidth = constraints.maxWidth;

          return Wrap(
            runSpacing: runSpacing,
            children: <Widget>[
              ...items.map((row) {
                return Container(
                  width: double.infinity,
                  child: IntrinsicHeight(
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: mainAxisAlignment,
                      crossAxisAlignment: crossAxisAlignment,
                      children: <Widget>[
                        ...row.asMap().entries.map((itemEntry) {
                          var item = itemEntry.value;
                          var itemIndex = itemEntry.key;
                          var isLastRowItem = itemIndex == row.length - 1;
                          var shouldAddMargin = !isLastRowItem;
                          var itemCol = item.cols(screenWidth: screenWidth, colCount: colCount);
                          var availableSpace = screenWidth - (row.length - 1) * (spacing ?? 0.0);
                          var itemWidth = availableSpace / (colCount / itemCol);

                          return Container(
                            width: itemWidth,
                            margin: EdgeInsets.only(right: shouldAddMargin ? (spacing ?? 0.0) : 0.0),
                            constraints: BoxConstraints(
                              minWidth: itemWidth,
                              maxWidth: itemWidth,
                            ),
                            child: item.child,
                          );
                        }).toList(),
                      ],
                    ),
                  ),
                );
              }).toList(),
            ],
          );
        },
      ),
    );
  }
}

class ResponsiveGridItem {
  final int xs;
  final int sm;
  final int md;
  final int lg;
  final int xl;
  final Widget child;

  ResponsiveGridItem({
    this.xs,
    this.xl,
    this.sm,
    this.md,
    this.lg,
    this.child,
  });

  int cols({@required double screenWidth, @required int colCount}) {
    //XS
    if (screenWidth < 576) {
      return xs ?? colCount;
    }

    //SM
    if (screenWidth < 768) {
      return sm ?? xs ?? colCount;
    }

    //MD
    if (screenWidth < 992) {
      return md ?? sm ?? xs ?? colCount;
    }

    //LG
    if (screenWidth < 1200) {
      return lg ?? md ?? sm ?? xs ?? colCount;
    }

    return xl ?? lg ?? md ?? sm ?? xs ?? colCount;
  }
}
