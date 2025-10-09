import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Feedback Form',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const FeedbackPage(),
    );
  }
}

class FeedbackPage extends StatefulWidget {
  const FeedbackPage({super.key});

  @override
  State<FeedbackPage> createState() => _FeedbackPageState();
}

class _FeedbackPageState extends State<FeedbackPage> {
  final _formKey = GlobalKey<FormState>();

  String? _selectedCategory;
  bool _likedUI = false;
  bool _likedPerformance = false;
  bool _likedFeatures = false;
  final TextEditingController _commentsController = TextEditingController();

  @override
  void dispose() {
    _commentsController.dispose();
    super.dispose();
  }

  void _submitFeedback() {
    if (_formKey.currentState!.validate()) {
      String likedOptions = "";
      if (_likedUI) likedOptions += "UI, ";
      if (_likedPerformance) likedOptions += "Performance, ";
      if (_likedFeatures) likedOptions += "Features, ";
      if (likedOptions.isEmpty) likedOptions = "None";

      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text("Feedback Submitted!")));

      print("Category: $_selectedCategory");
      print("Liked: $likedOptions");
      print("Comments: ${_commentsController.text}");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Feedback Form",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              // Dropdown for Category
              DropdownButtonFormField<String>(
                decoration: const InputDecoration(
                  labelText: "Feedback Category",
                  border: OutlineInputBorder(),
                ),
                value: _selectedCategory,
                items: ["Bug Report", "Suggestion", "Other"]
                    .map(
                      (cat) => DropdownMenuItem(value: cat, child: Text(cat)),
                    )
                    .toList(),
                onChanged: (value) {
                  setState(() {
                    _selectedCategory = value;
                  });
                },
                validator: (value) =>
                    value == null ? "Please select a category" : null,
              ),
              const SizedBox(height: 20),

              const Text("What did you like?", style: TextStyle(fontSize: 16)),
              CheckboxListTile(
                title: const Text("UI"),
                value: _likedUI,
                onChanged: (val) {
                  setState(() => _likedUI = val!);
                },
              ),
              CheckboxListTile(
                title: const Text("Performance"),
                value: _likedPerformance,
                onChanged: (val) {
                  setState(() => _likedPerformance = val!);
                },
              ),
              CheckboxListTile(
                title: const Text("Features"),
                value: _likedFeatures,
                onChanged: (val) {
                  setState(() => _likedFeatures = val!);
                },
              ),
              const SizedBox(height: 20),

              TextFormField(
                controller: _commentsController,
                maxLines: 3,
                decoration: const InputDecoration(
                  labelText: "Comments",
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please write a comment";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 25),

              Center(
                child: ElevatedButton(
                  onPressed: _submitFeedback,
                  child: const Text("Submit"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
