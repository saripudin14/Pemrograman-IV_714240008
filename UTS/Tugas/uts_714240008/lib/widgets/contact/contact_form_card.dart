import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../models/contact.dart';
import '../../utils/contact_validator.dart';
import 'color_picker_tile.dart';
import 'date_picker_tile.dart';
import 'file_picker_tile.dart';

/// Formulir Input & Edit Kontak dengan validasi dan interactive pickers (Ref P6 & P7)
class ContactFormCard extends StatefulWidget {
  final Contact? contactToEdit;
  final Function(String name, String phone, DateTime date, Color color, String filePath, String fileName) onSave;
  final VoidCallback onCancelEdit;

  const ContactFormCard({
    super.key,
    required this.contactToEdit,
    required this.onSave,
    required this.onCancelEdit,
  });

  @override
  State<ContactFormCard> createState() => _ContactFormCardState();
}

class _ContactFormCardState extends State<ContactFormCard> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _dateController = TextEditingController();

  DateTime? _selectedDate;
  Color _selectedColor = Colors.teal;
  String? _selectedFilePath;
  String? _selectedFileName;

  @override
  void initState() {
    super.initState();
    _syncWithContact(widget.contactToEdit);
  }

  @override
  void didUpdateWidget(covariant ContactFormCard oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.contactToEdit != widget.contactToEdit) {
      _syncWithContact(widget.contactToEdit);
    }
  }

  void _syncWithContact(Contact? contact) {
    if (contact != null) {
      _nameController.text = contact.name;
      _phoneController.text = contact.phone;
      _selectedDate = contact.date;
      _dateController.text = DateFormat('dd-MM-yyyy').format(contact.date);
      _selectedColor = contact.color;
      _selectedFilePath = contact.filePath;
      _selectedFileName = contact.fileName;
    } else {
      _nameController.clear();
      _phoneController.clear();
      _dateController.clear();
      _selectedDate = null;
      _selectedColor = Colors.teal;
      _selectedFilePath = null;
      _selectedFileName = null;
      _formKey.currentState?.reset();
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    _phoneController.dispose();
    _dateController.dispose();
    super.dispose();
  }

  void _submit() {
    final isFormValid = _formKey.currentState?.validate() ?? false;
    final isDateValid = _selectedDate != null;
    final isFileValid = _selectedFilePath != null && _selectedFilePath!.isNotEmpty;

    if (!isFormValid || !isDateValid || !isFileValid) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Harap lengkapi seluruh isian formulir dengan benar!'),
          backgroundColor: Colors.redAccent,
          behavior: SnackBarBehavior.floating,
        ),
      );
      return;
    }

    widget.onSave(
      _nameController.text.trim(),
      _phoneController.text.trim(),
      _selectedDate!,
      _selectedColor,
      _selectedFilePath!,
      _selectedFileName ?? 'file',
    );
  }

  @override
  Widget build(BuildContext context) {
    final isEditing = widget.contactToEdit != null;

    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(18),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                children: [
                  Icon(
                    isEditing ? Icons.edit_note_rounded : Icons.person_add_alt_1_rounded,
                    color: isEditing ? Colors.orange : Colors.teal,
                    size: 26,
                  ),
                  const SizedBox(width: 8),
                  Text(
                    isEditing ? 'Ubah Data Kontak' : 'Form Tambah Kontak',
                    style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const Spacer(),
                  if (isEditing)
                    TextButton.icon(
                      onPressed: widget.onCancelEdit,
                      icon: const Icon(Icons.close, size: 16),
                      label: const Text('Batal'),
                      style: TextButton.styleFrom(foregroundColor: Colors.red),
                    ),
                ],
              ),
              const Divider(height: 24),
              TextFormField(
                controller: _nameController,
                decoration: InputDecoration(
                  labelText: 'Nama Lengkap *',
                  hintText: 'Contoh: Muhammad Arif',
                  prefixIcon: const Icon(Icons.person_outline),
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                  filled: true,
                  fillColor: Colors.grey.shade50,
                ),
                validator: ContactValidator.validateName,
              ),
              const SizedBox(height: 14),
              TextFormField(
                controller: _phoneController,
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  labelText: 'Nomor Telepon *',
                  hintText: 'Diawali 62, contoh: 62812345678',
                  prefixIcon: const Icon(Icons.phone_outlined),
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                  filled: true,
                  fillColor: Colors.grey.shade50,
                ),
                validator: ContactValidator.validatePhone,
              ),
              const SizedBox(height: 14),
              DatePickerTile(
                controller: _dateController,
                selectedDate: _selectedDate,
                onDateSelected: (d) => setState(() => _selectedDate = d),
              ),
              const SizedBox(height: 16),
              ColorPickerTile(
                selectedColor: _selectedColor,
                onColorChanged: (c) => setState(() => _selectedColor = c),
              ),
              const SizedBox(height: 16),
              FilePickerTile(
                filePath: _selectedFilePath,
                fileName: _selectedFileName,
                onFilePicked: (p, n) => setState(() {
                  _selectedFilePath = p;
                  _selectedFileName = n;
                }),
              ),
              const SizedBox(height: 18),
              ElevatedButton.icon(
                onPressed: _submit,
                icon: Icon(isEditing ? Icons.save_as_rounded : Icons.save_rounded),
                label: Text(
                  isEditing ? 'Perbarui Kontak' : 'Simpan Kontak',
                  style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: isEditing ? Colors.orange.shade700 : Colors.teal,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
