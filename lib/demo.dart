import 'package:flutter/material.dart';
import 'package:flutter_generic_dropdown/Generic%20Dropdown/generic_dropdown.dart';

/// Sample model
class User {
  final int id;
  final String name;

  User(this.id, this.name);
}

class GenericDropdownDemoScreen extends StatefulWidget {
  const GenericDropdownDemoScreen({super.key});

  @override
  State<GenericDropdownDemoScreen> createState() =>
      _GenericDropdownDemoScreenState();
}

class _GenericDropdownDemoScreenState
    extends State<GenericDropdownDemoScreen> {
  User? selectedUser;

  final List<User> users = [
    User(1, 'Rutik'),
    User(2, 'Amit'),
    User(3, 'Neha'),
    User(4, 'Nfew'),
    User(5, 'Nefewf'),
    User(6, 'Nbngdb'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Custom Generic Dropdown'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Select User',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 8),

            /// 🔽 Custom Generic Dropdown
            CustomGenericDropdown<User>(
              items: users,
              value: selectedUser,
              hint: 'Choose user',
              labelBuilder: (u) => u.name,
              onChanged: (u) {
                setState(() => selectedUser = u);
              },
            ),

            const SizedBox(height: 24),

            /// Selected result
            Text(
              selectedUser == null
                  ? 'No user selected'
                  : 'Selected: ${selectedUser!.name} (ID: ${selectedUser!.id})',
              style: const TextStyle(fontSize: 14),
            ),
          ],
        ),
      ),
    );
  }
}
