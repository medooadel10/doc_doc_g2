import 'package:docdoc_app/features/doctor_details/logic/doctor_details_provider.dart';
import 'package:docdoc_app/features/doctor_details/ui/widgets/doctor_details_body.dart';
import 'package:docdoc_app/features/home/models/doctors_response_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DoctorDetailsScreen extends StatelessWidget {
  final DoctorModel doctorModel;
  const DoctorDetailsScreen({Key? key, required this.doctorModel})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) =>
          DoctorDetailsProvider()..getDoctorDetails(doctorModel.id),
      child: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(title: Text(doctorModel.name)),
          body: DoctorDetailsBody(),
        ),
      ),
    );
  }
}
