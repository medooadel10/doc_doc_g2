import 'package:docdoc_app/core/style/colors.dart';
import 'package:docdoc_app/features/doctor_details/logic/doctor_details_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DoctorDetailsLocation extends StatelessWidget {
  const DoctorDetailsLocation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = context.read<DoctorDetailsProvider>();
    final doctor = provider.doctor!;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 5,
      children: [
        Text(
          'Address',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: AppColors.text100Color,
          ),
        ),
        Text(
          doctor.address,
          style: TextStyle(fontSize: 14, color: AppColors.bodyColor),
        ),
        SizedBox(height: 10),
        Text(
          'City',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: AppColors.text100Color,
          ),
        ),
        Text(
          doctor.city.name,
          style: TextStyle(fontSize: 14, color: AppColors.bodyColor),
        ),
        SizedBox(height: 10),
        Text(
          'Governorate',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: AppColors.text100Color,
          ),
        ),
        Text(
          doctor.city.governrate.name,
          style: TextStyle(fontSize: 14, color: AppColors.bodyColor),
        ),
      ],
    );
  }
}
