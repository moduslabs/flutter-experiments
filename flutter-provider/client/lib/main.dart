import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_experiment/models/index.dart';
import 'package:provider_experiment/screens/index.dart';

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
              '/': (context) => _buildRoute(context, const Home()),
              '/stats': (context) => const Stats(),
              '/login': (context) => _buildRoute(context, Login(),
                  redirectTo: '/', authCheck: false),
            }));
  }
}

Widget _buildRoute(BuildContext context, Widget widget,
    {bool authCheck = true, String redirectTo = '/login'}) {
  if (context.watch<AuthModel>().isAuthenticated == authCheck) {
    return widget;
  }
  Future.microtask(() =>
      Navigator.pushNamedAndRemoveUntil(context, redirectTo, (_) => false));
  return Container();
}
