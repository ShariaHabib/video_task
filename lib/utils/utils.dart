import 'package:timeago/timeago.dart' as timeago;
import 'package:intl/intl.dart';

class CustomUtils {
  static String viewersWithDate(String viwers, String date) {
    DateTime dt = DateTime.parse(date);
    String tago = timeago.format(dt).toString();

    return "$viwers views  .  $tago";
  }

  static String addStringSubs(String a, String b) {
    return a + b;
  }

  static String addStringViews(String a, String b) {
    DateTime dt = DateTime.parse(b);
    String formattedDate = DateFormat('MMMM dd, yyyy').format(dt);
    return "$a views  .  $formattedDate";
  }
}
