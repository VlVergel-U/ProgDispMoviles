import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

class Track {
  final String title;
  final String img;
  final String artist;

  Track({
    required this.title,
    required this.img,
    required this.artist,
  });
}
