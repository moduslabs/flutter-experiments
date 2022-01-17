// Copyright 2020 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:provider_experiment/models/index.dart';

class Login extends StatelessWidget {
  final TextEditingController _emailController =
      TextEditingController(text: "foo");
  final TextEditingController _passwordController =
      TextEditingController(text: "bar");

  Login({Key? key}) : super(key: key);

  _login(BuildContext context) async {
    context
        .read<AuthModel>()
        .login(_emailController.text, _passwordController.text);
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
              )
            ],
          ),
        ),
      ),
    );
  }
}
