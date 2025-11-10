import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';

import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

// --- MOCK FIREBASE & API (FOR DEMONSTRATION) ---
// In a real app, you would import and use the actual Firebase packages.
// This is to make the code runnable for demonstration without full Firebase setup.

class MockFirebaseAuth {
  static Future<Map<String, String>> signIn(String email, String password) async {
    await Future.delayed(const Duration(seconds: 1));
    if (email == 'test@test.com' && password == 'password') {
      return {'uid': '12345', 'email': email};
    }
    throw Exception('Invalid credentials');
  }

  static Future<Map<String, String>> signUp(
      String email, String password, String name) async {
    await Future.delayed(const Duration(seconds: 1));
    // In a real app, this would also call FirebaseDatabase to save the user's name.
    return {'uid': '12345', 'email': email, 'name': name};
  }

  static Future<void> signOut() async {
    await Future.delayed(const Duration(milliseconds: 500));
  }
}

// Model for our Service Provider
class ServiceProvider {
  final String id;
  final String name;
  final String category;
  final String imageUrl;
  final double rating;

  ServiceProvider({
    required this.id,
    required this.name,
    required this.category,
    required this.imageUrl,
    required this.rating,
  });

  // Factory constructor to create a ServiceProvider from JSON
  factory ServiceProvider.fromJson(Map<String, dynamic> json) {
    return ServiceProvider(
      id: json['id'] ?? '',
      name: json['name'] ?? 'No Name',
      category: json['category'] ?? 'Uncategorized',
      imageUrl: json['avatar'] ??
          'https://placehold.co/100x100/EEE/31343C?text=Service', // 'avatar' is common in mockapi.io
      rating: double.tryParse(json['rating']?.toString() ?? '0.0') ?? 0.0,
    );
  }
}

// --- MAIN APP ---

void main() {
  // In a real app, you would initialize Firebase here:
  // WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();
  runApp(const MyCityConnectApp());
}

class MyCityConnectApp extends StatelessWidget {
  const MyCityConnectApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MyCityConnect',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueAccent),
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.blueAccent,
          foregroundColor: Colors.white,
          elevation: 4,
        ),
        cardTheme: CardThemeData(
          elevation: 2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blueAccent,
            foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
          ),
        ),
      ),
      debugShowCheckedModeBanner: false,
      // Using named routes as requested
      initialRoute: '/',
      routes: {
        '/': (context) => const SplashScreen(),
        '/auth': (context) => const AuthScreen(),
        '/home': (context) => const HomeScreen(),
        '/profile': (context) => const ProfileScreen(),
        '/bookings': (context) => const MyBookingsScreen(),
        // We will handle the detail route in onGenerateRoute to pass arguments
      },
      onGenerateRoute: (settings) {
        if (settings.name == '/detail') {
          final args = settings.arguments as ServiceProvider;
          return MaterialPageRoute(
            builder: (context) {
              return ServiceDetailScreen(provider: args);
            },
          );
        }
        return null;
      },
    );
  }
}

