import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:parcial2/config/models/track_model.dart';
import 'package:parcial2/config/helpers/getData.dart';
import 'package:parcial2/presentation/providers/theme_provider.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  static const String name = 'HomeScreen';

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  List<Track> _tracks = [];
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _getTracks();
  }

  Future<void> _getTracks() async {
    setState(() {
      _isLoading = true;
    });
    try {
      final getData = GetData();
      final accessToken = await getData.getAccessToken();
      print('Access Token: $accessToken');
      final tracks = await getData.getTracks(accessToken);
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
        actions: [
          IconButton(
            onPressed: () {
              ref.read(themeNotifierProvider.notifier).toggleDarkMode();
            },
            icon: Icon(ref.watch(themeNotifierProvider).isDarkMode ? Icons.dark_mode : Icons.light_mode),
          ),
        ],
        backgroundColor: theme.appBarTheme.backgroundColor,
        titleTextStyle: theme.appBarTheme.titleTextStyle,
        iconTheme: theme.appBarTheme.iconTheme,
        title: const Text(
          'Playlist',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
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
