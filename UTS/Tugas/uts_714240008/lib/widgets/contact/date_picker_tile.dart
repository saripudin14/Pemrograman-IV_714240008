import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

/// Komponen pemilih tanggal dengan TextFormField readOnly & DatePicker dialog (Ref P7)
class DatePickerTile extends StatelessWidget {
  final TextEditingController controller;
  final DateTime? selectedDate;
  final ValueChanged<DateTime> onDateSelected;

  const DatePickerTile({
    super.key,
    required this.controller,
    required this.selectedDate,
    required this.onDateSelected,
  });

  Future<void> _pickDate(BuildContext context) async {
    final now = DateTime.now();
    final picked = await showDatePicker(
      context: context,
      initialDate: selectedDate ?? now,
      firstDate: DateTime(1970),
      lastDate: DateTime(now.year + 20),
    );
    if (picked != null) {
      controller.text = DateFormat('dd-MM-yyyy').format(picked);
      onDateSelected(picked);
    }
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      readOnly: true,
      onTap: () => _pickDate(context),
      decoration: InputDecoration(
        labelText: 'Tanggal *',
        hintText: 'Pilih tanggal (dd-MM-yyyy)',
        prefixIcon: const Icon(Icons.calendar_month_outlined),
        suffixIcon: IconButton(
          icon: const Icon(Icons.date_range),
          onPressed: () => _pickDate(context),
        ),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
        filled: true,
        fillColor: Colors.grey.shade50,
      ),
      validator: (val) => (selectedDate == null || val == null || val.isEmpty) ? 'Tanggal wajib dipilih' : null,
    );
  }
}
