import 'package:flutter/material.dart';
import '../../viewmodels/cruise_booking_viewmodel.dart';

class BookingControlsWidget extends StatelessWidget {
  final CruiseBookingViewModel viewModel;

  const BookingControlsWidget({super.key, required this.viewModel});

  Future<void> _pickDate(BuildContext context) async {
    final picked = await showDatePicker(
      context: context,
      initialDate: viewModel.visitDate,
      firstDate: DateTime(2026, 1, 1),
      lastDate: DateTime(2028, 12, 31),
    );
    if (picked != null) viewModel.setVisitDate(picked);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Card(
      margin: const EdgeInsets.all(16),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 8, 16, 4),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Trip Preferences',
                  style: theme.textTheme.titleSmall
                      ?.copyWith(fontWeight: FontWeight.bold),
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.calendar_today),
              title: const Text('Cruise Date'),
              trailing: Text(
                viewModel.formattedDate,
                style: TextStyle(color: theme.colorScheme.primary),
              ),
              onTap: () => _pickDate(context),
            ),
            ListTile(
              leading: const Icon(Icons.directions_boat),
              title: const Text('Cruise Package'),
              trailing: DropdownButton<String>(
                value: viewModel.selectedPackage,
                underline: const SizedBox.shrink(),
                items: viewModel.destination.packages
                    .map((p) => DropdownMenuItem(value: p, child: Text(p)))
                    .toList(),
                onChanged: viewModel.setPackage,
              ),
            ),
            SwitchListTile(
              secondary: const Icon(Icons.dark_mode),
              title: const Text('Dark Mode'),
              value: viewModel.isDarkMode,
              onChanged: viewModel.toggleTheme,
            ),
          ],
        ),
      ),
    );
  }
}