import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:food_app/providers/sign_in_provider.dart';
import 'package:food_app/widgets/custom_text.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(2.0),
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const CustomText(
                text: "Welcome To The Food App",
                size: 30,
              ),
              const SizedBox(height: 30),
              Consumer<Signin>(
                builder: (context, value, _) => OutlinedButton.icon(
                  onPressed: () {
                    value.signIn();
                  },
                  icon: const FaIcon(FontAwesomeIcons.googlePlusG),
                  label: const CustomText(
                    text: "Sign in with Google",
                    weight: FontWeight.bold,
                  ),
                  style: OutlinedButton.styleFrom(
                    alignment: Alignment.center,
                    shape: StadiumBorder(),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
