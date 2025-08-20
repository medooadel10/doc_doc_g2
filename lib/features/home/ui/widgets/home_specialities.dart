import 'package:docdoc_app/core/style/colors.dart';
import 'package:docdoc_app/core/widgets/custom_text_button.dart';
import 'package:docdoc_app/features/home/logic/home_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeSpecialities extends StatelessWidget {
  const HomeSpecialities({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = context.read<HomeProvider>();
    return Consumer<HomeProvider>(
      builder: (context, _, _) {
        return Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(
                    'Doctor Speciality',
                    style: TextStyle(
                      color: AppColors.text100Color,
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                CustomTextButton(onPressed: () {}, text: 'See All'),
              ],
            ),
            SizedBox(
              height: 80,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  final specialaization = provider.specializations[index];
                  return Column(
                    children: [
                      CircleAvatar(
                        backgroundColor: AppColors.primarySurfaceColor,
                        radius: 30,
                        child: Icon(
                          Icons.category,
                          color: AppColors.text100Color,
                        ),
                      ),
                      Text(
                        specialaization.name,
                        style: TextStyle(
                          color: AppColors.text100Color,
                          fontSize: 12,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  );
                },
                separatorBuilder: (context, index) => SizedBox(width: 14),
                itemCount: provider.specializations.length,
              ),
            ),
          ],
        );
      },
    );
  }
}
