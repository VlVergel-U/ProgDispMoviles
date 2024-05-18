import 'package:flutter/material.dart';

class MenuSongs {
  final String title;
  final String artist;
  final String albumImageUrl;

 const MenuSongs(
      {required this.title, required this.artist, required this.albumImageUrl});
}
  const appMenuSongs = <MenuSongs>[
    MenuSongs(
      title: 'Someone like you',
      artist: 'Adele',
      albumImageUrl: 'https://i.scdn.co/image/ab67616d0000b2732118bf9b198b05a95ded6300',
    ),
    MenuSongs(
      title: 'Mockingbird',
      artist: 'Eminem',
      albumImageUrl: 'https://upload.wikimedia.org/wikipedia/en/f/fc/Mockingbird_%28Eminem_song%29_cover.jpg',
    ),
    MenuSongs(
      title: 'Save Your Tears',
      artist: 'The weeknd',
      albumImageUrl: 'https://i.scdn.co/image/ab67616d00001e02b5097b81179824803664aaaf',
    ),
    MenuSongs(
      title: 'Never say never',
      artist: 'Justin Bieber, Jaden',
      albumImageUrl: 'https://upload.wikimedia.org/wikipedia/en/e/ea/Never_Say_Never_Single.jpg',
    ),
    MenuSongs(
      title: 'Snow On The Beach(feat. Lana Del Rey)',
      artist: 'Taylor Switf, Lana Del Rey',
      albumImageUrl: 'https://upload.wikimedia.org/wikipedia/en/9/9f/Midnights_-_Taylor_Swift.png',
    ),
    MenuSongs(
      title: 'Blender',
      artist: '5sos',
      albumImageUrl: 'https://i.scdn.co/image/ab67616d0000b2731a4362b6e7356ce720fef86d',
    ),
    MenuSongs(
      title: 'When I Was Your Man',
      artist: 'Bruno Mars',
      albumImageUrl: 'https://upload.wikimedia.org/wikipedia/en/thumb/6/62/Bruno-mars-when-i-was-your-man.jpg/220px-Bruno-mars-when-i-was-your-man.jpg',
    ),
    MenuSongs(
      title: 'Angels Like You',
      artist: 'Miley Cyrus',
      albumImageUrl: 'https://i.scdn.co/image/ab67616d0000b2738cffb7c6c40759eaf8a5a142',
    ),
    MenuSongs(
      title: 'Skyfall',
      artist: 'Adele',
      albumImageUrl: 'https://i.scdn.co/image/ab67616d0000b2732737be35cc5245eef495be90',
    ),
    MenuSongs(
      title: 'Love On The Brain',
      artist: 'Rihanna',
      albumImageUrl: 'https://i.scdn.co/image/ab67616d0000b27333c6b920eabcf4c00d7a1093',
    ),
    MenuSongs(
      title: 'bad idea right?',
      artist: 'Olivia Rodrigo',
      albumImageUrl: 'https://upload.wikimedia.org/wikipedia/en/0/03/Olivia_Rodrigo_-_Guts.png',
    ),
    MenuSongs(
      title: 'Yellow',
      artist: 'Coldplay',
      albumImageUrl: 'https://i.scdn.co/image/ab67616d0000b2733d92b2ad5af9fbc8637425f0',
    ),
  ];