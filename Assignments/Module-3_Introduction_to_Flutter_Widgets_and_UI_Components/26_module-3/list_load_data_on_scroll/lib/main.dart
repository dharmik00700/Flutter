import 'package:flutter/material.dart';

void main() => runApp(InfiniteScrollApp());

class InfiniteScrollApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Infinite Scroll',
      home: InfiniteScrollScreen(),
    );
  }
}

class InfiniteScrollScreen extends StatefulWidget {
  @override
  _InfiniteScrollScreenState createState() => _InfiniteScrollScreenState();
}

class _InfiniteScrollScreenState extends State<InfiniteScrollScreen> {
  final ScrollController _scrollController = ScrollController();
  final List<int> _items = List.generate(20, (index) => index);
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  void _onScroll() {
    if (_scrollController.position.pixels >=
        _scrollController.position.maxScrollExtent - 200 &&
        !_isLoading) {
      _loadMoreItems();
    }
  }

  Future<void> _loadMoreItems() async {
    setState(() => _isLoading = true);

    // Simulate network delay
    await Future.delayed(Duration(seconds: 2));

    final nextItems =
    List.generate(20, (index) => _items.length + index);

    setState(() {
      _items.addAll(nextItems);
      _isLoading = false;
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  Widget _buildItem(int index) {
    return ListTile(
      title: Text('Item ${_items[index]}'),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Infinite Scroll')),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              controller: _scrollController,
              itemCount: _items.length + (_isLoading ? 1 : 0),
              itemBuilder: (context, index) {
                if (index < _items.length) {
                  return _buildItem(index);
                } else {
                  return Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Center(child: CircularProgressIndicator()),
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}