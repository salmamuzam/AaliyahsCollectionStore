import 'package:aaliyahs_collection_estore/src/constants/sizes.dart';
import 'package:aaliyahs_collection_estore/src/constants/text_strings.dart';
import 'package:aaliyahs_collection_estore/src/features/authentication/screens/signup/signup_screen.dart';
import 'package:flutter/material.dart';

class LoginFooterWidget extends StatelessWidget {
  const LoginFooterWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Text("OR"),
        const SizedBox(height: AaliyahFormHeight - 20),
        SizedBox(
          width: double.infinity,
          child: OutlinedButton(
            onPressed: () {
                 Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const SignupScreen()),
                      );
            },
            child: Text(AaliyahSignup.toUpperCase(), style: TextStyle(
                      fontWeight: FontWeight.bold)),
          ),
        ),
      ],
    );
  }
}
