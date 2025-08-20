import 'package:docdoc_app/core/style/colors.dart';
import 'package:docdoc_app/core/widgets/custom_button.dart';
import 'package:docdoc_app/core/widgets/custom_text_button.dart';
import 'package:docdoc_app/core/widgets/custom_text_field.dart';
import 'package:docdoc_app/features/login/ui/login_screen.dart';
import 'package:docdoc_app/features/register/logic/register_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => RegisterProvider(),
      builder: (context, _) {
        final provider = context.read<RegisterProvider>();
        return Scaffold(
          body: SafeArea(
            child: Column(
              spacing: 14,
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                    child: Column(
                      spacing: 20,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          spacing: 10,
                          children: [
                            Text(
                              'Create Account',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Theme.of(context).colorScheme.primary,
                                fontSize: 24,
                              ),
                            ),
                            Text(
                              "Sign up now and start exploring all that our app has to offer. We're excited to welcome you to our community!",
                              style: TextStyle(
                                fontSize: 14,
                                color: AppColors.bodyColor,
                              ),
                            ),
                          ],
                        ),
                        Form(
                          key: provider.formKey,
                          child: Column(
                            spacing: 14,
                            children: [
                              CustomTextField(
                                controller: provider.nameController,
                                hintText: 'Name',
                                keyboardType: TextInputType.name,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter your name';
                                  }
                                  return null;
                                },
                              ),
                              CustomTextField(
                                controller: provider.emailController,
                                hintText: 'Email',
                                keyboardType: TextInputType.emailAddress,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter your email';
                                  }
                                  return null;
                                },
                              ),
                              CustomTextField(
                                controller: provider.phoneController,
                                hintText: 'Phone',
                                keyboardType: TextInputType.phone,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter your phone';
                                  }
                                  return null;
                                },
                              ),
                              CustomTextField(
                                controller: provider.passwordController,
                                hintText: 'Password',
                                keyboardType: TextInputType.visiblePassword,
                                obscureText: true,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter your password';
                                  }
                                  return null;
                                },
                              ),
                              CustomTextField(
                                controller:
                                    provider.confimrationPasswordController,
                                hintText: 'Confirm Password',
                                keyboardType: TextInputType.visiblePassword,
                                obscureText: true,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please retype the password';
                                  } else if (value !=
                                      provider.passwordController.text) {
                                    return 'Passwords dont match';
                                  }
                                  return null;
                                },
                              ),
                            ],
                          ),
                        ),
                        Consumer<RegisterProvider>(
                          builder: (context, _, _) {
                            if (provider.isLoading) {
                              return Center(child: CircularProgressIndicator());
                            }
                            return CustomButton(
                              onPressed: () {
                                provider.createAccount(context);
                              },
                              text: 'Create Account',
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
                Row(
                  spacing: 2,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Already have an account yet?',
                      style: TextStyle(color: Colors.black, fontSize: 14),
                    ),
                    CustomTextButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => LoginScreen(),
                          ),
                        );
                      },
                      text: 'Sign In',
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
