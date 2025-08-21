import 'package:docdoc_app/core/style/colors.dart';
import 'package:docdoc_app/features/appointments/logic/appointments_provider.dart';
import 'package:docdoc_app/features/appointments/ui/widgets/appointments_list_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AppointmentsScreen extends StatelessWidget {
  const AppointmentsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AppointmentsProvider()..getAllAppointments(),
      child: Container(
        color: AppColors.text30Color,
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            child: Column(
              spacing: 16,
              children: [
                Text(
                  'My Appointments',
                  style: TextStyle(
                    color: AppColors.text100Color,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                Expanded(child: AppointmentsListView()),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
