import 'package:docdoc_app/core/style/colors.dart';
import 'package:docdoc_app/features/doctor_details/logic/doctor_details_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DoctorDetailsAbout extends StatelessWidget {
  const DoctorDetailsAbout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = context.read<DoctorDetailsProvider>();
    final doctor = provider.doctor!;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 5,
      children: [
        Text(
          'About Me',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: AppColors.text100Color,
          ),
        ),
        Text(
          doctor.description,
          style: TextStyle(fontSize: 14, color: AppColors.bodyColor),
        ),
        SizedBox(height: 10),
        Text(
          'Email',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: AppColors.text100Color,
          ),
        ),
        Text(
          doctor.email,
          style: TextStyle(fontSize: 14, color: AppColors.bodyColor),
        ),
        SizedBox(height: 10),
        Text(
          'Phone Number',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: AppColors.text100Color,
          ),
        ),
        Text(
          doctor.phone,
          style: TextStyle(fontSize: 14, color: AppColors.bodyColor),
        ),
        SizedBox(height: 10),
        Text(
          'Working Time',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: AppColors.text100Color,
          ),
        ),
        Text(
          '${doctor.startTime} - ${doctor.endTime}',
          style: TextStyle(fontSize: 14, color: AppColors.bodyColor),
        ),
        SizedBox(height: 10),
        Text(
          'Appoint Price',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: AppColors.text100Color,
          ),
        ),
        Text(
          '${doctor.appointPrice} EGP',
          style: TextStyle(fontSize: 14, color: AppColors.bodyColor),
        ),
      ],
    );
  }
}
