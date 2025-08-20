import 'package:docdoc_app/core/style/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 5,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Hi, Ali!',
                style: TextStyle(
                  color: AppColors.text100Color,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'How Are you Today?',
                style: TextStyle(color: AppColors.text80Color, fontSize: 12),
              ),
            ],
          ),
        ),
        SvgPicture.asset('assets/svgs/notifications.svg'),
      ],
    );
  }
}