// --- 1. SPLASH SCREEN ---

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );
    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    );

    _controller.forward();

    _navigateToNext();
  }

  Future<void> _navigateToNext() async {
    // Wait for animation
    await Future.delayed(const Duration(seconds: 3));

    // Check login state using SharedPreferences
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool isLoggedIn = prefs.getBool('isLoggedIn') ?? false;

    if (mounted) {
      if (isLoggedIn) {
        Navigator.of(context).pushReplacementNamed('/home');
      } else {
        Navigator.of(context).pushReplacementNamed('/auth');
      }
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueAccent,
      body: Center(
        child: ScaleTransition(
          scale: _animation,
          child: const Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.location_city, size: 100, color: Colors.white),
              SizedBox(height: 20),
              Text(
                'MyCityConnect',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// --- 2. LOGIN/SIGNUP SCREEN ---

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final _formKey = GlobalKey<FormState>();
  bool _isLogin = true;
  bool _isLoading = false;

  String _email = '';
  String _password = '';
  String _name = '';

  Future<void> _trySubmit() async {
    final isValid = _formKey.currentState?.validate() ?? false;
    FocusScope.of(context).unfocus(); // Close keyboard

    if (!isValid) return;

    _formKey.currentState?.save();
    setState(() => _isLoading = true);

    try {
      if (_isLogin) {
        // --- MOCK FIREBASE AUTH LOGIN ---
        // REAL CODE:
        // final userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        //   email: _email,
        //   password: _password,
        // );
        await MockFirebaseAuth.signIn(_email, _password);
      } else {
        // --- MOCK FIREBASE AUTH SIGNUP ---
        // REAL CODE:
        // final userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        //   email: _email,
        //   password: _password,
        // );
        // // Save extra user data to Realtime Database
        // await FirebaseDatabase.instance.ref('users/${userCredential.user!.uid}').set({
        //   'name': _name,
        //   'email': _email,
        // });
        await MockFirebaseAuth.signUp(_email, _password, _name);
      }

      // Save login state
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setBool('isLoggedIn', true);

      // In a real app, you'd also save the user's email/name to prefs
      await prefs.setString('userName', _isLogin ? 'Test User' : _name);
      await prefs.setString('userEmail', _email);


      if (mounted) {
        Navigator.of(context).pushReplacementNamed('/home');
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(e.toString()),
          backgroundColor: Theme.of(context).colorScheme.error,
        ),
      );
    } finally {
      if (mounted) {
        setState(() => _isLoading = false);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24.0),
          child: Card(
            margin: const EdgeInsets.all(20),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // App Logo
                    const Icon(Icons.location_city,
                        size: 60, color: Colors.blueAccent),
                    const SizedBox(height: 16),
                    Text(
                      _isLogin ? 'Welcome Back!' : 'Create Account',
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                    const SizedBox(height: 24),

                    // Name Field (Signup only)
                    if (!_isLogin)
                      TextFormField(
                        key: const ValueKey('name'),
                        decoration:
                        const InputDecoration(labelText: 'Full Name'),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your name.';
                          }
                          return null;
                        },
                        onSaved: (value) => _name = value!,
                      ),
                    const SizedBox(height: 12),

                    // Email Field
                    TextFormField(
                      key: const ValueKey('email'),
                      decoration:
                      const InputDecoration(labelText: 'Email Address'),
                      keyboardType: TextInputType.emailAddress,
                      validator: (value) {
                        if (value == null ||
                            !value.contains('@') ||
                            !value.contains('.')) {
                          return 'Please enter a valid email.';
                        }
                        return null;
                      },
                      onSaved: (value) => _email = value!,
                    ),
                    const SizedBox(height: 12),

                    // Password Field
                    TextFormField(
                      key: const ValueKey('password'),
                      decoration: const InputDecoration(labelText: 'Password'),
                      obscureText: true,
                      validator: (value) {
                        if (value == null || value.length < 6) {
                          return 'Password must be at least 6 characters.';
                        }
                        return null;
                      },
                      onSaved: (value) => _password = value!,
                    ),
                    const SizedBox(height: 24),

                    // Submit Button
                    if (_isLoading)
                      const CircularProgressIndicator()
                    else
                      ElevatedButton(
                        onPressed: _trySubmit,
                        style: ElevatedButton.styleFrom(
                          minimumSize: const Size(double.infinity, 48),
                        ),
                        child: Text(_isLogin ? 'Login' : 'Sign Up'),
                      ),
                    const SizedBox(height: 12),

                    // Toggle Button
                    TextButton(
                      onPressed: () {
                        setState(() => _isLogin = !_isLogin);
                      },
                      child: Text(
                        _isLogin
                            ? 'Create new account'
                            : 'I already have an account',
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// --- 3. HOME DASHBOARD ---

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  List<ServiceProvider> _services = [];
  bool _isLoading = true;
  String _error = '';

  String _userName = 'User';
  String _userEmail = 'user@example.com';

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _fetchServices();
    _loadUserData();
  }

  Future<void> _loadUserData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _userName = prefs.getString('userName') ?? 'User';
      _userEmail = prefs.getString('userEmail') ?? 'user@example.com';
    });
  }

  Future<void> _fetchServices() async {
    // --- MOCK API CALL ---
    // Replace this URL with your own mockapi.io URL
    const url = 'https://668fab35c0a7969efd9a54e9.mockapi.io/api/v1/services';

    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body);
        setState(() {
          _services =
              data.map((json) => ServiceProvider.fromJson(json)).toList();
          _isLoading = false;
        });
      } else {
        throw Exception('Failed to load services');
      }
    } catch (e) {
      setState(() {
        _error = e.toString();
        _isLoading = false;
      });
    }
  }

  Future<void> _logout() async {
    // Show confirmation dialog
    final didConfirm = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Logout'),
        content: const Text('Are you sure you want to logout?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(ctx).pop(false),
            child: const Text('No'),
          ),
          TextButton(
            onPressed: () => Navigator.of(ctx).pop(true),
            child: const Text('Yes'),
          ),
        ],
      ),
    );

    if (didConfirm == true) {
      // Clear login state
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setBool('isLoggedIn', false);

      // Mock Firebase sign out
      // REAL CODE: await FirebaseAuth.instance.signOut();
      await MockFirebaseAuth.signOut();

      if (mounted) {
        Navigator.of(context).pushReplacementNamed('/auth');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Dashboard'),
        bottom: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(icon: Icon(Icons.list), text: 'List View'),
            Tab(icon: Icon(Icons.grid_view), text: 'Grid View'),
          ],
        ),
      ),
      drawer: _buildAppDrawer(),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    if (_isLoading) {
      return const Center(child: CircularProgressIndicator());
    }
    if (_error.isNotEmpty) {
      return Center(
          child: Text('Error: $_error',
              style: const TextStyle(color: Colors.red)));
    }
    if (_services.isEmpty) {
      return const Center(child: Text('No services found.'));
    }

    return TabBarView(
      controller: _tabController,
      children: [
        ServiceListView(services: _services),
        ServiceGridView(services: _services),
      ],
    );
  }

  Widget _buildAppDrawer() {
    return Drawer(
      child: Column(
        children: [
          UserAccountsDrawerHeader(
            accountName: Text(_userName),
            accountEmail: Text(_userEmail),
            currentAccountPicture: const CircleAvatar(
              backgroundColor: Colors.white,
              child: Icon(Icons.person, size: 40, color: Colors.blueAccent),
            ),
            decoration: const BoxDecoration(
              color: Colors.blueAccent,
            ),
          ),
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text('Home'),
            onTap: () => Navigator.of(context).pop(), // Just close drawer
          ),
          ListTile(
            leading: const Icon(Icons.book_online),
            title: const Text('My Bookings'),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.of(context).pushNamed('/bookings');
            },
          ),
          ListTile(
            leading: const Icon(Icons.person),
            title: const Text('Profile'),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.of(context).pushNamed('/profile');
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.contact_phone),
            title: const Text('Contact Us (Call)'),
            onTap: () {
              // Use url_launcher to make a call
              _launchURL('tel:+1234567890');
            },
          ),
          ListTile(
            leading: const Icon(Icons.sms),
            title: const Text('Contact Us (SMS)'),
            onTap: () {
              // Use url_launcher to send SMS
              _launchURL('sms:+1234567890');
            },
          ),
          ListTile(
            leading: const Icon(Icons.web),
            title: const Text('Visit our Website'),
            onTap: () {
              // Use url_launcher to open URL
              _launchURL('https://flutter.dev');
            },
          ),
          const Spacer(), // Pushes logout to the bottom
          const Divider(),
          ListTile(
            leading: const Icon(Icons.logout),
            title: const Text('Logout'),
            onTap: _logout,
          ),
        ],
      ),
    );
  }

  Future<void> _launchURL(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Could not launch $url'),
        ),
      );
    }
  }
}

