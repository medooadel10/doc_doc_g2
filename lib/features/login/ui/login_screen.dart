import 'package:docdoc_app/core/style/colors.dart';
import 'package:docdoc_app/core/widgets/custom_button.dart';
import 'package:docdoc_app/core/widgets/custom_text_button.dart';
import 'package:docdoc_app/core/widgets/custom_text_field.dart';
import 'package:docdoc_app/features/login/logic/login_provider.dart';
import 'package:docdoc_app/features/register/ui/register_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => LoginProvider(),
      builder: (context, _) {
        final provider = context.read<LoginProvider>();
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
                              'Welcome Back',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Theme.of(context).colorScheme.primary,
                                fontSize: 24,
                              ),
                            ),
                            Text(
                              "We're excited to have you back, can't wait to see what you've been up to since you last logged in.",
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
                            ],
                          ),
                        ),
                        Consumer<LoginProvider>(
                          builder: (context, _, _) {
                            if (provider.isLoading) {
                              return Center(child: CircularProgressIndicator());
                            }
                            return CustomButton(
                              onPressed: () {
                                provider.login(context);
                              },
                              text: 'Login',
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
                      'Aren\'t you have an account ?',
                      style: TextStyle(color: Colors.black, fontSize: 14),
                    ),
                    CustomTextButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => RegisterScreen(),
                          ),
                        );
                      },
                      text: 'Sign Up',
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
