import 'package:aaliyahs_collection_estore/bottom_nav.dart';
import 'package:aaliyahs_collection_estore/src/constants/colors.dart';
import 'package:aaliyahs_collection_estore/src/constants/image_strings.dart';
import 'package:aaliyahs_collection_estore/src/constants/sizes.dart';
import 'package:aaliyahs_collection_estore/src/constants/text_strings.dart';
import 'package:aaliyahs_collection_estore/src/features/authentication/screens/login/login_screen.dart';
import 'package:aaliyahs_collection_estore/src/features/authentication/screens/signup/signup_screen.dart';
import 'package:aaliyahs_collection_estore/utils/validators/validator.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool _isPasswordVisible = false;

  @override
  void initState() {
    super.initState();

    // sample data
    _firstNameController.text = AaliyahProfileFname;
    _lastNameController.text = AaliyahProfileLname;
    _emailController.text = AaliyahProfileEmail;
    _passwordController.text = AaliyahProfilePassword;
  }

  @override
  Widget build(BuildContext context) {
    var brightness = MediaQuery.of(context).platformBrightness;
    final isDarkMode = brightness == Brightness.dark;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const BottomNavBar()),
          ),
          icon: const Icon(Icons.arrow_back),
        ),
        title: Text(
          AaliyahProfileText,
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(AaliyahDefaultSize),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Profile image
              Stack(
                children: [
                  SizedBox(
                    width: 120,
                    height: 120,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: const Image(
                        image: AssetImage(AaliyahProfileImage),
                        fit: BoxFit.cover,
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

              // Profile Form
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: _firstNameController,
                      decoration: const InputDecoration(
                        label: Text(AaliyahFirstName),
                        prefixIcon: Icon(Icons.person_2_outlined),
                      ),
                      validator: AaliyahValidator.validateFirstName,
                    ),
                    const SizedBox(height: AaliyahFormHeight - 20),

                    TextFormField(
                      controller: _lastNameController,
                      decoration: const InputDecoration(
                        label: Text(AaliyahLastName),
                        prefixIcon: Icon(Icons.person_2_outlined),
                      ),
                      validator: AaliyahValidator.validateLastName,
                    ),
                    const SizedBox(height: AaliyahFormHeight - 20),

                    TextFormField(
                      controller: _emailController,
                      decoration: const InputDecoration(
                        label: Text(AaliyahEmail),
                        prefixIcon: Icon(Icons.email_outlined),
                      ),
                      validator: AaliyahValidator.validateEmail,
                    ),
                    const SizedBox(height: AaliyahFormHeight - 20),

                    // Password field with toggle
                    TextFormField(
                      controller: _passwordController,
                      obscureText: !_isPasswordVisible,
                      decoration: InputDecoration(
                        label: const Text(AaliyahPassword),
                        prefixIcon: const Icon(Icons.password_outlined),
                        suffixIcon: IconButton(
                          icon: Icon(
                            _isPasswordVisible
                                ? Icons.visibility
                                : Icons.visibility_off,
                            color: isDarkMode
                                ? AaliyahSecondaryColor
                                : AaliyahPrimaryColor,
                            size: 20,
                          ),
                          onPressed: () {
                            setState(() {
                              _isPasswordVisible = !_isPasswordVisible;
                            });
                          },
                        ),
                      ),
                      validator: AaliyahValidator.validatePassword,
                    ),
                    const SizedBox(height: AaliyahFormHeight),

                    // Edit Profile Button
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            final snackBar = SnackBar(
                              content: Text(
                                "Successfully updated!",
                                style: Theme.of(context).textTheme.bodyLarge
                                    ?.copyWith(
                                      color: isDarkMode
                                          ? AaliyahPrimaryColor
                                          : AaliyahLightColor,
                                      fontWeight: FontWeight.bold,
                                    ),
                              ),
                              duration: const Duration(seconds: 1),
                            );
                            ScaffoldMessenger.of(
                              context,
                            ).showSnackBar(snackBar);
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: isDarkMode
                              ? AaliyahSecondaryColor
                              : AaliyahPrimaryColor,
                          side: BorderSide.none,
                        ),
                        child: Text(
                          AaliyahEditProfileText.toUpperCase(),
                          style: TextStyle(
                            color: isDarkMode
                                ? AaliyahPrimaryColor
                                : AaliyahSecondaryColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: AaliyahFormHeight),

                    // Delete & Sign Out buttons
                    Row(
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(right: 8.0),
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const SignupScreen(),
                                  ),
                                );
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.red.shade900,
                                elevation: 0,
                              ),
                              child: Text(
                                AaliyahDelete.toUpperCase(),
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: AaliyahLightColor,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const LoginScreen(),
                                  ),
                                );
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: isDarkMode
                                    ? AaliyahSecondaryColor
                                    : AaliyahPrimaryColor,
                                elevation: 0,
                              ),
                              child: Text(
                                AaliyahSignOut.toUpperCase(),
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: isDarkMode
                                      ? AaliyahPrimaryColor
                                      : AaliyahSecondaryColor,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: AaliyahFormHeight),
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
