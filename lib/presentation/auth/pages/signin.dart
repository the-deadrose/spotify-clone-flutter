import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:spotify_clone/common/widgets/appbar/app_bar.dart';
import 'package:spotify_clone/common/widgets/button/basic_app_button.dart';
import 'package:spotify_clone/core/configs/assets/app_vectors.dart';

class SigninPage extends StatelessWidget {
  const SigninPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: _signInText(context),
        appBar: BasicAppBar(
          title: SvgPicture.asset(AppVectors.logo, height: 40, width: 40),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 50),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _registerText(),
              const SizedBox(height: 50),
              // _fullNameField(context),
              // const SizedBox(height: 20),
              _emailField(context),
              const SizedBox(height: 20),
              _passwordField(context),
              const SizedBox(height: 20),
              _recoveryPassword(context),
              const SizedBox(height: 20),
              BasicAppButton(
                title: 'Sign In',
                onPressed: () {},
              ),
            ],
          ),
        ));
  }

  Widget _registerText() {
    return const Text(
      'Sign In',
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 25,
      ),
      textAlign: TextAlign.center,
    );
  }

  Widget _recoveryPassword(BuildContext context) {
    return TextButton(
      onPressed: () {},
      child: const Text(
        'Forgot password?',
        style: TextStyle(
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }

  Widget _emailField(BuildContext context) {
    return TextField(
        decoration: const InputDecoration(
      hintText: 'Email',
    ).applyDefaults(
      Theme.of(context).inputDecorationTheme,
    ));
  }

  Widget _passwordField(BuildContext context) {
    return TextField(
        decoration: const InputDecoration(
      hintText: 'Password',
    ).applyDefaults(
      Theme.of(context).inputDecorationTheme,
    ));
  }

  Widget _signInText(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Do you have an account?',
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 14,
            ),
          ),
          TextButton(onPressed: () {}, child: const Text('Sign in'))
        ],
      ),
    );
  }
}