// --- 4. SERVICE LIST & GRID VIEWS ---

class ServiceListView extends StatelessWidget {
  final List<ServiceProvider> services;
  const ServiceListView({super.key, required this.services});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(8.0),
      itemCount: services.length,
      itemBuilder: (context, index) {
        final service = services[index];
        return Card(
          margin: const EdgeInsets.symmetric(vertical: 8.0),
          child: ListTile(
            leading: Hero(
              tag: 'img-${service.id}',
              child: Image.network(
                service.imageUrl,
                width: 60,
                height: 60,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) =>
                const Icon(Icons.image_not_supported, size: 60),
              ),
            ),
            title: Text(service.name),
            subtitle: Text(service.category),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(service.rating.toStringAsFixed(1)),
                const Icon(Icons.star, color: Colors.amber, size: 16),
              ],
            ),
            onTap: () {
              Navigator.of(context).pushNamed('/detail', arguments: service);
            },
          ),
        );
      },
    );
  }
}

class ServiceGridView extends StatelessWidget {
  final List<ServiceProvider> services;
  const ServiceGridView({super.key, required this.services});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.all(8.0),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2, // Two columns
        crossAxisSpacing: 8.0,
        mainAxisSpacing: 8.0,
        childAspectRatio: 0.8, // Adjust for item shape
      ),
      itemCount: services.length,
      itemBuilder: (context, index) {
        final service = services[index];
        return Card(
          clipBehavior: Clip.antiAlias, // Clip image corners
          child: InkWell(
            onTap: () {
              Navigator.of(context).pushNamed('/detail', arguments: service);
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Hero(
                    tag: 'img-${service.id}', // Must be unique
                    child: Image.network(
                      service.imageUrl,
                      width: double.infinity,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) => const Center(
                          child: Icon(Icons.image_not_supported, size: 60)),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    service.name,
                    style: Theme.of(context).textTheme.titleMedium,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text(
                    service.category,
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(service.rating.toStringAsFixed(1)),
                      const Icon(Icons.star, color: Colors.amber, size: 16),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

// --- 5. SERVICE DETAIL SCREEN ---

class ServiceDetailScreen extends StatefulWidget {
  final ServiceProvider provider;
  const ServiceDetailScreen({super.key, required this.provider});

  @override
  State<ServiceDetailScreen> createState() => _ServiceDetailScreenState();
}

class _ServiceDetailScreenState extends State<ServiceDetailScreen> {
  final ImagePicker _picker = ImagePicker();
  XFile? _imageFile; // This will hold the picked image

  Future<void> _pickImage(ImageSource source) async {
    try {
      final pickedFile = await _picker.pickImage(source: source);
      if (pickedFile != null) {
        setState(() {
          _imageFile = pickedFile;
        });
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Image selected successfully!'),
            backgroundColor: Colors.green,
          ),
        );
      }
    } catch (e) {
      // Handle permissions or other errors
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Failed to pick image: $e'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  void _showPickerOptions() {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext bc) {
        return SafeArea(
          child: Wrap(
            children: <Widget>[
              ListTile(
                leading: const Icon(Icons.photo_library),
                title: const Text('Gallery'),
                onTap: () {
                  _pickImage(ImageSource.gallery);
                  Navigator.of(context).pop();
                },
              ),
              ListTile(
                leading: const Icon(Icons.photo_camera),
                title: const Text('Camera'),
                onTap: () {
                  _pickImage(ImageSource.camera);
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.provider.name),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Hero(
              tag: 'img-${widget.provider.id}',
              child: Image.network(
                widget.provider.imageUrl,
                width: double.infinity,
                height: 250,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) => Container(
                  height: 250,
                  color: Colors.grey[200],
                  child:
                  const Center(child: Icon(Icons.image, size: 100, color: Colors.grey)),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Text(
              widget.provider.name,
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Text(
                  widget.provider.category,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                const Spacer(),
                const Icon(Icons.star, color: Colors.amber),
                Text(
                  '${widget.provider.rating.toStringAsFixed(1)} / 5.0',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ],
            ),
            const Divider(height: 32),
            Text(
              'About this Service',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 8),
            // Placeholder description
            const Text(
              'This is a placeholder description for the service. In a real app, this data would also come from the API. This provider offers excellent service and has high customer ratings.',
              style: TextStyle(fontSize: 16, height: 1.5),
            ),
            const Divider(height: 32),
            Text(
              'Upload a Photo',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 8),
            const Text(
              'Have an issue? Upload a photo from your camera or gallery.',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 16),
            Center(
              child: Column(
                children: [
                  Container(
                    width: double.infinity,
                    height: 200,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: _imageFile == null
                        ? const Center(child: Text('No image selected.'))
                        : ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.file(
                        File(_imageFile!.path), // Display selected image
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton.icon(
                    onPressed: _showPickerOptions,
                    icon: const Icon(Icons.upload_file),
                    label: const Text('Select Image'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// --- 6. PLACEHOLDER SCREENS ---

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('My Profile')),
      body: const Center(
        child: Text('Profile Screen - Coming Soon!',
            style: TextStyle(fontSize: 20)),
      ),
    );
  }
}

class MyBookingsScreen extends StatelessWidget {
  const MyBookingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('My Bookings')),
      body: const Center(
        child: Text('My Bookings Screen - Coming Soon!',
            style: TextStyle(fontSize: 20)),
      ),
    );
  }
}