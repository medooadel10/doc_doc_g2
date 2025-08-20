import 'package:docdoc_app/core/style/colors.dart';
import 'package:docdoc_app/features/home/logic/home_provider.dart';
import 'package:docdoc_app/features/home/ui/widgets/home_banner.dart';
import 'package:docdoc_app/features/home/ui/widgets/home_doctors.dart';
import 'package:docdoc_app/features/home/ui/widgets/home_header.dart';
import 'package:docdoc_app/features/home/ui/widgets/home_specialities.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => HomeProvider()
        ..getAllSpecializations()
        ..getAllDoctors(),
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
            child: Column(
              spacing: 16,
              children: [
                HomeHeader(),
                HomeBanner(),
                HomeSpecialities(),
                Expanded(child: HomeDoctors()),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
