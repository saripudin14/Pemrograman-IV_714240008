import 'package:flutter/material.dart';
import '../widgets/home/campus_banner.dart';
import '../widgets/home/profile_card.dart';
import '../widgets/home/stats_section.dart';

/// Halaman Home UTS Pemrograman IV
class HomeScreen extends StatelessWidget {
  final int contactCount;
  final VoidCallback onNavigateToContacts;

  const HomeScreen({
    super.key,
    required this.contactCount,
    required this.onNavigateToContacts,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('UTS Pemrograman IV'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const CampusBanner(),
              const SizedBox(height: 16),
              const ProfileCard(),
              const SizedBox(height: 16),
              StatsSection(
                contactCount: contactCount,
                onNavigateToContacts: onNavigateToContacts,
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}
