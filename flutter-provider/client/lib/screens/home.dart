import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_experiment/models/index.dart';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Home"),
          actions: [
            TextButton(
                style: ButtonStyle(
                    foregroundColor: MaterialStateProperty.all(Colors.white)),
                child: const Text('PING'),
                onPressed: () => _ping(context)),
            TextButton(
                style: ButtonStyle(
                    foregroundColor: MaterialStateProperty.all(Colors.white)),
                child: const Text('RESET'),
                onPressed: () => _reset(context)),
            TextButton(
                style: ButtonStyle(
                    foregroundColor: MaterialStateProperty.all(Colors.white)),
                child: const Text('LOG-OUT'),
                onPressed: () => _logout(context))
          ],
        ),
        body: Consumer<PingModel>(builder: (context, ping, _) {
          return ListView.builder(
              padding: const EdgeInsets.all(8),
              itemCount: ping.items.length,
              itemBuilder: (ctx, index) {
                final item = ping.items[index];
                return SizedBox(height: 50, child: Text(item));
              });
        }));
  }
}
