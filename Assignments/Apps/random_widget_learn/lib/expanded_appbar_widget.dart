import 'package:flutter/material.dart';

class ExpandedAppbarWidget extends StatefulWidget {
  const ExpandedAppbarWidget({super.key});

  @override
  State<ExpandedAppbarWidget> createState() => _ExpandedAppbarWidgetState();
}

class _ExpandedAppbarWidgetState extends State<ExpandedAppbarWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 200.0, // height when expanded
            floating: false,
            pinned: true, // keeps AppBar visible when collapsed
            flexibleSpace: FlexibleSpaceBar(
              title: const Text("Expanded AppBar"),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) => ListTile(title: Text("Item #$index")),
              childCount: 30, // number of list items
            ),
          ),
        ],
      ),
    );
  }
}
