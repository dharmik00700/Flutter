import 'package:flutter/material.dart';

class RichtextWidget extends StatefulWidget {
  const RichtextWidget({super.key});

  @override
  State<RichtextWidget> createState() => _RichtextWidgetState();
}

class _RichtextWidgetState extends State<RichtextWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Rich Widgets'),
        backgroundColor: Colors.cyanAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            RichText(
              text: TextSpan(
                text: 'hello',
                style: TextStyle(color: Colors.lightGreenAccent, fontSize: 16),
                children: [
                  TextSpan(
                    text: 'flutter',
                    style: TextStyle(color: Colors.black, fontSize: 16),
                  ),
                  TextSpan(
                    text: 'flutter',
                    style: TextStyle(color: Colors.greenAccent, fontSize: 16),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black, width: 2),
                ),
                child: ListView(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  children: [
                    Text('Input Code :-'),
                    SingleChildScrollView(
                      child: Text('''
                    return Scaffold(
      appBar: AppBar(title: Text('Rich Widgets')),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            RichText(
              text: TextSpan(
                text: 'hello',
                style: TextStyle(color: Colors.lightGreenAccent, fontSize: 16),
                children: [
                  TextSpan(
                    text: 'flutter',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                    ),
                  ),
                  TextSpan(
                    text: 'flutter',
                    style: TextStyle(
                      color: Colors.greenAccent,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
                    '''),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 10),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: ListView(
                  children: [
                    Text('queastions :-'),
                    Text(
                      '''
              1. What is RichText widget?
              RichText displays text with multiple different styles within a single widget using TextSpan and WidgetSpan objects.
              
              2. How to create basic RichText?
              ```dart RichText( text: TextSpan( text: 'Hello ', style: TextStyle(color: Colors.black), children: [ TextSpan( text: 'Flutter', style: TextStyle(fontWeight: FontWeight.bold), ), ], ), ) ```
              
              3. How to add different text styles?
              ```dart RichText( text: TextSpan( style: TextStyle(color: Colors.black, fontSize: 16), children: [ TextSpan(text: 'Normal '), TextSpan( text: 'Bold', style: TextStyle(fontWeight: FontWeight.bold), ), TextSpan( text: ' Italic', style: TextStyle(fontStyle: FontStyle.italic), ), ], ), ) ```
              
              4. How to embed widgets in text?
              ```dart RichText( text: TextSpan( children: [ TextSpan(text: 'Click '), WidgetSpan( child: Icon(Icons.favorite, color: Colors.red), ), TextSpan(text: ' to like'), ], ), ) ```
              
              5. How to make text clickable?
              ```dart RichText( text: TextSpan( children: [ TextSpan(text: 'Visit '), WidgetSpan( child: GestureDetector( onTap: () => print('Link clicked'), child: Text( 'Flutter.dev', style: TextStyle( color: Colors.blue, decoration: TextDecoration.underline, ), ), ), ), ], ), ) ```
              
              6. How to control text alignment?
              ```dart RichText( textAlign: TextAlign.center, text: TextSpan( text: 'Centered rich text', style: TextStyle(color: Colors.black), ), ) ```
              
              7. What's the difference from Text widget?
              - Text: Single style for entire text - RichText: Multiple styles within same text - RichText allows embedded widgets - Text is simpler for uniform styling
              
              8. How to handle text overflow?
              ```dart RichText( overflow: TextOverflow.ellipsis, maxLines: 2, text: TextSpan( text: 'Very long text that might overflow...', style: TextStyle(color: Colors.black), ), ) ```
              
              9. Common use cases?
              - Terms and conditions with links - Chat messages with mentions - Code syntax highlighting - Mathematical expressions - Text with embedded icons or buttons
              
              10. Performance considerations?
              - RichText is more expensive than Text - Use Text widget for simple, uniform text - Avoid deeply nested TextSpan structures - Consider caching complex RichText widgets - Use const constructors when possible''',
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
