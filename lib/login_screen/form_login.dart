import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:test_app/login_screen/sign_button.dart';
import 'package:test_app/login_screen/textfield_password.dart';
import 'package:test_app/login_screen/textfield_phone.dart';

class FormLogin extends StatefulWidget {
  @override
  _FormLoginState createState() => _FormLoginState();
}

class _FormLoginState extends State<FormLogin> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          PhoneTextField(
            controller: phoneController,
          ),
          PasswordTextField(
            controller: passwordController,
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Chính sách & điều khoản!',
                  style: TextStyle(color: Colors.red),
                ),
                const Text('Quên mật khẩu?'),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SignButton(
                  backgroundColor: Colors.black,
                  textColor: Colors.white,
                  text: 'Đăng nhập'.toUpperCase(),
                  func: () async {
                    if (_formKey.currentState.validate()) {
                      SharedPreferences prefs =
                          await SharedPreferences.getInstance();
                      if (prefs.getString(phoneController.text) != null &&
                          passwordController.text ==
                              prefs.getString(phoneController.text)) {
                        Scaffold.of(context).showSnackBar(
                            SnackBar(content: Text('Login scuccess')));
                        await prefs.setBool('isLogin', true);
                        Navigator.pushNamed(context, '/welcome');
                      } else {
                        Scaffold.of(context).showSnackBar(SnackBar(
                            content: Text('Wrong phone number or password')));
                      }
                    }
                  },
                ),
                SizedBox(
                  width: 20,
                ),
                SignButton(
                  backgroundColor: Colors.white,
                  textColor: Colors.black,
                  text: 'Đăng ký'.toUpperCase(),
                  func: () async {
                    if (_formKey.currentState.validate()) {
                      SharedPreferences prefs =
                          await SharedPreferences.getInstance();
                      if (prefs.containsKey(phoneController.text)) {
                        Scaffold.of(context).showSnackBar(
                            SnackBar(content: Text('Account existed')));
                      } else {
                        prefs.setString(
                            phoneController.text, passwordController.text);
                        Scaffold.of(context).showSnackBar(
                            SnackBar(content: Text('Sign up completed')));
                      }
                    }
                  },
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
