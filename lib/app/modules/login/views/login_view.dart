import 'package:a_dokter_register/app/data/componen/fetch_data.dart';
import 'package:a_dokter_register/app/modules/login/controllers/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../data/model/login_and_regist/akses_px.dart';
import '../../../routes/app_pages.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Login();
  }
}

class Login extends StatefulWidget {
  const Login({
    Key? key,
  }) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _opacity;
  late Animation<double> _transform;
  bool isPassword = true;
  final textFieldFocusNode = FocusNode();
  bool _obscured = false;

  void _toggleObscured() {
    setState(() {
      _obscured = !_obscured;
      if (textFieldFocusNode.hasPrimaryFocus)
        return; // If focus is on text field, dont unfocus
      textFieldFocusNode.canRequestFocus =
          false; // Prevents focus if tap on eye
    });
  }

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
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
    final controller = Get.put(LoginController());
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Colors.white, // <-- SEE HERE
          statusBarIconBrightness:
              Brightness.dark, //<-- For Android SEE HERE (dark icons)
          statusBarBrightness:
              Brightness.light, //<-- For iOS SEE HERE (dark icons)
        ),
        title: Image.asset(
          'assets/images/icons/logo.png',
          width: 110,
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          height: size.height,
          child: Container(
            alignment: Alignment.center,
            decoration: const BoxDecoration(
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
                      const SizedBox(
                        height: 130,
                      ),
                      Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Image.asset(
                              'assets/hero.png',
                              width: 250,
                            ),
                          ),
                          const Text(
                              "A-Dokter adalah system management klinik berbasis cloud.",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 12)),
                          const SizedBox(
                            height: 10,
                          )
                        ],
                      ),
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
                            component(Icons.email_outlined, 'Email...', false,
                                true, controller.usernameController),
                            component1(
                                Icons.lock_outline,
                                'Password...',
                                isPassword,
                                false,
                                controller.passwordController),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                component2(
                                  'LOGIN',
                                  2.6,
                                  () async {
                                    HapticFeedback.lightImpact();
                                    if (controller.usernameController.text
                                            .isNotEmpty &&
                                        controller.passwordController.text
                                            .isNotEmpty) {
                                      Get.defaultDialog(
                                        content:
                                            const CircularProgressIndicator(),
                                        title: 'Loading..',
                                        barrierDismissible: false,
                                      );
                                      AksesPx aksesPX = await API.getAksesPx(
                                        pass:
                                            controller.passwordController.text,
                                        user:
                                            controller.usernameController.text,
                                      );
                                      if (aksesPX.code != 200) {
                                        Get.snackbar(aksesPX.code.toString(),
                                            aksesPX.msg.toString());
                                      } else {
                                        aksesPX.res!.kodeKelompok == 1
                                            ? Get.offAllNamed(Routes.HOME)
                                            : aksesPX.res!.kodeKelompok == 2
                                                ? Get.offAllNamed(Routes.DOSEN)
                                                : Get.offAllNamed(
                                                    Routes.MAHASISWA);
                                      }
                                    } else {
                                      Get.snackbar('404',
                                          'Username dan Password harus di Isi');
                                    }
                                  },
                                ),
                                SizedBox(width: size.width / 25),
                              ],
                            ),
                            InkWell(
                              onTap: () => showModalBottomSheet(
                                context: context,
                                shape: const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.vertical(
                                    top: Radius.circular(20),
                                  ),
                                ),
                                builder: (context) => buildSheet(),
                              ),
                              child: RichText(
                                text: const TextSpan(
                                  text: 'Register Akun Baru',
                                  style: TextStyle(
                                    color: Colors.blueAccent,
                                    fontSize: 15,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(),
                          ],
                        ),
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
        margin: const EdgeInsets.symmetric(vertical: 2, horizontal: 0),
        child: Column(
          children: <Widget>[
            const SizedBox(
              height: 5,
            ),
            const Text("Powered by"),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              width: 290,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Image.asset(
                      'assets/logo_averin.png',
                      width: 80,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Image.asset(
                      'assets/logo_ipg.png',
                      width: 80,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
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

  Widget component(
    IconData icon,
    String hintText,
    bool isPassword,
    bool isEmail,
    TextEditingController controller,
  ) {
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
        controller: controller,
        style: TextStyle(color: Colors.black.withOpacity(.8)),
        obscureText: isPassword,
        keyboardType: isEmail ? TextInputType.emailAddress : TextInputType.text,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintMaxLines: 1,
          hintText: hintText,
          prefixIcon: Icon(
            Icons.email_rounded,
            size: 24,
            color: Colors.grey,
          ),
        ),
      ),
    );
  }

  Widget component1(
    IconData icon,
    String hintText,
    bool isPassword,
    bool isEmail,
    TextEditingController controller,
  ) {
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
        controller: controller,
        style: TextStyle(color: Colors.black.withOpacity(.8)),
        obscureText: _obscured,
        keyboardType: TextInputType.visiblePassword,
        focusNode: textFieldFocusNode,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintMaxLines: 1,
          hintText: hintText,
          hintStyle:
              TextStyle(fontSize: 14, color: Colors.black.withOpacity(.5)),
          prefixIcon: Icon(
            Icons.lock_rounded,
            size: 24,
            color: Colors.grey,
          ),
          suffixIcon: Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 4, 0),
            child: GestureDetector(
              onTap: _toggleObscured,
              child: Icon(
                _obscured
                    ? Icons.visibility_rounded
                    : Icons.visibility_off_rounded,
                size: 24,
              ),
            ),
          ),
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
          color: const Color(0xff4796ff),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Text(
          string,
          style:
              const TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
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
        const SizedBox(
          height: 10,
        ),
        Container(
          height: 4,
          margin: EdgeInsets.only(
            right: Get.width / 2 - 40,
            left: Get.width / 2 - 40,
          ),
          decoration: BoxDecoration(
            color: const Color(0xFFe0e0e0),
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        const SizedBox(
          height: 30,
        ),
        InkWell(
          onTap: () => Get.toNamed(Routes.REGISTER_DOKTER),
          child: Container(
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
              children: const [
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
        const SizedBox(
          height: 10,
        ),
        InkWell(
          onTap: () => Get.toNamed(Routes.REGISTER_DOSEN),
          child: Container(
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
              children: const [
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
        const SizedBox(
          height: 10,
        ),
        InkWell(
          onTap: () => Get.toNamed(Routes.REGISTER_MAHASISWA),
          child: Container(
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
              children: const [
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
      ],
    ),
  );
}
