import 'package:docdoc_app/core/helpers/local_storage.dart';
import 'package:docdoc_app/core/networking/api_constants.dart';
import 'package:docdoc_app/core/networking/dio_factory.dart';
import 'package:docdoc_app/features/home/ui/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class LoginProvider extends ChangeNotifier {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  bool isLoading = false;
  void login(BuildContext context) async {
    if (formKey.currentState!.validate()) {
      isLoading = true;
      notifyListeners();
      try {
        final response = await DioFactory.postData(
          ApiConstants.login,
          data: {
            'email': emailController.text,
            'password': passwordController.text,
          },
        );
        Fluttertoast.showToast(msg: 'Login successful');
        final token = response.data['data']['token'];
        await LocalStorage.setString('token', token);
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => const HomeScreen()),
          (route) => false,
        );
      } catch (error) {
        Fluttertoast.showToast(msg: 'The credentials are incorrect');
      }
      isLoading = false;
      notifyListeners();
    }
  }
}
