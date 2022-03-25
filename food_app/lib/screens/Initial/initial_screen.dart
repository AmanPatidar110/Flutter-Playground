import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:food_app/providers/sign_in_provider.dart';
import 'package:food_app/screens/LoginScreen/login_screen.dart';
import 'package:food_app/tabs.dart';
import 'package:provider/provider.dart';

class InitialScreen extends StatelessWidget {
  const InitialScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ChangeNotifierProvider(
        create: (context) => Signin(),
        child: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            final provider = Provider.of<Signin>(context);
            print("connection State ${snapshot.connectionState}");
            if (provider.getIsLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.hasData) {
              print(snapshot.data);
              // Navigator.of(context).pushNamed('/tabs');
              return Tabs();
            } else {
              // Navigator.of(context).pushNamed('/signIn');
              return LoginScreen();
            }
          },
        ),
      ),
    );
  }
}
