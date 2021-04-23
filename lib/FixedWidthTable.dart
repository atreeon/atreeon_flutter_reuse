import 'package:dartx/dartx.dart';
import 'package:flutter/material.dart';

class FixedWidthTable extends StatelessWidget {
  final List<ColumnDef> columnWidths;
  final List<List<String>> data;
  FixedWidthTable({
    required this.columnWidths,
    required this.data,
  });

  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
          children: //
              data.map((e) => //
                  TheRow(columnWidths, e)).toList()),
    );
  }
}

class ColumnDef {
  final int width;
  ColumnDef(this.width);
}

class TheRow extends StatelessWidget {
  final List<ColumnDef> columns;
  final List<String> rowData;
  TheRow(this.columns, this.rowData);

  Widget build(BuildContext context) {
    return Row(
      children: columns
          .mapIndexed(
            (i, col) => //
                Container(
              width: col.width.toDouble(),
              child: Text(rowData[i]),
            ),
          ) //
          .toList(),
    );
  }
}
