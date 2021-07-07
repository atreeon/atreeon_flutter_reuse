import 'package:atreeon_flutter_reuse/AlertDialogW.dart';
import 'package:flutter/material.dart';

class ConfirmCustomButtonW extends StatelessWidget {
  final Widget child;
  final void Function() onConfirmed;

  const ConfirmCustomButtonW({
    Key? key,
    required this.child,
    required this.onConfirmed,
  }) : super(key: key);

  Widget build(BuildContext context) {
    return InkWell(
      child: child,
      onTap: () {
        showDialog<Widget>(
          context: context,
          builder: (_) => AlertDialogYesNoW(
            title: "Are you sure?",
            onPressed: () {
              Navigator.pop(context);
              onConfirmed();
            },
          ),
        );
      },
    );
  }
}
