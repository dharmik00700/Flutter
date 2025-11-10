import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:http/http.dart' as http;
import 'package:newapp/servicecard.dart';
import 'package:newapp/servicemodel.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

import 'authscreen.dart';
import 'main.dart';

class DashboardScreen extends StatefulWidget {
  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  String mockApiUrl = 'https://63b4b9f3f7c74b9d6f2b9b3c.mockapi.io/api/services';
  int _selectedIndex = 0;
  List<Service> _services = [];
  bool _loading = true;
  bool _grid = false;

  @override
  void initState() {
    super.initState();
    _fetchServices();
  }

  Future<void> _fetchServices() async {
    setState(() => _loading = true);
    try {
      final resp = await http.get(Uri.parse(mockApiUrl));
      if (resp.statusCode == 200) {
        List data = jsonDecode(resp.body);
        _services = data.map((e) => Service.fromJson(e)).toList();
      } else {
        _services = Service.mockList();
      }
    } catch (e) {
      _services = Service.mockList();
    } finally {
      setState(() => _loading = false);
    }
  }

  void _onDrawerItem(String id) async {
    Navigator.of(context).pop();
    switch (id) {
      case 'home':
        break;
      case 'bookings':
        Navigator.of(context).pushNamed('/bookings');
        break;
      case 'profile':
        Navigator.of(context).pushNamed('/profile');
        break;
      case 'contact':
        _contactUs();
        break;
      case 'logout':
        await FirebaseAuth.instance.signOut();
        SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.setBool('is_logged_in', false);
        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_) => AuthScreen()));
        break;
    }
  }

  void _contactUs() async {
    showModalBottomSheet(context: context, builder: (ctx) {
      return Column(mainAxisSize: MainAxisSize.min, children: [
        ListTile(leading: Icon(Icons.phone), title: Text('Call Support'), onTap: () => _makePhoneCall('tel:+911234567890')),
        ListTile(leading: Icon(Icons.message), title: Text('Send SMS'), onTap: () => _sendSms('sms:+911234567890?body=Hi')),
        ListTile(leading: Icon(Icons.web), title: Text('Visit Website'), onTap: () => _launchUrl('https://example.com')),
      ]);
    });
  }

  Future<void> _makePhoneCall(String url) async {
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Cannot make call')));
    }
  }

  Future<void> _sendSms(String url) async {
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Cannot send SMS')));
    }
  }

  Future<void> _launchUrl(String url) async {
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Cannot open URL')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MyCityConnect'),
        actions: [
          IconButton(icon: Icon(_grid ? Icons.list : Icons.grid_view), onPressed: () { setState(() { _grid = !_grid; }); }),
          IconButton(icon: Icon(Icons.refresh), onPressed: _fetchServices),
        ],
      ),
      drawer: Drawer(
        child: SafeArea(
          child: Column(
            children: [
              UserAccountsDrawerHeader(
                accountName: Text(FirebaseAuth.instance.currentUser?.email ?? 'User'),
                accountEmail: Text(FirebaseAuth.instance.currentUser?.uid ?? ''),
                currentAccountPicture: CircleAvatar(child: Icon(Icons.person)),
              ),
              ListTile(leading: Icon(Icons.home), title: Text('Home'), onTap: () => _onDrawerItem('home')),
              ListTile(leading: Icon(Icons.book), title: Text('My Bookings'), onTap: () => _onDrawerItem('bookings')),
              ListTile(leading: Icon(Icons.person), title: Text('Profile'), onTap: () => _onDrawerItem('profile')),
              ListTile(leading: Icon(Icons.support_agent), title: Text('Contact Us'), onTap: () => _onDrawerItem('contact')),
              Spacer(),
              ListTile(leading: Icon(Icons.logout), title: Text('Logout'), onTap: () => _onDrawerItem('logout')),
            ],
          ),
        ),
      ),
      body: _loading ? Center(child: SpinKitCircle(size: 60.0)) : Padding(
        padding: const EdgeInsets.all(8.0),
        child: _grid ? GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, childAspectRatio: 0.85),
          itemCount: _services.length,
          itemBuilder: (ctx, i) => ServiceCard(service: _services[i]),
        ) : ListView.builder(
          itemCount: _services.length,
          itemBuilder: (ctx, i) => ServiceCard(service: _services[i]),
        ),
      ),
    );
  }
}
