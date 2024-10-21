import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:spotify_clone/common/widgets/appbar/app_bar.dart';
import 'package:spotify_clone/common/widgets/button/basic_app_button.dart';
import 'package:spotify_clone/core/configs/assets/app_vectors.dart';
import 'package:spotify_clone/data/models/auth/signin_user_req.dart';
import 'package:spotify_clone/domain/usecases/auth/signin.dart';
import 'package:spotify_clone/presentation/auth/pages/signup.dart';
import 'package:spotify_clone/presentation/home/pages/home.dart';
import 'package:spotify_clone/service_locator.dart';

class SigninPage extends StatelessWidget {
  SigninPage({super.key});

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: _signInText(context),
        appBar: BasicAppbar(
          title: SvgPicture.asset(AppVectors.logo, height: 40, width: 40),
        ),
        body: SingleChildScrollView(
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
              BasicAppButton(
                title: 'Sign In',
                onPressed: () async {
                  var result = await sl<SigninUseCase>().call(
                      params: SigninUserReq(
                    email: _emailController.text,
                    password: _passwordController.text,
                  ));

                  result.fold(
                    (l) {
                      var snackbar = SnackBar(
                        content: Text(l),
                        behavior: SnackBarBehavior.floating,
                      );
                      ScaffoldMessenger.of(context).showSnackBar(snackbar);
                    },
                    (r) {
                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const HomePage()),
                          (route) => false);
                    },
                  );
                },
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

  Widget _emailField(BuildContext context) {
    return TextField(
        controller: _emailController,
        decoration: const InputDecoration(
          hintText: 'Email',
        ).applyDefaults(
          Theme.of(context).inputDecorationTheme,
        ));
  }

  Widget _passwordField(BuildContext context) {
    return TextField(
        controller: _passwordController,
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
            'Not a member?',
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 14,
            ),
          ),
          TextButton(
              onPressed: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => SignupPage()));
              },
              child: const Text('Register')),
        ],
      ),
    );
  }
}
