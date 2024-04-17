 import 'package:intl/intl.dart';

String formatDate(DateTime date) {
    final formater = DateFormat('MMM dd, yyy');
    return formater.format(date);
  }