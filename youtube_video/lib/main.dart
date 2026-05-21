import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: HomeScreen());
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final url = TextEditingController();
  late final count = TextEditingController();

  YoutubePlayerController? youtubePlayerController;

  void loadVideo() {
    String urlvideo = url.text.trim();

    String? videoId = YoutubePlayer.convertUrlToId(urlvideo);

    if (videoId == null) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Invalid YouTube URL')));
      return;
    }

    youtubePlayerController = YoutubePlayerController(
      initialVideoId: videoId,

      flags: const YoutubePlayerFlags(
        autoPlay: true,
        mute: true,
        forceHD: false,
        showLiveFullscreenButton: true,
        controlsVisibleAtStart: false,
      ),
    );

    setState(() {});
  }

  @override
  void dispose() {
    youtubePlayerController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Youtube',
          style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.white70,
        // flexibleSpace: Container(
        //   height: 200,
        //   color: Colors.blueAccent,
        //   child: TextField(
        //     controller: url,
        //     decoration: InputDecoration(
        //       hintText: 'Enter Url...',
        //       border: OutlineInputBorder(
        //         borderRadius: BorderRadius.circular(21),
        //         borderSide: BorderSide(color: Colors.black, width: 2),
        //       ),
        //       enabledBorder: OutlineInputBorder(
        //         borderRadius: BorderRadius.circular(21),
        //         borderSide: BorderSide(color: Colors.black, width: 2),
        //       ),
        //       focusedBorder: OutlineInputBorder(
        //         borderRadius: BorderRadius.circular(21),
        //         borderSide: BorderSide(color: Colors.black, width: 2),
        //       ),
        //     ),
        //   ),
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: url,
              decoration: const InputDecoration(
                labelText: 'Enter YouTube Video URL',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.link),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                keyboardType: TextInputType.number,
                controller: count,
                decoration: const InputDecoration(
                  labelText: 'Enter YouTube Video URL',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.link),
                ),
              ),
            ),

            const SizedBox(height: 15),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: loadVideo,
                child: const Text('Play Video'),
              ),
            ),
            const SizedBox(height: 20),

            // ===============================
            // STEP 5: YouTube Player Widget
            // ===============================
            if (youtubePlayerController != null)
              Container(height: 600,width: double.infinity,
                child: GridView.builder(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                  ),
                  itemBuilder: (context, index) {
                    return Container(
                      width: 200,
                      height: 200,
                      child: YoutubePlayer(
                        controller: youtubePlayerController!,
                        showVideoProgressIndicator: true,
                        progressIndicatorColor: Colors.red,
                      ),
                    );
                  },itemCount: int.parse(count.text),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
