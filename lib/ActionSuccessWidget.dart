import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';

///Provides a way to handle success & error messages after an action has been processed
///
/// The appState should include a list of completedActionKeys
///
///if the actionKey is added to the store's appState.completedActionKeys
/// then the onSuccess function is run & a new actionKey is created
class ActionSuccessWidget extends StatefulWidget {
  final Widget Function(BuildContext, int) builder;
  final void Function() onSuccess;
  final StreamSubscription Function(int, void Function()) getCompletedStream;

  const ActionSuccessWidget({
    Key? key,
    required this.builder,
    required this.onSuccess,
    required this.getCompletedStream,
  }) : super(key: key);

  _ActionSuccessWidgetState createState() => _ActionSuccessWidgetState();
}

class _ActionSuccessWidgetState extends State<ActionSuccessWidget> {
  late int actionKey;
  late StreamSubscription onActionKeyCompleteStream;

  void initState() {
    //set new actionKey
    actionKey = Random.secure().nextInt(500000);
    
    //onComplete stream
    onActionKeyCompleteStream = widget.getCompletedStream(actionKey, reset);
    super.initState();
  }

  void reset() async {
    await onActionKeyCompleteStream.cancel();

    setState(() {
      actionKey = Random.secure().nextInt(500000);
      widget.onSuccess();
      onActionKeyCompleteStream = widget.getCompletedStream(actionKey, reset);
    });
  }

  Widget build(BuildContext context) {
    return widget.builder(context, this.actionKey);
  }
}
