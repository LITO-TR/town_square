import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:town_square/config/theme/custom_colors.dart';

class CustomCalendarWidget extends StatelessWidget {
  const CustomCalendarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return TableCalendar(
      rowHeight: 33,
      daysOfWeekStyle: DaysOfWeekStyle(
        weekdayStyle: const TextStyle(color: Colors.white, fontSize: 10),
        weekendStyle: const TextStyle(
          color: Colors.white,
          fontSize: 10,
        ),
        dowTextFormatter: (date, locale) =>
            DateFormat.E(locale).format(date).substring(0, 1),
      ),
      calendarStyle: CalendarStyle(
        outsideTextStyle:
            TextStyle(color: CustomColors.neutral[600], fontSize: 12),
        defaultTextStyle: const TextStyle(color: Colors.white, fontSize: 12),
        weekendTextStyle: const TextStyle(color: Colors.white, fontSize: 12),
        todayTextStyle:
            const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        todayDecoration: BoxDecoration(
          color: CustomColors.primary[300],
          shape: BoxShape.circle,
        ),
        selectedTextStyle: const TextStyle(color: Colors.white),
        selectedDecoration: const BoxDecoration(
          color: Colors.blue,
          shape: BoxShape.circle,
        ),
      ),
      focusedDay: DateTime.now(),
      firstDay: DateTime(2010, 10, 16),
      lastDay: DateTime(2030, 10, 16),
      headerStyle: HeaderStyle(
        formatButtonTextStyle: const TextStyle(color: Colors.yellow),
        titleTextStyle: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w700,
            color: CustomColors.neutral),
        formatButtonVisible: false,
        titleCentered: true,
        titleTextFormatter: (date, locale) =>
            DateFormat.MMMM(locale).format(date),
      ),
      calendarBuilders: CalendarBuilders(
        todayBuilder: (context, date, _) {
          return Center(
            child: Container(
              decoration: BoxDecoration(
                  color: CustomColors.primary[400],
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(67)),
              width: 35,
              height: 35,
              child: Center(
                child: Text(
                  '${date.day}',
                  style: const TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
