import 'package:alzh/animations/fadeanimation.dart';
import 'package:alzh/screens/home/home.dart';
import 'package:alzh/screens/services/authservice.dart';
import 'package:alzh/screens/signup/signup.dart';
import 'package:flutter/material.dart';
import 'package:alzh/shared/constants.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:firebase_auth/firebase_auth.dart';

class LogIn extends StatefulWidget {
  @override
  _LogInState createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  final formKey = new GlobalKey<FormState>();

  String phoneNo, verificationId, smsCode;

  bool codeSent = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: white,
        body: Form(
          key: formKey,
          child: SingleChildScrollView(
            child: Container(
                child: Column(
              children: [
                Container(
                    height: 400,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                      image: AssetImage('assets/backgrounds/background.png'),
                      fit: BoxFit.fill,
                    )),
                    child: Stack(children: [
                      Positioned(
                          left: 30,
                          width: 80,
                          height: 200,
                          child: FadeAnimation(
                              1,
                              Container(
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: AssetImage(
                                              'assets/backgrounds/light-1.png')))))),
                      Positioned(
                          left: 140,
                          width: 80,
                          height: 150,
                          child: FadeAnimation(
                              1.3,
                              Container(
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: AssetImage(
                                              'assets/backgrounds/light-2.png')))))),
                      Positioned(
                          right: 40,
                          top: 40,
                          width: 80,
                          height: 150,
                          child: FadeAnimation(
                              1.5,
                              Container(
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: AssetImage(
                                              'assets/backgrounds/clock.png')))))),
                      Positioned(
                          child: FadeAnimation(
                              1.6,
                              Container(
                                  margin: EdgeInsets.only(top: 50.0),
                                  child: Center(
                                      child: Text(
                                    'INGRESAR',
                                    style: GoogleFonts.acme(
                                      fontSize: 45.0,
                                      color: white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ))))),
                    ])),
                Padding(
                    padding:
                        EdgeInsets.only(left: 30.0, right: 30.0, top: 50.0),
                    child: Column(children: [
                      FadeAnimation(
                        1.8,
                        Container(
                          padding: EdgeInsets.all(5.0),
                          decoration: BoxDecoration(
                              color: white,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                    color: Color.fromRGBO(143, 140, 251, .2),
                                    blurRadius: 20.0,
                                    offset: Offset(0, 10))
                              ]),
                          child: Column(
                            children: [
                              Container(
                                padding: EdgeInsets.all(8.0),
                                decoration: BoxDecoration(
                                    border: Border(
                                        bottom: BorderSide(color: grey[100]))),
                                child: TextFormField(
                                  keyboardType: TextInputType.text,
                                  decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: "Nombre",
                                      hintStyle: GoogleFonts.signika(
                                        fontSize: 18.0,
                                        color: grey[400],
                                      )),
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.all(8.0),
                                decoration: BoxDecoration(
                                    border: Border(
                                        bottom: BorderSide(color: grey[100]))),
                                child: TextFormField(
                                  keyboardType: TextInputType.number,
                                  decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: "Edad",
                                      hintStyle: GoogleFonts.signika(
                                        fontSize: 18.0,
                                        color: grey[400],
                                      )),
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.all(8.0),
                                decoration: BoxDecoration(
                                    border: Border(
                                        bottom: BorderSide(color: grey[100]))),
                                child: TextFormField(
                                  keyboardType: TextInputType.phone,
                                  decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: "Numero Telefono",
                                      hintStyle: GoogleFonts.signika(
                                        fontSize: 18.0,
                                        color: grey[400],
                                      )),
                                  onChanged: (val) {
                                    setState(() {
                                      this.phoneNo = val;
                                    });
                                  },
                                ),
                              ),
                              codeSent
                                  ? Padding(
                                      padding: EdgeInsets.only(
                                          left: 25.0, right: 25.0),
                                      child: TextFormField(
                                        keyboardType: TextInputType.phone,
                                        decoration: InputDecoration(
                                            hintText: 'Codigo Oculto'),
                                        onChanged: (val) {
                                          setState(() {
                                            this.smsCode = val;
                                          });
                                        },
                                      ))
                                  : Container(),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 70),
                      FadeAnimation(
                        2,
                        InkWell(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => Home()));
                          },
                          child: Container(
                            height: 50,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                gradient: LinearGradient(colors: [
                                  Color.fromRGBO(143, 140, 251, 1),
                                  Color.fromRGBO(143, 140, 251, .6)
                                ])),
                            child: Center(
                              child: ElevatedButton(
                                  child: Center(
                                      child: codeSent
                                          ? Text('Login')
                                          : Text('Verify')),
                                  onPressed: () {
                                    //codeSent ? AuthService().signInWithOTP(smsCode, verificationId):verifyPhone(phoneNo);
                                  }),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 30.0),
                      FadeAnimation(
                          1.5,
                          InkWell(
                            onTap: () {
                              Navigator.pop(context);
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => SignUp()));
                            },
                            child: Text("No tiene acceso a la aplicacion?",
                                style: GoogleFonts.signika(
                                  fontSize: 16.0,
                                  color: Color.fromRGBO(143, 140, 251, 1),
                                )),
                          ))
                    ]))
              ],
            )),
          ),
        ));
  }

  Future<void> verifyPhone(phoneNo) async {
    final PhoneVerificationCompleted verified = (AuthCredential authResult) {
      AuthService().signIn(authResult);
    };

    final PhoneVerificationFailed verificationfailed =
        (FirebaseAuthException authException) {
      print('${authException.message}');
    };

    final PhoneCodeSent smsSent = (String verId, [int forceResend]) {
      this.verificationId = verId;
      setState(() {
        this.codeSent = true;
      });
    };

    final PhoneCodeAutoRetrievalTimeout autoTimeout = (String verId) {
      this.verificationId = verId;
    };

    await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: phoneNo,
        timeout: const Duration(seconds: 5),
        verificationCompleted: verified,
        verificationFailed: verificationfailed,
        codeSent: smsSent,
        codeAutoRetrievalTimeout: autoTimeout);
  }
}
