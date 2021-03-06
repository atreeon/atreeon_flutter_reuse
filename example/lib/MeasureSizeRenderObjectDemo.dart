import 'package:atreeon_flutter_reuse/MeasureSize.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MeasureSizeRenderObjectDemo(),
    );
  }
}

class MeasureSizeRenderObjectDemo extends StatefulWidget {
  _MeasureSizeRenderObjectDemoState createState() => _MeasureSizeRenderObjectDemoState();
}

class _MeasureSizeRenderObjectDemoState extends State<MeasureSizeRenderObjectDemo> {
  void initState() {
    super.initState();
  }

  Size myChildSize = Size(10, 10);

  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(myChildSize.height.toString()),
        Expanded(
          child: MeasureSize(
            onChange: (size) {
              setState(() {
                myChildSize = size;
              });
            },
            child: Text(myChildSize.height.toString()),
          ),
        )
      ],
    );
  }
}
