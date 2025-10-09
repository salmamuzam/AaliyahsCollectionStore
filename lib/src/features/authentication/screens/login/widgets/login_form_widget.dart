import 'package:aaliyahs_collection_estore/bottom_nav.dart';
import 'package:aaliyahs_collection_estore/src/constants/sizes.dart';
import 'package:aaliyahs_collection_estore/src/constants/text_strings.dart';
import 'package:aaliyahs_collection_estore/utils/validators/validator.dart';
import 'package:flutter/material.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool _obscurePassword = true;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: AaliyahFormHeight - 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.email_outlined),
                labelText: AaliyahEmail,
                hintText: AaliyahEmail,
                border: OutlineInputBorder(),
              ),
              controller: _emailController,
              validator: AaliyahValidator.validateEmail,
            ),
            const SizedBox(height: AaliyahFormHeight),
            TextFormField(
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.password_outlined),
                labelText: AaliyahPassword,
                hintText: AaliyahPassword,
                border: OutlineInputBorder(),

                suffixIcon: IconButton(
                  onPressed: () {
                    setState(() {
                      _obscurePassword = !_obscurePassword;
                    });
                  },
                  icon: Icon(
                    _obscurePassword
                        ? Icons.remove_red_eye_sharp
                        : Icons.visibility_off_outlined,
                  ),
                ),
              ),
              controller: _passwordController,
              obscureText: _obscurePassword,
              validator: AaliyahValidator.validatePassword,
            ),
            const SizedBox(height: AaliyahFormHeight - 20),
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {},
                child: Text(AaliyahForgetPassword),
              ),
            ),
            const SizedBox(height: AaliyahFormHeight - 20),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const BottomNavBar(),
                      ),
                    );
                  }
                },
                child: Text(
                  AaliyahLogin.toUpperCase(),
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
