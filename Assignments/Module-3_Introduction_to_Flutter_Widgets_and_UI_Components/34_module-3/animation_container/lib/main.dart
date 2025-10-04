import 'package:flutter/material.dart';

void main() => runApp(AnimatedSectionApp());

class AnimatedSectionApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ExpandableSection(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class ExpandableSection extends StatefulWidget {
  @override
  _ExpandableSectionState createState() => _ExpandableSectionState();
}

class _ExpandableSectionState extends State<ExpandableSection> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('AnimatedContainer Demo'),backgroundColor: Color.fromARGB(
          255, 236, 211, 166),),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () => setState(() => _isExpanded = !_isExpanded),
              child: Text(_isExpanded ? 'Collapse' : 'Expand'),
            ),
            SizedBox(height: 20),
            AnimatedContainer(
              duration: Duration(milliseconds: 500),
              curve: Curves.easeInOut,
              width: _isExpanded ? 300 : 0,
              height: _isExpanded ? 150 : 0,
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.blue[100],
                borderRadius: BorderRadius.circular(12),
              ),
              child: _isExpanded
                  ? Text(
                      'Here is the expanded content. You can put anything here!',
                      style: TextStyle(fontSize: 16),
                    )
                  : null,
            ),
          ],
        ),
      ),
    );
  }
}
