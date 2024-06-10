import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:frontend/config/models/track_model.dart';
import 'package:frontend/config/helpers/getData.dart';
import 'package:frontend/presentation/providers/theme_provider.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  static const String name = 'HomeScreen';

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  List<Track> _tracks = [];
  bool _isLoading = false;
  final getData = GetData();
  final _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _getTracks();
  }

  void _clearSearch() {
    _searchController.clear();
    _getTracks();
  }


  Future<void> _getTracks() async {
    setState(() {
      _isLoading = true;
    });
    try {
      final tracks = await getData.getTracks();
      setState(() {
        _tracks = tracks;
        _isLoading = false;
      });
    } catch (e) {
      print(e);
      setState(() {
        _isLoading = false;
      });
    }
  }

  Future<void> _getTrack() async {
    setState(() {
      _isLoading = true;
    });
    try {
      final track = await getData.getTrack(context, _searchController);
      setState(() {
        _tracks.clear();
        _tracks.add(track);
        _isLoading = false;
      });
    } catch (e) {
      print(e);
      setState(() {
        _isLoading = false;
      });
    }
  }


  @override
  Widget build(BuildContext context) {
    final theme = ref.watch(themeNotifierProvider).themeData;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            context.go('/');
          },
        ),
        title: Row(
          children: [
            Text(
              'Playlist',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            Expanded(
              child: Center(
                child: SizedBox(
                  width: 200, // ajusta el ancho del TextField
                  child: TextField(
                    controller: _searchController,
                    decoration: InputDecoration(
                      hintText: 'Buscar',
                      border: OutlineInputBorder(),
                      filled: true,
                      fillColor: theme.appBarTheme.backgroundColor,
                      contentPadding: EdgeInsets.symmetric(vertical: 4.0, horizontal: 10.0),
                    ),
                    onSubmitted: (query) => _getTrack(),
                  ),
                ),
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {
              _clearSearch();
            },
            icon: Icon(Icons.clear),
          ),
          IconButton(
            onPressed: () {
              ref.read(themeNotifierProvider.notifier).toggleDarkMode();
            },
            icon: Icon(ref.watch(themeNotifierProvider).isDarkMode? Icons.dark_mode : Icons.light_mode),
          ),
        ],
        backgroundColor: theme.appBarTheme.backgroundColor,
        titleTextStyle: theme.appBarTheme.titleTextStyle,
        iconTheme: theme.appBarTheme.iconTheme,
      ),
      backgroundColor: theme.scaffoldBackgroundColor,
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
        itemCount: _tracks.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: Container(
              width: 50.0,
              height: 50.0,
              decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(_tracks[index].img),
                ),
              ),
            ),
            title: Text(
              _tracks[index].title,
              style: TextStyle(color: theme.primaryColor),
            ),
            subtitle: Text(
              _tracks[index].artist,
              style: TextStyle(color: theme.primaryColor.withOpacity(0.7)),
            ),
            onTap: () {
              context.go('/song');
            },
          );
        },
      ),
    );
  }
}
