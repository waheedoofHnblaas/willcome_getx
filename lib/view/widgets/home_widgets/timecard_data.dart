import 'package:flutter/material.dart';
import 'package:willcome_getx/data/model/timemodel.dart';

class TimeCardData extends StatelessWidget {
  const TimeCardData({Key? key,required this.time}) : super(key: key);

 final TimeModel time ;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Card(
          elevation: 0,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListTile(
              title: Text(time.timesName!),
              subtitle: Text(time.timesTime!,style: const TextStyle(fontSize: 12),),
              trailing:
              Text(time.users_phone!),
            ),
          ),
        ),
        const Divider()
      ],
    );
  }
}
