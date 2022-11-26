import 'package:alzh/profile/profile_page.dart';
import 'package:alzh/screens/home/home.dart';
import 'package:alzh/screens/services/authservice.dart';
import 'package:alzh/screens/splashscreen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:alzh/evaluation/evaluation.dart';
import 'package:alzh/scoped_models/model.dart';
import 'package:alzh/screens/splashscreen.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:alzh/screens/login/login.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();
  runApp(new Remember());
}

class Remember extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final MainModel _model = MainModel();

    return ScopedModel<MainModel>(
      model: _model,
      child: MaterialApp(
        title: 'Remember',
        theme: ThemeData(
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        debugShowCheckedModeBanner: false,
        //home: AuthService().handleAuth()
        home: LogIn(),
      ),
    );
  }
}
