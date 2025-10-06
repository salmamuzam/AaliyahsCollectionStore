import 'package:aaliyahs_collection_estore/src/constants/sizes.dart';
import 'package:aaliyahs_collection_estore/src/constants/text_strings.dart';
import 'package:flutter/material.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Container(
        padding: EdgeInsets.symmetric(vertical: AaliyahFormHeight - 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.person_outline_outlined),
                labelText: AaliyahEmail,
                hintText: AaliyahEmail,
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: AaliyahFormHeight),
            TextFormField(
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.password_outlined),
                labelText: AaliyahPassword,
                hintText: AaliyahPassword,
                border: OutlineInputBorder(),
                suffixIcon: IconButton(
                  onPressed: null,
                  icon: Icon(Icons.remove_red_eye_sharp),
                ),
              ),
            ),
            const SizedBox(height: AaliyahFormHeight - 20,),
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {},
                child: Text(AaliyahForgetPassword),
              ),
            ),
            const SizedBox(height: AaliyahFormHeight - 20,),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {},
                child: Text(AaliyahLogin.toUpperCase()),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
