import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class MyBookingsScreen extends StatefulWidget {
  @override
  _MyBookingsScreenState createState() => _MyBookingsScreenState();
}

class _MyBookingsScreenState extends State<MyBookingsScreen> {
  List<Map<String, dynamic>> _bookings = [];
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    _fetchBookings();
  }

  Future<void> _fetchBookings() async {
    setState(() => _loading = true);
    final user = FirebaseAuth.instance.currentUser;
    if (user == null) return;
    final snapshot =
    await FirebaseDatabase.instance.ref('bookings/${user.uid}').get();
    if (snapshot.exists) {
      final data = Map<String, dynamic>.from(snapshot.value as Map);
      _bookings = data.values
          .map((e) => Map<String, dynamic>.from(e as Map))
          .toList();
    }
    setState(() => _loading = false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('My Bookings')),
      body: _loading
          ? Center(child: CircularProgressIndicator())
          : _bookings.isEmpty
          ? Center(child: Text('No bookings yet'))
          : ListView.builder(
        itemCount: _bookings.length,
        itemBuilder: (ctx, i) {
          final b = _bookings[i];
          return Card(
            margin: EdgeInsets.all(8),
            child: ListTile(
              title: Text(b['service_name'] ?? ''),
              subtitle: Text('${b['date']} at ${b['time']}'),
              trailing: Icon(Icons.event_available),
            ),
          );
        },
      ),
    );
  }
}
