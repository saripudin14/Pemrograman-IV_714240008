import 'package:flutter/material.dart';
import '../../models/contact.dart';
import 'contact_item_card.dart';

/// Daftar Kontak dengan indikator total dan empty state (Ref Pertemuan 4)
class ContactListView extends StatelessWidget {
  final List<Contact> contacts;
  final Function(Contact) onEdit;
  final Function(String) onDelete;

  const ContactListView({
    super.key,
    required this.contacts,
    required this.onEdit,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'List Contact',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                '${contacts.length} Kontak',
                style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),
        if (contacts.isEmpty)
          Card(
            elevation: 1,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
            child: const Padding(
              padding: EdgeInsets.symmetric(vertical: 36, horizontal: 20),
              child: Column(
                children: [
                  Icon(Icons.contact_phone_outlined, size: 50, color: Colors.grey),
                  SizedBox(height: 12),
                  Text('Belum Ada Kontak Tersimpan', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey)),
                  SizedBox(height: 4),
                  Text(
                    'Isi formulir di atas lalu tekan Simpan Kontak.',
                    style: TextStyle(fontSize: 12, color: Colors.grey),
                  ),
                ],
              ),
            ),
          )
        else
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: contacts.length,
            itemBuilder: (context, index) {
              final contact = contacts[index];
              return ContactItemCard(
                contact: contact,
                onEdit: () => onEdit(contact),
                onDelete: () => onDelete(contact.id),
              );
            },
          ),
      ],
    );
  }
}
