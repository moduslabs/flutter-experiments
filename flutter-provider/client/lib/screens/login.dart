import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

import '../models/index.dart';

class Login extends StatelessWidget {
  final TextEditingController _emailController =
      TextEditingController(text: "foo");
  final TextEditingController _passwordController =
      TextEditingController(text: "bar");

  Login({Key? key}) : super(key: key);

  _login(BuildContext context) async {
    if (await context
        .read<AuthModel>()
        .login(_emailController.text, _passwordController.text)) {
      Navigator.pushNamedAndRemoveUntil(context, '/', (_) => false);
      return;
    }

    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: const Text('Error'),
              content: const Text('Wrong credentials'),
              actions: [
                ElevatedButton(
                    onPressed: () => Navigator.of(context).pop(),
                    child: const Text('OK')),
              ],
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(80.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Welcome',
                style: Theme.of(context).textTheme.headline1,
              ),
              TextFormField(
                controller: _emailController,
                decoration: const InputDecoration(
                  hintText: 'Login',
                ),
              ),
              TextFormField(
                controller: _passwordController,
                obscureText: true,
                decoration: const InputDecoration(
                  hintText: 'Password',
                ),
              ),
              const SizedBox(
                height: 24,
              ),
              ElevatedButton(
                child: const Text('ENTER'),
                onPressed: () => _login(context),
              ),
              const SizedBox(
                height: 24,
              ),
              ElevatedButton(
                child: const Text('See stats'),
                onPressed: () => Navigator.pushNamed(context, '/stats'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
