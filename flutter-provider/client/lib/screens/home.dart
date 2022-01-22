import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/index.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  _logout(BuildContext context) {
    context.read<AuthModel>().logout();
  }

  _ping(BuildContext context) {
    context.read<PingModel>().ping();
  }

  _reset(BuildContext context) {
    context.read<PingModel>().reset();
  }

  _goToStats(BuildContext context) {
    Navigator.pushNamed(context, '/stats');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Home"),
          actions: [
            _buildAction(context, 'Ping', _ping),
            _buildAction(context, 'Reset', _reset),
            _buildAction(context, 'Stats', _goToStats),
            _buildAction(context, 'Log-out', _logout),
          ],
        ),
        body: Consumer<PingModel>(builder: (context, ping, _) {
          return ListView.builder(
              padding: const EdgeInsets.all(8),
              itemCount: ping.items.length,
              itemBuilder: (ctx, index) => Center(
                  child: SizedBox(height: 50, child: Text(ping.items[index]))));
        }));
  }
}

TextButton _buildAction(
    BuildContext context, String name, void Function(BuildContext) cb) {
  return TextButton(
      style:
          ButtonStyle(foregroundColor: MaterialStateProperty.all(Colors.white)),
      child: Text(name),
      onPressed: () => cb(context));
}
