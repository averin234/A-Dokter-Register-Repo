import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/services.dart';
import 'dart:ui';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../routes/app_pages.dart';

class RegisterDosenView extends StatefulWidget {
  const RegisterDosenView({Key? key}) : super(key: key);

  @override
  _RegisterDosenViewState createState() => _RegisterDosenViewState();
}

class _RegisterDosenViewState extends State<RegisterDosenView>
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
      extendBodyBehindAppBar: true,
      appBar: AppBar(
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
                //     Color(0xffFEC37B),
                //     Color(0xffFF4184),
                //   ],
                // ),
              ),
              child: Opacity(
                opacity: _opacity.value,
                child: Transform.scale(
                  scale: _transform.value,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 100,
                      ),
                      Image.asset(
                        'assets/images/icons/logo.png',
                        width: 160,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                  Container(
                    width: size.width * .9,
                    height: size.width * 1.6,
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
                        SizedBox(),
                        Text(
                          'Register Dosen',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            color: Colors.black.withOpacity(.7),
                          ),
                        ),
                        SizedBox(),
                        component1(Icons.account_circle_outlined,
                            'User name...', false, false),
                        component1(
                            Icons.phone_android_rounded,
                            'No HP...', false, false),
                        componentnamber(Icons.medical_information_rounded,
                            'Instansi...', false, false),
                        component1(Icons.school_rounded,
                            'Falkultas...', false, false),
                        componentnamber(Icons.add_card,
                            'No Induk Dosen...', false, false),
                        component1(Icons.medical_services_rounded,
                            'Spesialis...', false, false),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            component2(
                              'Register',
                              2.6,
                                  () {
                                HapticFeedback.lightImpact();
                                Fluttertoast.showToast(
                                    msg: 'Login button pressed');
                              },
                            ),
                            SizedBox(width: size.width / 25),
                          ],
                        ),
                        SizedBox(),
                    InkWell(
                      onTap: () => Get.toNamed(Routes.LOGIN),
                      child:
                      RichText(
                          text: TextSpan(
                            text: 'Kembali ke login',
                            style: TextStyle(
                              color: Colors.blueAccent,
                              fontSize: 15,
                            ),
                            recognizer: TapGestureRecognizer()
                          ),
                          ),
                        ),
                        SizedBox(),
                      ],
                    ),
                  ),
                  ],),
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

  Widget componentnamber(
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
        keyboardType: isEmail ? TextInputType.number: TextInputType.number,
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

  Widget component2(String string, double width, VoidCallback voidCallback) {
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