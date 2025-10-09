import 'package:aaliyahs_collection_estore/src/constants/sizes.dart';
import 'package:aaliyahs_collection_estore/src/constants/text_strings.dart';
import 'package:aaliyahs_collection_estore/src/features/authentication/screens/login/login_screen.dart';
import 'package:aaliyahs_collection_estore/utils/validators/validator.dart';
import 'package:flutter/material.dart';

class SignUpFormWidget extends StatefulWidget {
  const SignUpFormWidget({super.key});

  @override
  State<SignUpFormWidget> createState() => _SignUpFormWidgetState();
}

class _SignUpFormWidgetState extends State<SignUpFormWidget> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: AaliyahFormHeight - 10),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              decoration: const InputDecoration(
                label: Text(AaliyahFirstName),
                prefixIcon: Icon(Icons.person_outline_rounded),
              ),
              controller: _firstNameController,
              validator: AaliyahValidator.validateFirstName,
            ),
            SizedBox(height: AaliyahFormHeight - 20),
            TextFormField(
              decoration: const InputDecoration(
                label: Text(AaliyahLastName),
                prefixIcon: Icon(Icons.person_outline_rounded),
              ),
              controller: _lastNameController,
              validator: AaliyahValidator.validateLastName,
            ),
            SizedBox(height: AaliyahFormHeight - 20),
            TextFormField(
              decoration: const InputDecoration(
                label: Text(AaliyahEmail),
                prefixIcon: Icon(Icons.email_outlined),
              ),
              controller: _emailController,
              validator: AaliyahValidator.validateEmail,
            ),

            SizedBox(height: AaliyahFormHeight - 20),
            TextFormField(
              decoration: const InputDecoration(
                label: Text(AaliyahPassword),
                prefixIcon: Icon(Icons.password_outlined),
              ),
              controller: _passwordController,

              validator: AaliyahValidator.validatePassword,
            ),
            SizedBox(height: AaliyahFormHeight - 20),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const LoginScreen(),
                      ),
                    );
                  }
                },
                child: Text(
                  AaliyahSignup.toUpperCase(),
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
