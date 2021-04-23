import 'package:atreeon_flutter_reuse/IsOnlineW.dart';
import 'package:flutter/material.dart';

class Demo_IsOnlineW extends StatelessWidget {
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text("INTERNET CONNECTION CHECKER"),
        IsOnlineW(
          Text("ah, no interenet"),
          hasInternetChild: Text("Yeah, we got the internet"),
        ),
      ],
    );
  }
}
