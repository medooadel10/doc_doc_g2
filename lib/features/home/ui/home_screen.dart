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
        ..getAllDoctors()
        ..getProfile(),
      child: Consumer<HomeProvider>(
        builder: (context, _, _) {
          final provider = context.read<HomeProvider>();
          return Scaffold(
            floatingActionButton: FloatingActionButton(
              onPressed: () {},
              child: Icon(Icons.search, color: Colors.white),
            ),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerDocked,
            bottomNavigationBar: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              onTap: (value) {
                provider.changeIndex(value);
              },
              currentIndex: provider.currentIndex,
              items: [
                BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
                BottomNavigationBarItem(
                  icon: Icon(Icons.message),
                  label: 'Messages',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.calendar_month),
                  label: 'Calendar',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.person),
                  label: 'Profile',
                ),
              ],
            ),
            body: provider.homeScreens[provider.currentIndex],
          );
        },
      ),
    );
  }
}
