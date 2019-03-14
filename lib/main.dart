import 'package:flutter/material.dart';
import 'package:android_intent/android_intent.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:flutter/cupertino.dart';

import 'package:video_player/video_player.dart';

import 'dart:io';

void main() => runApp(StreamerApp());

class StreamerApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Streamer',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(title: 'Streamer!'),
    );
  }
}

class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _counter = 0;
  WebViewController _controller;
  VideoPlayerController _vc_controller;

  void _playVideo({video_url}) async {
    if (Platform.isAndroid) {
      AndroidIntent intent = new AndroidIntent(
          action: 'action_view', data: video_url, type: 'video/*');
      await intent.launch();
    }
  }

  @override
  void initState() {
    super.initState();
    // _vc_controller = VideoPlayerController.network(
    //     'http://tvpremiumhd.club/lista-gratuita/212906/tv/live.php?id=2668')
    //   ..initialize().then((_) {
    //     // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
    //     setState(() {});
    //   });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListView(
        children: <Widget>[
          Divider(color: Colors.transparent),
          GestureDetector(
            child: ListTile(
              title: Text('link 1'),
              subtitle: Divider(),
            ),
            onTap: () {
              _playVideo(
                  video_url:
                      'http://tvpremiumhd.club/lista-gratuita/152907/tv/live.php?id=2278');
            },
          ),
          GestureDetector(
            child: ListTile(
              title: Text('link 2'),
              subtitle: Divider(),
            ),
            onTap: () {
              _playVideo(
                  video_url:
                      'http://tvpremiumhd.club/lista-gratuita/152907/tv/live.php?id=2498');
            },
          ),
          GestureDetector(
            child: ListTile(
              title: Text('link 3'),
              subtitle: Divider(),
            ),
            onTap: () {
              _playVideo(
                  video_url:
                      'http://tvpremiumhd.club/lista-gratuita/152907/tv/live.php?id=2760');
            },
          ),
          GestureDetector(
            child: ListTile(
              title: Text('link 4.'),
              subtitle: Divider(),
            ),
            onTap: () {
              _playVideo(
                  video_url:
                      'http://tvpremiumhd.club/lista-gratuita/152907/tv/live.php?id=2770');
            },
          ),
        ],
      ),
    );
  }
}

class WebViewPage extends StatefulWidget {
  WebViewPage({Key key, this.title, this.video_url}) : super(key: key);

  final String title;
  final String video_url;

  @override
  _WebViewPageState createState() => _WebViewPageState();
}

class _WebViewPageState extends State<WebViewPage> {
  WebViewController _controller;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: WebView(
        initialUrl: widget.video_url,
        javascriptMode: JavascriptMode.unrestricted,
        onWebViewCreated: (WebViewController webViewController) {
          _controller = webViewController;
        },
      ),
      // floatingActionButton: FloatingActionButton(
      //   child: Text('fe'),
      //   onPressed: () {
      //     _controller.loadUrl(
      //         'http://tvpremiumhd.club/lista-gratuita/212906/tv/live.php?id=2702');
      //     print('alpha');
      //   },
      // ),
    );
  }
}
