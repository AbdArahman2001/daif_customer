import 'package:daif_customer/data/model/response/booking_time_model.dart';
import 'package:daif_customer/view/screens/booking/widget/booking_calendar_widget.dart';
import 'package:get/get.dart';

class BookingController extends GetxController {
  BookingController() {
    _bookingStepIndex = 0;
    _selectedMonth = Month.values[DateTime.now().month - 1];
    _selectedYear = DateTime.now().year;
    _selectedPeriod = "a";
    getBookedDaysAtMonth();
  }
  late int _bookingStepIndex;
  int get bookingStepIndex => _bookingStepIndex;
  late Month _selectedMonth;
  Month get selectedMonth => _selectedMonth;
  late int _selectedYear;
  int get selectedYear => _selectedYear;
  late String _selectedPeriod;
  String get selectedPeriod =>_selectedPeriod;
  // ["12-2-2023-a","13-4-2023-p",.....]
  List<String> allSelectedDays = [];
  // [1,4,22,30,.....]
  List<int> selectedDaysAtSelectedMonth = [];

 void getSelectedDaysAtSelectedMonth(){
   selectedDaysAtSelectedMonth =[];
   for (final element in allSelectedDays) {
     final info = element.split("-");
     if (info[1] == (selectedMonth.index + 1).toString() &&
         info[2] == selectedYear.toString() &&
         info[3] == _selectedPeriod.toString()) {
       selectedDaysAtSelectedMonth.add(int.parse(info[0]));
     }
   }
 }

 void changeDayStatus(String day) {
    final String input = "$day-${selectedMonth.index+1}-$selectedYear-$_selectedPeriod";
    final String? result = allSelectedDays.firstWhereOrNull((element) =>element == input);
    if(result == null){
      allSelectedDays.add(input);
    }else{
      allSelectedDays.remove(input);
    }
    getSelectedDaysAtSelectedMonth();
    update();
  }

  void selectCalendarMonth(Month? month) {
    if (month == null) return;
    _selectedMonth = month;
    getBookedDaysAtMonth();
    getSelectedDaysAtSelectedMonth();
    update();
  }

  void selectYear(int? year) {
    if (year == null) return;
    _selectedYear = year;
    getBookedDaysAtMonth();
    getSelectedDaysAtSelectedMonth();
    update();
  }

  List<String> bookedDaysAtMonth = [];

  void getBookedDaysAtMonth() {
    bookedDaysAtMonth = [];
    for (final element in dummyBookings) {
      final info = element.split("-");
      if (info[1] == (selectedMonth.index + 1).toString() &&
          info[2] == selectedYear.toString() &&
          info[3] == _selectedPeriod.toString()) {
        bookedDaysAtMonth.add(info[0]);
      }
    }
  }

  final List<String> dummyBookings = [
    "12-2-2023-a",
    "13-2-2023-a",
    "13-2-2023-p",
    "18-2-2023-p",
    "20-3-2023-a",
    "1-2-2023-a",
    "5-2-2023-p",
    "25-2-2023-a",
    "29-2-2023-a",
    "3-3-2023-a",
    "12-3-2023-p",
  ];

  deleteBookingTime(String strInfo){
    allSelectedDays.remove(strInfo);
    update();
  }
 void changeBookingStepIndex(int index){
    if(index>1||index<0) return;
    _bookingStepIndex = index;
    update();
  }

  void changeSelectedPeriod(String period){
    _selectedPeriod = period;
    update();
  }
}
