import 'package:docdoc_app/core/helpers/local_storage.dart';
import 'package:docdoc_app/core/networking/api_constants.dart';
import 'package:docdoc_app/core/networking/dio_factory.dart';
import 'package:docdoc_app/features/home/models/doctors_response_model.dart';
import 'package:docdoc_app/features/home/models/specializations_response_model.dart';
import 'package:docdoc_app/features/home/models/user_response_model.dart';
import 'package:flutter/material.dart';

class HomeProvider extends ChangeNotifier {
  List<Specialization> specializations = [];
  void getAllSpecializations() async {
    final token = LocalStorage.getString('token');
    final response = await DioFactory.getData(
      ApiConstants.getAllSpecializations,
      token: token,
    );
    final data = SpecializationsResponseModel.fromJson(response.data);
    specializations = data.specializations;
    notifyListeners();
  }

  List<DoctorModel> doctors = [];
  void getAllDoctors() async {
    final token = LocalStorage.getString('token');
    final response = await DioFactory.getData(
      ApiConstants.getAllDoctors,
      token: token,
    );
    final data = DoctorsResponseModel.fromJson(response.data);
    doctors = data.doctors;
    notifyListeners();
  }

  UserModel? user;
  void getProfile() async {
    final token = LocalStorage.getString('token');
    final response = await DioFactory.getData(
      ApiConstants.getProfile,
      token: token,
    );
    final data = UserResponseModel.fromJson(response.data);
    user = data.user;
    notifyListeners();
  }
}
