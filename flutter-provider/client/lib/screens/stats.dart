import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/ping.dart';

class Stats extends StatelessWidget {
  const Stats({Key? key}) : super(key: key);

  @override
  Widget build(context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Stats"),
        ),
        body: Consumer<PingModel>(builder: (context, ping, _) {
          return Center(
              child: Text('Pinged ${context.watch<PingModel>().count} times'));
        }));
  }
}
