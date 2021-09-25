import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../custom_widgets.dart';

Future<DateTime> openDatePicker({
  required BuildContext context,
  required DateTime initalDate,
  required DateTime startDate,
  required DateTime lastDate,
}) async {
  //Assinging intial date
  DateTime _selectedDate = initalDate;

  //Check Platform and display appropriate widget
  if (Platform.isIOS) {
    await openBottomSheet(
      context: context,
      child: CupertinoDatePicker(
        initialDateTime: _selectedDate,
        mode: CupertinoDatePickerMode.date,
        minimumDate: startDate,
        maximumDate: lastDate,
        onDateTimeChanged: (DateTime newDateTime) {
          _selectedDate = newDateTime;
        },
      ),
    );
  } else {
    _selectedDate = await showDatePicker(
          context: context,
          initialDate: _selectedDate,
          firstDate: startDate,
          lastDate: lastDate,
        ) ??
        _selectedDate;
  }

  return _selectedDate;
}
