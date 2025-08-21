import 'package:docdoc_app/core/helpers/local_storage.dart';
import 'package:docdoc_app/core/networking/api_constants.dart';
import 'package:docdoc_app/core/networking/dio_factory.dart';
import 'package:docdoc_app/features/appointments/models/appointments_response_model.dart';
import 'package:flutter/material.dart';

class AppointmentsProvider extends ChangeNotifier {
  List<AppointmentModel> appointments = [];

  void getAllAppointments() async {
    final response = await DioFactory.getData(
      ApiConstants.getAllAppointments,
      token: LocalStorage.getString('token'),
    );
    final data = AppointmentsResponseModel.fromJson(response.data);
    appointments = data.appointments;
    notifyListeners();
  }
}
