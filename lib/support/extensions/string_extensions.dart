import 'package:intl/intl.dart';

extension StringExtensions on String? {
  String formatedDate(String dateTimeString) {
    final dateTime = DateTime.parse(dateTimeString);
    var outputDateFormat = DateFormat('dd MMMM');
    var outputDate = outputDateFormat.format(dateTime);

    return outputDate;
  }
}
