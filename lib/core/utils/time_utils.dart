import 'package:easy_localization/easy_localization.dart';
import '../extension/string_extension.dart';

class TimeUtils {

    static String substractHour(String timeStamp) {
    var dateHour = timeStamp.split(" ");
    return dateHour[1].substring(0, 5);
  }

  static String getDayOfTheWeek(DateTime date) {
    var day = DateFormat('EEEE').format(date);
    return day.tr().capitalize();
  }
}