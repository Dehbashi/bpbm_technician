import 'package:intl/intl.dart';
import 'package:shamsi_date/shamsi_date.dart';
import 'package:persian/persian.dart';

const iranOffset = Duration(hours: 3, minutes: 30);

extension IranDateTime on DateTime {
  DateTime toIranDateTime() => add(iranOffset);
}

String gregorianToShamsi(String date) {
  if (date != '') {
    final dateTime = DateTime.parse(date).toIranDateTime();
    final jalaliDate = Jalali.fromDateTime(dateTime);
    final hour = jalaliDate.hour.toString().withPersianNumbers();
    final minute = jalaliDate.minute.toString().withPersianNumbers();
    final f = jalaliDate.formatter;

    final String time =
        '${f.wN.withPersianNumbers()} ${f.d.withPersianNumbers()} ${f.mN.withPersianNumbers()} ${f.yyyy.withPersianNumbers()} ساعت $hour و $minute دقیقه';

    return time;
  } else {
    return '';
  }
}

String gregorianToShamsiDateOnly(String date) {
  if (date != '') {
    final dateTime = DateTime.parse(date).toIranDateTime();
    final jalaliDate = Jalali.fromDateTime(dateTime);
    final f = jalaliDate.formatter;
    final String dateOnly =
        '${f.wN.withPersianNumbers()} ${f.d.withPersianNumbers()} ${f.mN.withPersianNumbers()} ${f.yyyy.withPersianNumbers()}';
    return dateOnly;
  } else {
    return '';
  }
}

String gregorianToShamsiDateOnlyWithSlash(String date) {
  if (date != '') {
    final dateTime = DateTime.parse(date).toIranDateTime();
    final now = DateTime.now().toIranDateTime();
    final jalaliDate = Jalali.fromDateTime(dateTime);
    final f = jalaliDate.formatter;
    final String dateOnly =
        '${f.yyyy.withPersianNumbers()}/${f.m.padLeft(2, '0').withPersianNumbers()}/${f.d.padLeft(2, '0').withPersianNumbers()}';
    if (dateTime.year == now.year &&
        dateTime.month == now.month &&
        dateTime.day == now.day) {
      return 'امروز';
    } else {
      return dateOnly;
    }
  } else {
    return '';
  }
}

String gregorianToShamsiTimeOnly(String date) {
  if (date != '') {
    final dateTime = DateTime.parse(date).toIranDateTime();
    final jalaliDate = Jalali.fromDateTime(dateTime);
    final hour = jalaliDate.hour.toString().withPersianNumbers();
    final minute = jalaliDate.minute.toString().withPersianNumbers();
    final f = jalaliDate.formatter;

    final String timeOnly = 'ساعت $hour و $minute دقیقه';

    return timeOnly;
  } else {
    return '';
  }
}

String gregorianToShamsiTimeOnlyWithoutText(String date) {
  if (date != '') {
    final dateTime = DateTime.parse(date)
        .toIranDateTime(); // Parse the ISO 8601 formatted date string
    final jalaliDate = Jalali.fromDateTime(dateTime);
    final hour =
        jalaliDate.hour.toString().padLeft(2, '0').withPersianNumbers();
    final minute =
        jalaliDate.minute.toString().padLeft(2, '0').withPersianNumbers();

    final String timeOnly = '$hour:$minute';

    return timeOnly;
  } else {
    return '';
  }
}
