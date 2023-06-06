import 'dart:async';

import 'package:flutter/material.dart';
import '../configs/screen_size_config.dart';
import 'package:intl/intl.dart';

class DashboardDateContainer extends StatefulWidget {
  final String format;
  final String title;
  const DashboardDateContainer(
      {Key? key, required this.format, required this.title})
      : super(key: key);
  @override
  State<DashboardDateContainer> createState() => _DashboardDateContainerState();
}

class _DashboardDateContainerState extends State<DashboardDateContainer> {
  late DateTime time;
  late Timer timer;
  @override
  void initState() {
    super.initState();
    time = DateTime.now();
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setTime();
    });
  }

  void setTime() {
    setState(() {
      time = DateTime.now();
    });
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

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
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          widget.title == 'Date'
              ? Icon(
                  Icons.calendar_month_outlined,
                  color: ScreenConfig.theme.primaryColor,
                )
              : Icon(
                  Icons.watch_later_outlined,
                  color: ScreenConfig.theme.primaryColor,
                ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.title,
                style: ScreenConfig.theme.textTheme.bodyMedium,
              ),
              Text(
                DateFormat(widget.format).format(time),
                style: ScreenConfig.theme.textTheme.bodyMedium,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
