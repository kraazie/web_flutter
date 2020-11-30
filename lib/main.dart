import 'package:flutter/services.dart';
import 'package:video_player/video_player.dart';
import 'package:flutter/material.dart';
import 'model/iptv.dart';

void main() => runApp(VideoApp());

class VideoApp extends StatefulWidget {
  @override
  _VideoAppState createState() => _VideoAppState();
}

class _VideoAppState extends State<VideoApp> {
  VideoPlayerController _controller;
  List<Iptv> listIPTV = [];

  final TextEditingController _filter = new TextEditingController();
  String _searchText = "";
  List<Iptv> filteredIPTV = [];
  Icon _searchIcon = new Icon(Icons.search);
  Widget _appBarTitle = new Text('Search Channel');

  Future<String> getJsonString(String path) {
    return rootBundle
        .loadString(path)
        .catchError((err) => print("CatchError: $err"));
  }

  _VideoAppState() {
    _filter.addListener(() {
      if (_filter.text.isEmpty) {
        setState(() {
          _searchText = "";
          filteredIPTV = listIPTV;
        });
      } else {
        setState(() {
          _searchText = _filter.text;
        });
      }
    });
  }

  @override
  void initState() {
    super.initState();

    getChannelList();

    _controller = VideoPlayerController.network(
        'https://32x2cn7zz29m47vnqt4z-kyz6hw.p5cdn.com/abr_PSLME/zxcv/PSLME/zxcv_720p/chunks.m3u8')
      ..initialize().then((_) {
        // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
        setState(() {});
      });
  }

  Future<void> getChannelList() async {
    final jsonString = await getJsonString('assets/mockup/iptv.json');

    setState(() {
      listIPTV = iptvFromJson(jsonString);
      filteredIPTV = listIPTV;
      print('Channel Count: ${listIPTV.length}');
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      title: 'Video Demo',
      home: Scaffold(
        appBar: AppBar(
          title: _appBarTitle,
          leading: new IconButton(
            icon: _searchIcon,
            onPressed: _searchPressed,
          ),
        ),
        body: Row(
          children: [
            Container(
              width: 300,
              color: Colors.black12,
              child: buildListView(context),
            ),
            Expanded(
              child: Container(
                // color: Colors.red,
                child: AspectRatio(
                  aspectRatio: _controller.value.aspectRatio,
                  child: VideoPlayer(_controller),
                ),
              ),
            )
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState(() {
              _controller.value.isPlaying
                  ? _controller.pause()
                  : _controller.play();
            });
          },
          child: Icon(
            _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
          ),
        ),
      ),
    );
  }

  Widget buildListView(BuildContext context) {
    if (_searchText.isNotEmpty) {
      filteredIPTV = [];
      filteredIPTV = listIPTV
          .where(
              (e) => e.name.toLowerCase().contains(_searchText.toLowerCase()))
          .toList();
      print("List Count : ${filteredIPTV.length}");
    }

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView.builder(
        itemCount: listIPTV.length == 0 ? 0 : filteredIPTV.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              title: Text('${filteredIPTV[index].name}'),
              onTap: () {
                print("Loading... : ${filteredIPTV[index].name}");

                try {
                  _controller =
                      VideoPlayerController.network(filteredIPTV[index].url)
                        ..initialize().then((_) {
                          setState(() {
                            print("Playing... : ${filteredIPTV[index].name}");
                            _controller.play();
                          });
                        });
                } catch (e) {
                  print("Caught Exception : $e");
                }
              },
            ),
          );
        },
        physics: BouncingScrollPhysics(),
        shrinkWrap: true,
      ),
    );
  }

  void _searchPressed() {
    setState(() {
      if (this._searchIcon.icon == Icons.search) {
        this._searchIcon = new Icon(Icons.close);
        this._appBarTitle = new TextField(
          keyboardType: TextInputType.text,
          autofocus: true,
          controller: _filter,
          decoration: new InputDecoration(
            contentPadding: EdgeInsets.zero,
            hintText: 'Search...',
            hintStyle: TextStyle(color: Colors.white70, fontSize: 18),
          ),
          style: TextStyle(color: Colors.white, fontSize: 18),
        );
      } else {
        this._searchIcon = new Icon(Icons.search);
        this._appBarTitle = new Text('Search Channel');
        filteredIPTV = listIPTV;
        _filter.clear();
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
}
