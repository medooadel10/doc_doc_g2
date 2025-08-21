import 'package:docdoc_app/core/helpers/local_storage.dart';
import 'package:docdoc_app/core/networking/api_constants.dart';
import 'package:docdoc_app/core/networking/dio_factory.dart';
import 'package:docdoc_app/features/doctor_details/models/doctor_details_response_model.dart';
import 'package:docdoc_app/features/doctor_details/ui/widgets/doctor_details_about.dart';
import 'package:docdoc_app/features/doctor_details/ui/widgets/doctor_details_location.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class DoctorDetailsProvider extends ChangeNotifier {
  DoctorDetailModel? doctor;

  void getDoctorDetails(int id) async {
    doctor = null;
    notifyListeners();
    final token = LocalStorage.getString('token');
    final response = await DioFactory.getData(
      '${ApiConstants.doctorDetails}/$id',
      token: token,
    );
    final data = DoctorDetailsResponseModel.fromJson(response.data);
    doctor = data.doctor;
    notifyListeners();
  }

  final startTimeController = TextEditingController();
  final notesController = TextEditingController();

  void storeAppointment(BuildContext context) async {
    if (startTimeController.text.isEmpty) {
      Fluttertoast.showToast(msg: 'Please enter a start time');
      return;
    }
    await DioFactory.postData(
      ApiConstants.storeAppointment,
      data: {
        'doctor_id': doctor?.id,
        'start_time': startTimeController.text,
        'notes': notesController.text,
      },
      token: LocalStorage.getString('token'),
    );
    Fluttertoast.showToast(msg: 'Appointment stored successfully');
    Navigator.pop(context);
  }

  int currentIndex = 0;
  final List<Widget> doctorDetailsScreens = [
    DoctorDetailsAbout(),
    DoctorDetailsLocation(),
  ];
  void changeIndex(int index) {
    currentIndex = index;
    notifyListeners();
  }
}
