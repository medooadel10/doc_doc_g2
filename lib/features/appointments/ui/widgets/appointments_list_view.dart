import 'package:cached_network_image/cached_network_image.dart';
import 'package:docdoc_app/core/style/colors.dart';
import 'package:docdoc_app/features/appointments/logic/appointments_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AppointmentsListView extends StatelessWidget {
  const AppointmentsListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<AppointmentsProvider>(
      builder: (context, provider, _) {
        return ListView.separated(
          itemBuilder: (context, index) => Container(
            padding: EdgeInsets.symmetric(vertical: 14, horizontal: 16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 10,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      provider.appointments[index].status,
                      style: TextStyle(
                        color: const Color.fromARGB(255, 186, 168, 80),
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      provider.appointments[index].appointmentTime,
                      style: TextStyle(
                        color: AppColors.text80Color,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                Divider(color: AppColors.text30Color),
                Row(
                  spacing: 10,
                  children: [
                    Container(
                      clipBehavior: Clip.antiAlias,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: CachedNetworkImage(
                        width: 80,
                        height: 80,
                        imageUrl:
                            'https://static.vecteezy.com/system/resources/thumbnails/026/375/249/small_2x/ai-generative-portrait-of-confident-male-doctor-in-white-coat-and-stethoscope-standing-with-arms-crossed-and-looking-at-camera-photo.jpg',
                        fit: BoxFit.cover,
                      ),
                    ),
                    Column(
                      spacing: 5,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          provider.appointments[index].doctor.name,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: AppColors.text100Color,
                          ),
                        ),
                        Text(
                          '${provider.appointments[index].doctor.specialization.name} | ${provider.appointments[index].doctor.degree}',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: AppColors.text80Color,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
          separatorBuilder: (context, index) => SizedBox(height: 14),
          itemCount: provider.appointments.length,
        );
      },
    );
  }
}
