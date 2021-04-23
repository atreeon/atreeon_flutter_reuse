import 'package:atreeon_flutter_reuse/FixedWidthTable.dart';
import 'package:flutter/material.dart';

class Demo_FixedWidthTable extends StatelessWidget {
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 100,
          child: FixedWidthTable(
            columnWidths: [
              ColumnDef(40),
              ColumnDef(50),
              ColumnDef(100),
            ],
            data: [
              ['Cellf X', 'lsdfk', 'aslkdjflkasjdlkfj'],
              ['Cell 1', 'lsdfk', 'aslkdjflkasjdlkfj'],
              ['Cell 1', 'lsdfk', 'aslkdjflkasjdlkfj'],
              ['sCell 1', 'lsdfk', 'aslkdjflkasjdlkfj'],
              ['Cell 1', 'lsk', 'aslkdjflkasasdf asdfjdlkfj'],
              ['Celsadfl 1', 'lsdfk', 'aslkdjflkasjdlkfj'],
              ['Cell 1', 'lsdfk', 'aslkdjflkasjdlkfj'],
              ['Cell 1', 'lsk', 'aslkdjflkasjdlkfj'],
              ['Cdell 1', 'lsdfk', 'aslkdjflkasjdlkfj'],
              ['Cell 1', 'lsasdfdfk', 'aslkdjflkasjdlkfj'],
            ],
          ),
        ),
      ],
    );
  }
}
