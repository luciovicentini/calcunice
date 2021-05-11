import 'package:calcunice/ui/app_info_widget.dart';
import 'package:calcunice/ui/dark_light_switch_widget.dart';
import 'package:flutter/material.dart';

class CustomTopBarWidget extends StatelessWidget {
  const CustomTopBarWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => SizedBox(
        height: 35,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            DarkLightSwitchWidget(),
            AppInfoButton(),
          ],
        ),
      );
}
