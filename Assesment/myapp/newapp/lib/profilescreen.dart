import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

import 'authscreen.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  String _email = '';
  String _uid = '';
  bool _loading = true;
  Map<String, dynamic>? _profileData;

  @override
  void initState() {
    super.initState();
    _loadProfile();
  }

  Future<void> _loadProfile() async {
    final user = FirebaseAuth.instance.currentUser;
    if (user == null) {
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_) => AuthScreen()));
      return;
    }
    setState(() { _email = user.email ?? ''; _uid = user.uid; _loading = true; });
    try {
      final snapshot = await FirebaseDatabase.instance.ref('users/${user.uid}').get();
      if (snapshot.exists) {
        _profileData = Map<String, dynamic>.from(snapshot.value as Map);
      }
    } catch (e) {
    } finally {
      setState(() { _loading = false; });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text('Profile')), body: _loading ? Center(child: CircularProgressIndicator()) : Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text('Email: $_email'),
        SizedBox(height: 6),
        Text('UID: $_uid'),
        SizedBox(height: 12),
        if (_profileData != null) ...[
          Text('Profile details:'),
          SizedBox(height: 6),
          for (final e in _profileData!.entries) Text('${e.key}: ${e.value}'),
        ]
      ]),
    ));
  }
}
