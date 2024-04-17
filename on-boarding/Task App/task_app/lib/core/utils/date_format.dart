 import 'package:intl/intl.dart';

String formatDate(DateTime date) {
    final formater = DateFormat('MMM dd, yyyy');
    return formater.format(date);
  }