import 'package:flutter/material.dart';
import '../configs/screen_size_config.dart';
import 'package:intl/intl.dart';

class DashboardDataContainer extends StatelessWidget {
  final String text;
  final String title;
  const DashboardDataContainer(
      {Key? key, required this.text, required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: ScreenConfig.screenSizeWidth * 0.4,
      height: ScreenConfig.screenSizeHeight * 0.05,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.blueGrey),
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            Icons.local_gas_station_outlined,
            color: ScreenConfig.theme.primaryColor,
          ),
          const SizedBox(width: 10),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                title,
                style: ScreenConfig.theme.textTheme.bodyMedium,
              ),
              Text(
                text,
                style: ScreenConfig.theme.textTheme.bodyMedium,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
