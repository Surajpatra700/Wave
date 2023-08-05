// ignore_for_file: file_names, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:wave_chat/screens/contacts/contactList.dart';

class ContactScreen extends StatefulWidget {
  const ContactScreen({super.key});

  @override
  State<ContactScreen> createState() => _ContactScreenState();
}

class _ContactScreenState extends State<ContactScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ContactList(),
    );
  }
}