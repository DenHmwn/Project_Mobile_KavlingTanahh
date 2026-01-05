import 'package:flutter/material.dart';
import 'package:project_akhir_mobile/utils/colors.dart';
import 'package:table_calendar/table_calendar.dart';

class CustomCalendar extends StatelessWidget {
  final DateTime focusedDay;
  final DateTime? selectedDay;
  final ValueChanged<DateTime> onDaySelected;
  final DateTime? firstDay;
  final DateTime? lastDay;

  const CustomCalendar({
    super.key,
    required this.focusedDay,
    this.selectedDay,
    required this.onDaySelected,
    this.firstDay,
    this.lastDay,
  });

  @override
  Widget build(BuildContext context) {
    return Container( 
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      padding: const EdgeInsets.all(16),
      child: TableCalendar(
        firstDay: firstDay ?? DateTime(DateTime.now().year - 5),
        lastDay: lastDay ?? DateTime(DateTime.now().year + 5),
        focusedDay: focusedDay,
        selectedDayPredicate: (day) => isSameDay(selectedDay, day),
        onDaySelected: (selectedDay, focusedDay) {
          onDaySelected(selectedDay);
        },
        headerVisible: true,
        headerStyle: HeaderStyle(
          formatButtonVisible: false,
          titleCentered: true,
          titleTextStyle: const TextStyle(
            color: AppColors.darkBlue,
            fontWeight: FontWeight.w600,
            fontSize: 18,
          ),
          leftChevronIcon: Icon(
            Icons.chevron_left,
            color: AppColors.darkBlue,
            size: 28,
          ),
          rightChevronIcon: Icon(
            Icons.chevron_right,
            color: AppColors.darkBlue,
            size: 28,
          ),
          headerPadding: const EdgeInsets.only(bottom: 8),
          decoration: BoxDecoration(
            color: AppColors.lightGrey,
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        daysOfWeekStyle: DaysOfWeekStyle(
          weekdayStyle: TextStyle(
            color: AppColors.darkBlue,
            fontWeight: FontWeight.w600,
          ),
          weekendStyle: TextStyle(
            color: AppColors.red,
            fontWeight: FontWeight.w600,
          ),
        ),
        calendarStyle: CalendarStyle(
          outsideDaysVisible: false,
          defaultTextStyle: TextStyle(color: AppColors.darkBlue),
          weekendTextStyle: TextStyle(color: AppColors.red),
          selectedDecoration: BoxDecoration(
            color: AppColors.darkBlue,
            shape: BoxShape.circle,
          ),
          todayDecoration: BoxDecoration(
            color: AppColors.darkBlue.withOpacity(0.3),
            shape: BoxShape.circle,
          ),
          markerDecoration: BoxDecoration(
            color: AppColors.yellow,
            shape: BoxShape.circle,
          ),
          canMarkersOverflow: true,
        ),
      ),
    );
  }
}
