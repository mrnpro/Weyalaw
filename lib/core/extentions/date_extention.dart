import 'package:intl/intl.dart';

extension DateX on DateTime {
  String formatDate() {
    return DateFormat('MMM dd, yyyy').format(this);
  }

  String timeRemainingInFourMonths() {
    final now = DateTime.now();
    final fourMonthsLater = add(const Duration(days: 120));
    final difference = fourMonthsLater.difference(now);

    final int days = difference.inDays;

    if (days >= 30) {
      final int months = days ~/ 30;
      return '$months month${months > 1 ? 's' : ''}';
    } else {
      return '$days day${days > 1 ? 's' : ''}';
    }
  }
}
