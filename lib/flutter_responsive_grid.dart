import 'package:flutter/widgets.dart';

class ResponsiveGrid extends StatelessWidget {
  final double runSpacing;
  final double spacing;
  final List<ResponsiveGridItem> children;
  final double itemHeight;
  final int colCount;

  ResponsiveGrid({
    this.children,
    this.runSpacing,
    this.spacing,
    this.itemHeight,
    this.colCount = 12,
  });

  List<List<ResponsiveGridItem>> _processItems(BuildContext context, BoxConstraints constraints) {
    double screenWidth = constraints.maxWidth;
    List<List<ResponsiveGridItem>> rows = [];
    List<ResponsiveGridItem> row = [];
    int count = 0;
    children.forEach((element) {
      int elementCol = element.cols(screenWidth, colCount: colCount);

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

          return Column(
            children: <Widget>[
              ...items.asMap().entries.map((rowEntry) {
                var row = rowEntry.value;
                var rowIndex = rowEntry.key;
                var isLastRow = rowIndex == items.length - 1;

                return Container(
                  margin: EdgeInsets.only(bottom: isLastRow ? 0.0 : (runSpacing ?? 0.0)),
                  child: Row(
                    children: <Widget>[
                      ...row.asMap().entries.map((itemEntry) {
                        var item = itemEntry.value;
                        var itemIndex = itemEntry.key;
                        var isLastRowItem = itemIndex == row.length - 1;

                        double availableSpace = screenWidth - (row.length - 1) * (spacing ?? 0.0);
                        int itemCol = item.cols(screenWidth);
                        double itemWith = availableSpace / (12 / itemCol);
                        return Container(
                          margin: EdgeInsets.only(right: isLastRowItem ? 0.0 : (spacing ?? 0.0)),
                          width: itemWith,
                          child: item.child,
                        );
                      }).toList(),
                    ],
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

  int cols(double screenWidth, {int colCount = 12}) {
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
