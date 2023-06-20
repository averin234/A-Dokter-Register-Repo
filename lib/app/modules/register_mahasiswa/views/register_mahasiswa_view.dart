import 'package:a_dokter_register/app/data/componen/fetch_data.dart';
import 'package:a_dokter_register/app/modules/register_mahasiswa/controllers/register_mahasiswa_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/services.dart';
import 'dart:ui';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../routes/app_pages.dart';

class RegisterMahasiswaView extends StatefulWidget {
  const RegisterMahasiswaView({Key? key}) : super(key: key);

  @override
  _RegisterMahasiswaViewState createState() => _RegisterMahasiswaViewState();
}

class _RegisterMahasiswaViewState extends State<RegisterMahasiswaView>
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
                        height: size.width * 1.9,
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
                              'Register Mahasiswa',
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
                                Icons.email_outlined, 'Email...', false, true),
                            component1(Icons.phone_android_rounded, 'No HP...',
                                false, false),
                            component1(Icons.school_rounded, 'Instansi...',
                                false, false),
                            component1(Icons.school_outlined,
                                'No. Induk Mahasiswa...', false, false),
                            component1(Icons.school_rounded, 'Falkultas...',
                                false, false),
                            component1(Icons.medical_information_rounded,
                                'Spesialis...', false, false),
                            component1(Icons.calendar_month_rounded,
                                'Tahun Masuk...', false, false),
                            component1(Icons.school_outlined, 'Semester...',
                                false, false),
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
                              child: RichText(
                                text: TextSpan(
                                    text: 'Kembali ke login',
                                    style: TextStyle(
                                      color: Colors.blueAccent,
                                      fontSize: 15,
                                    ),
                                    recognizer: TapGestureRecognizer()),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 40,
                      ),
                    ],
                  )),
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
                  Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Image.asset(
                      'assets/logo_averin.png',
                      width: 80,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Image.asset(
                      'assets/logo_ipg.png',
                      width: 80,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Image.asset(
                      'assets/logo_privy.png',
                      width: 80,
                    ),
                  ),
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

  Widget component2(String string, double width, VoidCallback voidCallback) {
    Size size = MediaQuery.of(context).size;
    final controller = Get.put(RegisterMahasiswaController());
    return InkWell(
      onTap: () async {
        if (controller.namaController.text.isNotEmpty &&
            controller.emailController.text.isNotEmpty &&
            controller.nikPasienController.text.isNotEmpty &&
            controller.jenisKelaminController.text.isNotEmpty &&
            controller.tglLhrController.text.isNotEmpty &&
            controller.noTelpController.text.isNotEmpty &&
            controller.alamatController.text.isNotEmpty &&
            controller.alergiController.text.isNotEmpty &&
            controller.golDarahController.text.isNotEmpty &&
            controller.passwordController.value.text.isNotEmpty) {
          if (controller.passwordController.value.text ==
              controller.confirmPassController.value.text) {
            dynamic daftarPXBaru = await API.postDaftarPxBaruDokter(
              namaPasien: controller.namaController.text,
              email: controller.emailController.text,
              noKtp: controller.nikPasienController.text,
              jenisKelamin: controller.jenisKelaminController.text,
              tanggalLahir: controller.tglLhrController.text,
              noHp: controller.noTelpController.text,
              alamat: controller.alamatController.text,
              alergi: controller.alergiController.text,
              golonganDarah: controller.golDarahController.text,
              password: controller.passwordController.value.text,
            );
            if (daftarPXBaru['code'] != 200) {
              Get.snackbar(daftarPXBaru['code'].toString(),
                  daftarPXBaru['msg'].toString());
            } else {
              Get.offAllNamed(Routes.HOME);
            }
          } else {
            Get.snackbar(
                'Gagal Proses', 'Password dan Confirm Password berbeda');
          }
        } else {
          Get.snackbar('title', 'message');
        }
      },
      highlightColor: Colors.transparent,
      splashColor: Colors.transparent,
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
