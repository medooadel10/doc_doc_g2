import 'package:dio/dio.dart';
import 'package:docdoc_app/core/helpers/local_storage.dart';
import 'package:docdoc_app/core/networking/api_constants.dart';
import 'package:docdoc_app/core/networking/dio_factory.dart';
import 'package:docdoc_app/features/home/ui/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class RegisterProvider extends ChangeNotifier {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final passwordController = TextEditingController();
  final confimrationPasswordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  bool isLoading = false;
  void createAccount(BuildContext context) async {
    if (formKey.currentState!.validate()) {
      isLoading = true;
      notifyListeners();
      try {
        final response = await DioFactory.postData(
          ApiConstants.register,
          data: {
            "name": nameController.text,
            "email": emailController.text,
            "phone": phoneController.text,
            "gender": 0,
            "password": passwordController.text,
            "password_confirmation": confimrationPasswordController.text,
          },
        );
        final token = response.data['data']['token'];
        await LocalStorage.setString('token', token);
        isLoading = false;
        notifyListeners();
        Fluttertoast.showToast(msg: 'You are registered successfully');
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => const HomeScreen()),
          (route) => false,
        );
      } on DioException catch (e) {
        isLoading = false;
        notifyListeners();
        Fluttertoast.showToast(msg: 'You aren\'t registered successfully');
        print(e.response);
      }
    }
  }
}
