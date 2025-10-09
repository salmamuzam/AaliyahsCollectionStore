import 'package:aaliyahs_collection_estore/src/constants/image_strings.dart';
import 'package:aaliyahs_collection_estore/src/constants/sizes.dart';
import 'package:aaliyahs_collection_estore/src/constants/text_strings.dart';
import 'package:flutter/material.dart';

class LoginHeaderWidget extends StatelessWidget {
  const LoginHeaderWidget({super.key, required this.size});

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image(
          image: AssetImage(AaliyahWelcomeScreenImage),
          height: size.height * 0.2,
        ),
        const SizedBox(height: AaliyahFormHeight - 20),
        Text(
          AaliyahLoginTitle,
          style: Theme.of(context).textTheme.headlineLarge,
        ),
        const SizedBox(height: AaliyahFormHeight - 20),
        Text(
          AaliyahLoginSubTitle,
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        const SizedBox(height: AaliyahFormHeight - 20),
      ],
    );
  }
}
