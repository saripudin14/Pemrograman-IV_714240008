import 'package:flutter/material.dart';
import '../models/contact.dart';
import 'home_screen.dart';
import 'contact_screen.dart';

class MainNavigation extends StatefulWidget {
  const MainNavigation({super.key});

  @override
  State<MainNavigation> createState() => _MainNavigationState();
}

class _MainNavigationState extends State<MainNavigation> {
  int _currentIndex = 0;

  // State penyimpanan kontak sementara (in-memory)
  final List<Contact> _contacts = [];

  void _addContact(Contact contact) {
    setState(() {
      _contacts.add(contact);
    });
  }

  void _updateContact(Contact updated) {
    final index = _contacts.indexWhere((c) => c.id == updated.id);
    if (index != -1) {
      setState(() {
        _contacts[index] = updated;
      });
    }
  }

  void _deleteContact(String id) {
    setState(() {
      _contacts.removeWhere((c) => c.id == id);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // IndexedStack memastikan state kedua tab tidak ter-reset saat berpindah
      body: IndexedStack(
        index: _currentIndex,
        children: [
          HomeScreen(
            contactCount: _contacts.length,
            onNavigateToContacts: () {
              setState(() {
                _currentIndex = 1;
              });
            },
          ),
          ContactScreen(
            contacts: _contacts,
            onAddContact: _addContact,
            onUpdateContact: _updateContact,
            onDeleteContact: _deleteContact,
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        selectedItemColor: Colors.teal.shade700,
        unselectedItemColor: Colors.grey.shade600,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            activeIcon: Icon(Icons.home_rounded),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.contact_phone_outlined),
            activeIcon: Icon(Icons.contact_phone_rounded),
            label: 'Contact List',
          ),
        ],
      ),
    );
  }
}
