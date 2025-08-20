import 'package:cached_network_image/cached_network_image.dart';
import 'package:docdoc_app/core/style/colors.dart';
import 'package:docdoc_app/core/widgets/custom_text_field.dart';
import 'package:docdoc_app/features/home/models/doctors_response_model.dart';
import 'package:flutter/material.dart';

class DoctorsScreen extends StatefulWidget {
  final List<DoctorModel> doctors;
  const DoctorsScreen({Key? key, required this.doctors}) : super(key: key);

  @override
  State<DoctorsScreen> createState() => _DoctorsScreenState();
}

class _DoctorsScreenState extends State<DoctorsScreen> {
  final searchController = TextEditingController();
  List<DoctorModel>? filteredDoctors;

  void searchForDoctors() {
    if (searchController.text.isEmpty) {
      setState(() {
        filteredDoctors = null;
      });
      return;
    }
    setState(() {
      filteredDoctors = widget.doctors
          .where(
            (e) =>
                e.name.toLowerCase().contains(
                  searchController.text.toLowerCase(),
                ) ||
                e.description.toLowerCase().contains(
                  searchController.text.toLowerCase(),
                ) ||
                e.email.toLowerCase().contains(
                  searchController.text.toLowerCase(),
                ) ||
                e.degree.toLowerCase().contains(
                  searchController.text.toLowerCase(),
                ) ||
                e.specialization.name.toLowerCase().contains(
                  searchController.text.toLowerCase(),
                ),
          )
          .toList();
      print(filteredDoctors!.length);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Recommendation Doctor')),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          spacing: 20,
          children: [
            CustomTextField(
              controller: searchController,
              hintText: 'Search for doctors',
              onChange: (value) {
                searchForDoctors();
              },
            ),
            Expanded(
              child: ListView.separated(
                itemBuilder: (context, index) {
                  final doctor = filteredDoctors == null
                      ? widget.doctors[index]
                      : filteredDoctors![index];
                  return Row(
                    spacing: 12,
                    children: [
                      Container(
                        height: 110,
                        width: 110,
                        clipBehavior: Clip.antiAlias,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: CachedNetworkImage(
                          imageUrl:
                              'https://static.vecteezy.com/system/resources/thumbnails/026/375/249/small_2x/ai-generative-portrait-of-confident-male-doctor-in-white-coat-and-stethoscope-standing-with-arms-crossed-and-looking-at-camera-photo.jpg',
                          fit: BoxFit.cover,
                        ),
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          spacing: 6,
                          children: [
                            Text(
                              doctor.name,
                              style: TextStyle(
                                color: AppColors.text100Color,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                            Text(
                              '${doctor.specialization.name} | ${doctor.degree}',
                              style: TextStyle(
                                color: AppColors.bodyColor,
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
                },
                separatorBuilder: (context, index) => SizedBox(height: 16),
                itemCount: filteredDoctors == null
                    ? widget.doctors.length
                    : filteredDoctors!.length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
