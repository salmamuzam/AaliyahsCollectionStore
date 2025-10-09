import 'package:aaliyahs_collection_estore/src/constants/colors.dart';
import 'package:aaliyahs_collection_estore/src/constants/image_strings.dart';
import 'package:aaliyahs_collection_estore/src/constants/sizes.dart';
import 'package:aaliyahs_collection_estore/src/constants/text_strings.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    var brightness = mediaQuery.platformBrightness;

    final isDarkMode = brightness == Brightness.dark;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.arrow_back),
        ),
        title: Text(
          AaliyahProfileText,
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(AaliyahDefaultSize),
          child: Column(
            children: [
              Stack(
                children: [
                  SizedBox(
                    width: 120,
                    height: 120,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: const Image(
                        image: AssetImage(AaliyahProfileImage),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container(
                      width: 35,
                      height: 35,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: isDarkMode
                            ? AaliyahSecondaryColor
                            : AaliyahPrimaryColor,
                      ),
                      child: Icon(
                        Icons.camera_alt,
                        color: isDarkMode
                            ? AaliyahPrimaryColor
                            : AaliyahSecondaryColor,
                        size: 20,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 50),
              Form(
                child: Column(
                  children: [
                    TextFormField(
                      decoration: const InputDecoration(
                        label: Text(AaliyahFirstName),
                        prefixIcon: Icon(Icons.person_2_outlined),
                      ),
                    ),
                    const SizedBox(height: AaliyahFormHeight - 20),
                    TextFormField(
                      decoration: const InputDecoration(
                        label: Text(AaliyahLastName),
                        prefixIcon: Icon(Icons.person_2_outlined),
                      ),
                    ),
                    const SizedBox(height: AaliyahFormHeight - 20),
                    TextFormField(
                      decoration: const InputDecoration(
                        label: Text(AaliyahEmail),
                        prefixIcon: Icon(Icons.email_outlined),
                      ),
                    ),
                    const SizedBox(height: AaliyahFormHeight - 20),
                    TextFormField(
                      decoration: const InputDecoration(
                        label: Text(AaliyahPassword),
                        prefixIcon: Icon(Icons.password_outlined),
                      ),
                    ),
                    const SizedBox(height: AaliyahFormHeight),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: isDarkMode
                              ? AaliyahSecondaryColor
                              : AaliyahPrimaryColor,
                          side: BorderSide.none,
                          shape: const StadiumBorder(),
                        ),

                        child: Text(
                          AaliyahEditProfileText,
                          style: TextStyle(
                            color: isDarkMode
                                ? AaliyahPrimaryColor
                                : AaliyahSecondaryColor,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: AaliyahFormHeight),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,

                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.4,
                          child: ElevatedButton(
                            onPressed: () {},

                            style: ElevatedButton.styleFrom(
                              backgroundColor: isDarkMode
                                  ? AaliyahSecondaryColor
                                  : AaliyahPrimaryColor,
                              elevation: 0,

                              foregroundColor: isDarkMode
                                  ? Colors.red
                                  : Colors.red.shade300,
                              shape: const StadiumBorder(),
                              side: BorderSide.none,
                            ),
                            child: const Text(AaliyahDelete),
                          ),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.4,
                          child: ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              backgroundColor: isDarkMode
                                  ? AaliyahSecondaryColor
                                  : AaliyahPrimaryColor,
                              elevation: 0,
                              foregroundColor: isDarkMode
                                  ? Colors.red
                                  : Colors.red.shade300,
                              shape: const StadiumBorder(),
                              side: BorderSide.none,
                            ),
                            child: const Text(AaliyahSignOut),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
