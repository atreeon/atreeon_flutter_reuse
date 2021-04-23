//TODO: must re-enable this, waiting on network_state
//https://stackoverflow.com/questions/49648022/check-whether-there-is-an-internet-connection-available-on-flutter-app

import 'package:flutter/material.dart';

class IsOnlineW extends StatelessWidget {
  final Widget? hasInternetChild;
  final Widget noInternetChild;
  final List<String> pingUrls;
  final int pollIntervalNormal;
  final int delayByStart;
  final int pollIntervalAfterSuccess;
  final int timeout;

  IsOnlineW(
    this.noInternetChild, {
    this.hasInternetChild = null,
    this.pollIntervalNormal = 2000,
    this.delayByStart = 6000,
    this.pollIntervalAfterSuccess = 10000,
    this.timeout = 10000,
    this.pingUrls = const ["https://cdn.jsdelivr.net/npm/workbox-cdn@5.0.0/package.json"],
  });

  Widget build(BuildContext context) {
    return Text("TODO IsOnlineW");
  }
}

//import 'package:flutter/material.dart';
//import 'package:network_state/network_state.dart';
//
//class IsOnlineW extends StatefulWidget {
//  final Widget hasInternetChild;
//  final Widget noInternetChild;
//  final List<String> pingUrls;
//  final int pollIntervalNormal;
//  final int delayByStart;
//  final int pollIntervalAfterSuccess;
//  final int timeout;
//
//  IsOnlineW(
//    this.noInternetChild, {
//    this.hasInternetChild = null,
//    this.pollIntervalNormal = 2000,
//    this.delayByStart = 6000,
//    this.pollIntervalAfterSuccess = 10000,
//    this.timeout = 10000,
//    this.pingUrls = const ["https://cdn.jsdelivr.net/npm/workbox-cdn@5.0.0/package.json"],
//  });
//
//  _IsOnlineWState createState() => _IsOnlineWState();
//}
//
//class _IsOnlineWState extends State<IsOnlineW> {
//  final ns = NetworkState();
//
//  bool _hasInternet = true;
//
//  void Function() nsListener;
//
//  //we wait a little bit before we check
//  bool hasWaited = false;
//  bool hasDisposed = false;
//
//  initState() {
//    Future.delayed(Duration(milliseconds: widget.delayByStart)) //
//        .then((value) {
//      if (!hasDisposed) //
//        setState(() => hasWaited = true);
//    });
//
//    NetworkConfig.pingUrls = widget.pingUrls;
//    NetworkConfig.pollIntervalMs = widget.pollIntervalNormal;
//    NetworkConfig.timeoutMs = widget.timeout;
//
//    NetworkState.startPolling();
//    ns.setHasConnection(true);
//
//    nsListener = () async {
//      var result = await ns.isConnected;
//      setState(() => _hasInternet = result);
//      if (_hasInternet) //
//        NetworkConfig.pollIntervalMs = widget.pollIntervalAfterSuccess;
//      else //
//        NetworkConfig.pollIntervalMs = widget.pollIntervalNormal;
//    };
//
//    ns.addListener(nsListener);
//    super.initState();
//  }
//
//  Widget build(BuildContext context) {
//    if (!_hasInternet && hasWaited == true) {
//      return widget.noInternetChild;
//    }
//
//    if (widget.hasInternetChild == null) //
//      Container();
//
//    return widget.hasInternetChild;
//  }
//
//  void dispose() {
//    hasDisposed = true;
//    ns.removeListener(nsListener);
//    super.dispose();
//  }
//}
