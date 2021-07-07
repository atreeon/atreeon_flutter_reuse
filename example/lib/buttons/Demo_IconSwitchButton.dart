import 'package:atreeon_flutter_reuse/buttons/IconToggleButton.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Demo_IconSwitchButton extends StatefulWidget {
  _Demo_IconSwitchButtonState createState() => _Demo_IconSwitchButtonState();
}

class _Demo_IconSwitchButtonState extends State<Demo_IconSwitchButton> {
  bool value = false;

  Widget build(BuildContext context) {
    return Column(
      children: [
        IconToggleButton(
          value: value,
          selected: FontAwesomeIcons.arrowCircleUp,
          notSelected: FontAwesomeIcons.circle,
          onPressed: () {
            setState(() {
              value = !value;
            });
            print("pressed");
          },
          size: 50,
        ),
        Text("can we overlay with inkwell? Doesn't work if seconds >30"),
        Switch(
          value: value,
          onChanged: (blah) {
            if (value) //
              setState(() => value = !value);
          },
        ),
        InkWell(
          onTap: () => setState(() {
            print(DateTime.now().second);
            if (DateTime.now().second < 30) //
              value = !value;
          }),
          child: IconToggleButton(
            value: value,
            selected: FontAwesomeIcons.arrowCircleUp,
            notSelected: FontAwesomeIcons.circle,
            onPressed: () {
              setState(() {
                value = !value;
              });
              print("pressed");
            },
            size: 50,
          ),
        ),
      ],
    );
  }
}
