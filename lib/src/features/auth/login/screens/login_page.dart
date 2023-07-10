
import 'package:flutter/material.dart';
import 'package:flutter_ws_1/src/comon_widgets/my_button.dart';
import 'package:flutter_ws_1/src/comon_widgets/my_text_field_white.dart';
import 'package:flutter_ws_1/src/configs/config.dart';
import 'package:flutter_ws_1/src/constants/image_strings.dart';
import 'package:flutter_ws_1/src/constants/sizes.dart';
import 'package:flutter_ws_1/src/constants/text_strings.dart';
import 'package:flutter_ws_1/src/features/auth/home/home_landing_page.dart';
import 'package:flutter_ws_1/src/features/auth/repos/user_repo.dart';
import 'package:shared_preferences/shared_preferences.dart';


class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  final _emailWhiteController = TextEditingController();
  final _passwordWhiteController = TextEditingController();
  late SharedPreferences prefs;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initSharedPref();
  }

  void initSharedPref() async {
    prefs = await SharedPreferences.getInstance();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }


  void loginUser() async {
    bool result = false;
    if (_emailController.text.isEmpty || _emailController.text.isEmpty) {
      tShowDialog();
      return;
    }

    if (_emailController.text.isNotEmpty &&
        _passwordController.text.isNotEmpty) {

      result = await UserRepo.userLogin(_emailController.text, _passwordController.text);
      if (result) {
        print("user logged in");
        // Navigator.push(context, MaterialPageRoute(builder: (context)=> PostsPage(token:myToken)));
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => HomeLandingPage()));
      } else {
        tShowDialog();
        return;
        print('Somthing went wrong');
      }
    }
  }

    void tShowDialog() {
    //MyDialog(titleText: 'พบข้อผิดพลาด',contentText: 'โปรด ตรวจสอบ รหัสผ่านอีกครั้ง!!',context: context);
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('พบข้อผิดพลาด'),
        content: const Text(
            'โปรดตรวจสอบ อีเมลล์ และ รหัสผ่านอีกรอบ !!'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(ctx);
            },
            child: const Text('ตกลง'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: Colors.grey[300],
          body: SingleChildScrollView(
            child: (Container(
                padding: const EdgeInsets.all(tDefaultSize),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // logo
                     // const Icon(Icons.lock, size: 100),
                     const Image(image: AssetImage(tWelcomeaLogo),height: 100,width: 100,),
                      const SizedBox(
                        height: 20.0,
                      ),

                      // Welcome back
                      Text(
                        tLoginTitle,
                        style: Theme.of(context).textTheme.headline2,
                      ),
                      Text(
                        tLoginSubTitle,
                        style: Theme.of(context).textTheme.bodyText1,
                      ),

                      
                      // Text(backendUrl,style: Theme.of(context).textTheme.bodyText1,),
                        Text(tAppVersion,style: Theme.of(context).textTheme.bodyText1,),
                      const SizedBox(
                        height: 20.0,
                      ),

                      // Section-2 Form

                      Form(
                        child: Container(
                            padding: EdgeInsets.symmetric(vertical: 20.0),
                            child: Column(
                              children: [
                                MyTextFieldwhite(
                                    controller: _emailController,
                                    hintText: 'E-Mail',
                                    obscureText: false,
                                    myIcon: Icons.person_outline_outlined),
                                const SizedBox(
                                  height: tFormHeight - 20,
                                ),
                                MyTextFieldwhite(
                                    controller: _passwordController,
                                    hintText: 'Password',
                                    obscureText: true,
                                    myIcon: Icons.fingerprint),
                                const SizedBox(
                                  height: tFormHeight,
                                ),
                              MyButton(onTap: loginUser, bText: tLogin.toUpperCase())
                                // ElevatedButton(
                                //     onPressed: () {
                                //       loginUser();
                                //     },
                                //     style: OutlinedButton.styleFrom(
                                //         minimumSize: const Size(200, 50)),
                                //     child: Text(tLogin.toUpperCase())),
                                // // sign in button
                              ],
                            )),
                      ),
                    ],),)),
          )),
    );
  }
}
