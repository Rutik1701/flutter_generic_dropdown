# 📦 Custom Generic Dropdown

A lightweight, reusable, and fully custom Flutter dropdown widget built using Dart generics.
It supports any data type (String, int, or custom models) and uses a custom UI instead of Flutter’s default dropdown.
---

## ✨ Features

🔁 Generic dropdown using <T>

🎯 Works with String, int, and custom model classes

🎨 Fully custom UI (no DropdownButton)

🧩 Clean & reusable API

📦 Library-ready architecture

⚡ Lightweight & dependency-free

🚀 Easy to extend (search, validation, multi-select)

---

## ✨ Preview





https://github.com/user-attachments/assets/35643239-03f2-44b4-ab7d-655d45579d2d



---

## ✨ Installation
Add this to your package's pubspec.yaml file:
```
dependencies:
  custom_generic_dropdown:
    path: ../custom_generic_dropdown

```
▶️ From GitHub
```
dependencies:
  custom_generic_dropdown:
    git:
      url: https://github.com/yourusername/custom_generic_dropdown.git

```
Then Run:
```
flutter pub get
```
## 📁 Folder Structure
```
custom_generic_dropdown/
│
├── lib/
│   ├── custom_generic_dropdown.dart
│   └── src/
│       └── generic_dropdown.dart
│
├── example/
│   └── generic_dropdown_demo_screen.dart
│
└── pubspec.yaml

  ```
## 🚀 Usage 
```
import 'package:flutter/material.dart';
import 'package:custom_generic_dropdown/custom_generic_dropdown.dart';

/// User model for demo
class User {
  final int id;
  final String name;
  final String email;

  User({
    required this.id,
    required this.name,
    required this.email,
  });
}

class UserDropdownDemoScreen extends StatefulWidget {
  const UserDropdownDemoScreen({super.key});

  @override
  State<UserDropdownDemoScreen> createState() =>
      _UserDropdownDemoScreenState();
}

class _UserDropdownDemoScreenState extends State<UserDropdownDemoScreen> {
  User? selectedUser;

  final List<User> users = [
    User(id: 1, name: 'Rutik Parmar', email: 'rutik@gmail.com'),
    User(id: 2, name: 'Amit Shah', email: 'amit@gmail.com'),
    User(id: 3, name: 'Neha Patel', email: 'neha@gmail.com'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User Dropdown Demo'),
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

            /// 🔽 User Dropdown
            CustomGenericDropdown<User>(
              items: users,
              value: selectedUser,
              hint: 'Choose user',
              labelBuilder: (user) => user.name,
              onChanged: (user) {
                setState(() => selectedUser = user);
              },
            ),

            const SizedBox(height: 24),

            /// Selected user details
            if (selectedUser != null) ...[
              const Text(
                'Selected User Details',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              Text('ID: ${selectedUser!.id}'),
              Text('Name: ${selectedUser!.name}'),
              Text('Email: ${selectedUser!.email}'),
            ] else
              const Text(
                'No user selected',
                style: TextStyle(color: Colors.grey),
              ),
          ],
        ),
      ),
    );
  }
}


```
## 📜 License
MIT License
```
Copyright (c) 2025 Excelsior Technologies

Permission is hereby granted, free of charge, to any person obtaining a copy  
of this software and associated documentation files (the "Software"), to deal  
in the Software without restriction, including without limitation the rights  
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell  
copies of the Software, and to permit persons to whom the Software is  
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all  
copies or substantial portions of the Software.

