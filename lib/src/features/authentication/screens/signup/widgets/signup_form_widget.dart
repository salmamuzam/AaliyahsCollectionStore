import 'package:aaliyahs_collection_estore/src/constants/sizes.dart';
import 'package:aaliyahs_collection_estore/src/constants/text_strings.dart';
import 'package:flutter/material.dart';

class SignUpFormWidget extends StatelessWidget {
  const SignUpFormWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: AaliyahFormHeight - 10),
      child: Form(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              decoration: const InputDecoration(
                label: Text(AaliyahFirstName),
                prefixIcon: Icon(Icons.person_outline_rounded),
              ),
            ),
            SizedBox(height: AaliyahFormHeight - 20),
            TextFormField(
              decoration: const InputDecoration(
                label: Text(AaliyahLastName),
                prefixIcon: Icon(Icons.person_outline_rounded),
              ),
            ),
            SizedBox(height: AaliyahFormHeight - 20),
            TextFormField(
              decoration: const InputDecoration(
                label: Text(AaliyahEmail),
                prefixIcon: Icon(Icons.email_outlined),
              ),
            ),

            SizedBox(height: AaliyahFormHeight - 20),
            TextFormField(
              decoration: const InputDecoration(
                label: Text(AaliyahPassword),
                prefixIcon: Icon(Icons.password_outlined),
              ),
            ),
            SizedBox(height: AaliyahFormHeight - 20),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {},
                child: Text(AaliyahSignup.toUpperCase()),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
