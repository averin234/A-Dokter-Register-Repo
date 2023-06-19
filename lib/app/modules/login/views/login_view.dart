import 'package:a_dokter_register/app/modules/login/controllers/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/services.dart';
import 'dart:ui';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

import '../../../routes/app_pages.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Login();
  }
}


class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _opacity;
  late Animation<double> _transform;

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 3),
    );

    _opacity = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.ease,
      ),
    )..addListener(() {
      setState(() {});
    });

    _transform = Tween<double>(begin: 2, end: 1).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.fastLinearToSlowEaseIn,
      ),
    );

    _controller.forward();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Colors.white, // <-- SEE HERE
          statusBarIconBrightness: Brightness.dark, //<-- For Android SEE HERE (dark icons)
          statusBarBrightness: Brightness.light, //<-- For iOS SEE HERE (dark icons)
        ),
        title:  Image.asset(
          'assets/images/icons/logo.png',
          width: 110,
        ),
        brightness: Brightness.dark,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: ScrollConfiguration(
        behavior: MyBehavior(),
        child: SingleChildScrollView(
          child: SizedBox(
            height: size.height,
            child: Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                // gradient: LinearGradient(
                //   begin: Alignment.topLeft,
                //   end: Alignment.bottomRight,
                //   colors: [
                //     Color(0xffc9edf8),
                //     Color(0xffc1edfa),
                //   ],
                // ),
              ),
              child: Opacity(
                opacity: _opacity.value,
                child: Transform.scale(
                  scale: _transform.value,
                  child: Column(
                    children: [
                      SizedBox(
                        height: 130,
                      ),
                      Column(children: [
                        Padding(padding: EdgeInsets.only(left: 10),
                      child : Image.asset(
                        'assets/hero.png',
                        width: 250,
                      ),
                      ),
                        Text("A-Dokter adalah system management klinik berbasis cloud.",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 12)),
                        SizedBox(
                          height: 10,
                        )
                      ],),
                    Container(
                    width: size.width * .9,
                    height: size.width * 0.8,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(.1),
                          blurRadius: 90,
                        ),
                      ],
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          'Sign In',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            color: Colors.black.withOpacity(.7),
                          ),
                        ),
                        component1(
                            Icons.email_outlined, 'Email...', false, true),
                        component1(
                            Icons.lock_outline, 'Password...', true, false),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            component2(
                              'LOGIN',
                              2.6,
                                  () {
                                HapticFeedback.lightImpact();
                                Get.toNamed(Routes.HOME);
                              },
                            ),
                            SizedBox(width: size.width / 25),
                          ],
                        ),
                        InkWell(
                          onTap: () => showModalBottomSheet(

                            context: context,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.vertical(
                                top: Radius.circular(20),
                              ),
                            ),
                            builder: (context) => buildSheet(),
                          ),
                          child: RichText(
                          text: TextSpan(
                            text: 'Register Akun Baru',
                            style: TextStyle(
                              color: Colors.blueAccent,
                              fontSize: 15,
                            ),
                          ),
                        ),
                        ),
                        SizedBox(),
                      ],
                    ),
                  ),
                  ],)
                ),
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: const Color(0xFFe0e0e0).withOpacity(0.5),
              spreadRadius: 0,
              blurRadius: 10,
              offset: const Offset(2, 1),
            ),
          ],
        ),
        height: 75,
        margin: EdgeInsets.symmetric(vertical: 2, horizontal: 0),
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 5,
            ),
            Text("Powered by"),
            SizedBox(
              height: 10,
            ),
            Container(
              width: 290,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(padding: EdgeInsets.only(left: 10),
                      child : Image.asset(
                        'assets/logo_averin.png',
                        width: 80,
                      ),),
                  Padding(padding: EdgeInsets.only(left: 10),
                    child : Image.asset(
                      'assets/logo_ipg.png',
                      width: 80,
                    ),),
                  Padding(padding: EdgeInsets.only(left: 10),
                    child : Image.asset(
                      'assets/logo_privy.png',
                      width: 80,
                    ),),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget component1(
      IconData icon, String hintText, bool isPassword, bool isEmail) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.width / 8,
      width: size.width / 1.22,
      alignment: Alignment.center,
      padding: EdgeInsets.only(right: size.width / 30),
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(.05),
        borderRadius: BorderRadius.circular(10),
      ),
      child: TextField(
        style: TextStyle(color: Colors.black.withOpacity(.8)),
        obscureText: isPassword,
        keyboardType: isEmail ? TextInputType.emailAddress : TextInputType.text,
        decoration: InputDecoration(
          prefixIcon: Icon(
            icon,
            color: Colors.black.withOpacity(.7),
          ),
          border: InputBorder.none,
          hintMaxLines: 1,
          hintText: hintText,
          hintStyle:
          TextStyle(fontSize: 14, color: Colors.black.withOpacity(.5)),
        ),
      ),
    );
  }

  Widget component2(String string, double width, void Function() voidCallback) {
    Size size = MediaQuery.of(context).size;
    return InkWell(
      highlightColor: Colors.transparent,
      splashColor: Colors.transparent,
      onTap: voidCallback,
      child: Container(
        height: size.width / 8,
        width: size.width / width,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Color(0xff4796ff),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Text(
          string,
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}
Widget buildSheet() {
  return Container(
    height: 220,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        color: Colors.transparent,
      ),
      child: Column(
        children: [
          SizedBox(
            height: 10,
          ),
          Container(
            height: 4,
            margin: EdgeInsets.only(
              right: Get.width / 2 - 40,
              left: Get.width / 2 - 40,
            ),
            decoration: BoxDecoration(
              color: Color(0xFFe0e0e0),
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          InkWell(
            onTap: () => Get.toNamed(Routes.REGISTER_DOKTER),
          child : Container(
            height: 45,
            width: 305,
            decoration: BoxDecoration(
              color: Colors.green,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: Colors.green.withOpacity(0.5),
                  spreadRadius: 0,
                  blurRadius: 10,
                  offset: const Offset(2, 1),
                ),
              ],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Register Dokter",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 14),
                )
              ],
            ),
          ),
          ),
          SizedBox(
            height: 10,
          ),
          InkWell(
            onTap: () => Get.toNamed(Routes.REGISTER_DOSEN),
          child : Container(
            height: 45,
            width: 305,
            decoration: BoxDecoration(
              color: Colors.green,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: Colors.green.withOpacity(0.5),
                  spreadRadius: 0,
                  blurRadius: 10,
                  offset: const Offset(2, 1),
                ),
              ],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Register Dosen",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 14),
                )
              ],
            ),
          ),
          ),
          SizedBox(
            height: 10,
          ),
          InkWell(
            onTap: () => Get.toNamed(Routes.REGISTER_MAHASISWA),
            child : Container(
            height: 45,
            width: 305,
            decoration: BoxDecoration(
              color: Colors.green,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: Colors.green.withOpacity(0.5),
                  spreadRadius: 0,
                  blurRadius: 10,
                  offset: const Offset(2, 1),
                ),
              ],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Register Mahasiswa",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 14),
                )
              ],
            ),
          ),
          ),
  ],),);
}
class MyBehavior extends ScrollBehavior {
  @override
  Widget buildViewportChrome(
      BuildContext context,
      Widget child,
      AxisDirection axisDirection,
      ) {
    return child;
  }
}