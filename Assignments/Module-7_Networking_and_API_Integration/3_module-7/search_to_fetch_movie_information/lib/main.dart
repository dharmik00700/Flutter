import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(MovieSearchApp());
}

class MovieSearchApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Movie Search App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Colors.black,
        primaryColor: Colors.deepPurple,
      ),
      home: MovieSearchScreen(),
    );
  }
}

class MovieSearchScreen extends StatefulWidget {
  @override
  _MovieSearchScreenState createState() => _MovieSearchScreenState();
}

class _MovieSearchScreenState extends State<MovieSearchScreen> {
  final TextEditingController _controller = TextEditingController();
  Map<String, dynamic>? _movieData;
  bool _isLoading = false;
  String? _error;

  Future<void> fetchMovie(String title) async {
    setState(() {
      _isLoading = true;
      _error = null;
      _movieData = null;
    });

    final apiKey = "YOUR_API_KEY_HERE";
    final url = Uri.parse("https://www.omdbapi.com/?t=$title&apikey=$apiKey");

    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        if (data['Response'] == 'True') {
          setState(() {
            _movieData = data;
          });
        } else {
          setState(() {
            _error = data['Error'];
          });
        }
      } else {
        setState(() {
          _error = "Failed to load movie data.";
        });
      }
    } catch (e) {
      setState(() {
        _error = "Something went wrong: $e";
      });
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  Widget movieCard(Map<String, dynamic> movie) {
    return Card(
      color: Colors.grey[900],
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      margin: EdgeInsets.all(16),
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            movie['Poster'] != 'N/A'
                ? ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(movie['Poster'], height: 250),
            )
                : Icon(Icons.movie, size: 150, color: Colors.grey),
            SizedBox(height: 16),
            Text(
              movie['Title'] ?? 'Unknown',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            Text(
              '${movie['Year']} | ${movie['Genre'] ?? ''}',
              style: TextStyle(color: Colors.grey, fontSize: 16),
            ),
            Divider(color: Colors.grey[600], height: 20),
            Text(movie['Plot'] ?? 'No plot available.'),
            SizedBox(height: 10),
            Text(
              "⭐ IMDb: ${movie['imdbRating']}",
              style: TextStyle(color: Colors.amber, fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("🎬 Movie Search App"),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              textInputAction: TextInputAction.search,
              decoration: InputDecoration(
                hintText: "Enter movie name...",
                filled: true,
                fillColor: Colors.white10,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                suffixIcon: IconButton(
                  icon: Icon(Icons.search, color: Colors.deepPurpleAccent),
                  onPressed: () {
                    if (_controller.text.isNotEmpty) {
                      fetchMovie(_controller.text.trim());
                    }
                  },
                ),
              ),
              style: TextStyle(color: Colors.white),
              onSubmitted: (value) {
                if (value.isNotEmpty) {
                  fetchMovie(value.trim());
                }
              },
            ),
            SizedBox(height: 20),
            if (_isLoading)
              CircularProgressIndicator(color: Colors.deepPurpleAccent),
            if (_error != null)
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text(
                  _error!,
                  style: TextStyle(color: Colors.redAccent, fontSize: 16),
                  textAlign: TextAlign.center,
                ),
              ),
            if (_movieData != null)
              Expanded(
                child: SingleChildScrollView(
                  child: movieCard(_movieData!),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
