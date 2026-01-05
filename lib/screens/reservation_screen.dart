import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import '../models/property.dart';
import '../models/reservation.dart';
import '../utils/colors.dart';
import '../widgets/custom_button.dart';
import 'reservation_detail_screen.dart';

class ReservationScreen extends StatefulWidget {
  final Property property;

  const ReservationScreen({super.key, required this.property});

  @override
  State<ReservationScreen> createState() => _ReservationScreenState();
}

class _ReservationScreenState extends State<ReservationScreen> {
  DateTime _selectedDay = DateTime.now();
  DateTime _focusedDay = DateTime.now();
  String? _selectedTimeSlot;
  String? _selectedLocation;

  final List<String> _locations = ['Kavling 07', 'Kavling 17', 'Kavling 14'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.darkBlue,
      appBar: AppBar(
        backgroundColor: AppColors.darkBlue,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: AppColors.white),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Reservasi',
          style: TextStyle(
            color: AppColors.white,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header
            const Text(
              'Pilih Jadwal Kunjungan Properti',
              style: TextStyle(
                color: AppColors.white,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 20),
            // Calendar
            Container(
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(16),
              ),
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  // Calendar Header
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Juni 2025',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: AppColors.darkBlue,
                        ),
                      ),
                      IconButton(
                        icon: const Icon(Icons.arrow_forward_ios, size: 16),
                        onPressed: () {
                          setState(() {
                            _focusedDay = DateTime(
                              _focusedDay.year,
                              _focusedDay.month + 1,
                            );
                          });
                        },
                      ),
                    ],
                  ),
                  // Calendar
                  TableCalendar<dynamic>(
                    firstDay: DateTime.utc(2020, 1, 1),
                    lastDay: DateTime.utc(2030, 12, 31),
                    focusedDay: _focusedDay,
                    calendarFormat: CalendarFormat.month,
                    selectedDayPredicate: (day) {
                      return isSameDay(_selectedDay, day);
                    },
                    onDaySelected: (selectedDay, focusedDay) {
                      setState(() {
                        _selectedDay = selectedDay;
                        _focusedDay = focusedDay;
                      });
                    },
                    headerVisible: false,
                    daysOfWeekStyle: const DaysOfWeekStyle(
                      weekdayStyle: TextStyle(
                        color: AppColors.darkBlue,
                        fontWeight: FontWeight.w500,
                      ),
                      weekendStyle: TextStyle(
                        color: AppColors.red,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    calendarStyle: CalendarStyle(
                      defaultTextStyle: const TextStyle(
                        color: AppColors.darkBlue,
                      ),
                      weekendTextStyle: const TextStyle(color: AppColors.red),
                      selectedDecoration: const BoxDecoration(
                        color: AppColors.darkBlue,
                        shape: BoxShape.circle,
                      ),
                      todayDecoration: BoxDecoration(
                        color: AppColors.darkBlue.withOpacity(0.5),
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            // Time Slot Selection
            const Text(
              'Jadwal yang Tersedia',
              style: TextStyle(
                color: AppColors.white,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 12),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(12),
              ),
              child: DropdownButton<String>(
                value: _selectedTimeSlot,
                hint: const Text(
                  '--Pilih Waktu--',
                  style: TextStyle(color: AppColors.grey),
                ),
                isExpanded: true,
                underline: const SizedBox(),
                items:
                    widget.property.availableSlots.map((slot) {
                      return DropdownMenuItem<String>(
                        value: slot,
                        child: Padding(
                          padding: const EdgeInsets.all(12),
                          child: Text(slot),
                        ),
                      );
                    }).toList(),
                onChanged: (value) {
                  setState(() {
                    _selectedTimeSlot = value;
                  });
                },
              ),
            ),
            const SizedBox(height: 20),
            // Location Selection
            const Text(
              'Lokasi Reservasi',
              style: TextStyle(
                color: AppColors.white,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 12),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(12),
              ),
              child: DropdownButton<String>(
                value: _selectedLocation,
                hint: const Text(
                  '--Pilih Lokasi--',
                  style: TextStyle(color: AppColors.grey),
                ),
                isExpanded: true,
                underline: const SizedBox(),
                items:
                    _locations.map((location) {
                      return DropdownMenuItem<String>(
                        value: location,
                        child: Padding(
                          padding: const EdgeInsets.all(12),
                          child: Text(location),
                        ),
                      );
                    }).toList(),
                onChanged: (value) {
                  setState(() {
                    _selectedLocation = value;
                  });
                },
              ),
            ),
            const SizedBox(height: 40),
            // Submit Button
            CustomButton(
              text: 'Submit',
              onPressed:
                  _selectedTimeSlot != null && _selectedLocation != null
                      ? () {
                        final reservation = Reservation(
                          id: DateTime.now().millisecondsSinceEpoch.toString(),
                          propertyId: widget.property.id,
                          propertyName: widget.property.name,
                          location: _selectedLocation!,
                          date: _selectedDay,
                          timeSlot: _selectedTimeSlot!,
                          imageAsset: widget.property.imageAsset,
                        );

                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder:
                                (context) => ReservationDetailScreen(
                                  reservation: reservation,
                                ),
                          ),
                        );
                      }
                      : () {},
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: AppColors.darkBlue,
        selectedItemColor: AppColors.yellow,
        unselectedItemColor: AppColors.grey,
        currentIndex: 1,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat_bubble_outline),
            label: '',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.favorite_border), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.person_outline), label: ''),
        ],
      ),
    );
  }
}
