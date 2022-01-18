import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_experiment/models/index.dart';
import 'package:provider_experiment/screens/login.dart';
import 'package:provider_experiment/screens/home.dart';

import 'injector.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setup();
  runApp(ChangeNotifierProvider(
      create: (context) => AuthModel(), child: const App()));
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProxyProvider<AuthModel, PingModel>(
              create: (_) => PingModel(),
              update: (_, auth, ping) => (ping ?? PingModel())..update(auth))
        ],
        child: MaterialApp(
            debugShowCheckedModeBanner: false,
            title: "Experiment",
            theme: ThemeData(primarySwatch: Colors.blue),
            routes: {
              '/': (context) => genRoute(context, const Home()),
              '/login': (context) => Login(),
            }));
  }
}

Widget genRoute(BuildContext context, Widget widget) {
  return context.watch<AuthModel>().isAuthenticated ? widget : Login();
}
