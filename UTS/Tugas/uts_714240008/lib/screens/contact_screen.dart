import 'package:flutter/material.dart';
import '../models/contact.dart';
import '../widgets/contact/contact_form_card.dart';
import '../widgets/contact/contact_list_view.dart';

/// Halaman Pengelolaan Kontak (Formulir & ListView)
class ContactScreen extends StatefulWidget {
  final List<Contact> contacts;
  final Function(Contact) onAddContact;
  final Function(Contact) onUpdateContact;
  final Function(String) onDeleteContact;

  const ContactScreen({
    super.key,
    required this.contacts,
    required this.onAddContact,
    required this.onUpdateContact,
    required this.onDeleteContact,
  });

  @override
  State<ContactScreen> createState() => _ContactScreenState();
}

class _ContactScreenState extends State<ContactScreen> {
  final _scrollController = ScrollController();
  Contact? _contactToEdit;

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _handleSave(String name, String phone, DateTime date, Color color, String filePath, String fileName) {
    if (_contactToEdit != null) {
      final updated = Contact(
        id: _contactToEdit!.id,
        name: name,
        phone: phone,
        date: date,
        color: color,
        filePath: filePath,
        fileName: fileName,
      );
      widget.onUpdateContact(updated);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Kontak berhasil diperbarui!'),
          backgroundColor: Colors.green,
          behavior: SnackBarBehavior.floating,
        ),
      );
    } else {
      final newContact = Contact(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        name: name,
        phone: phone,
        date: date,
        color: color,
        filePath: filePath,
        fileName: fileName,
      );
      widget.onAddContact(newContact);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Kontak baru berhasil disimpan!'),
          backgroundColor: Colors.green,
          behavior: SnackBarBehavior.floating,
        ),
      );
    }

    setState(() {
      _contactToEdit = null;
    });
  }

  void _startEditing(Contact contact) {
    setState(() {
      _contactToEdit = contact;
    });
    _scrollController.animateTo(
      0,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Daftar Kontak'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          controller: _scrollController,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ContactFormCard(
                contactToEdit: _contactToEdit,
                onSave: _handleSave,
                onCancelEdit: () => setState(() => _contactToEdit = null),
              ),
              const SizedBox(height: 20),
              ContactListView(
                contacts: widget.contacts,
                onEdit: _startEditing,
                onDelete: (id) {
                  widget.onDeleteContact(id);
                  if (_contactToEdit?.id == id) {
                    setState(() => _contactToEdit = null);
                  }
                },
              ),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}
