import 'dart:async';
import 'package:flutter/material.dart';
import 'package:system_media_controller/system_media_controller.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _systemMediaControllerPlugin = SystemMediaController();

  Future<bool> _play() => _systemMediaControllerPlugin.play();
  Future<bool> _pause() => _systemMediaControllerPlugin.pause();
  Future<bool> _skipNext() => _systemMediaControllerPlugin.skipNext();
  Future<bool> _skipPrevious() => _systemMediaControllerPlugin.skipPrevious();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('System Media Controller Example App'),
        ),
        body: Center(
          child: ButtonBar(
            alignment: MainAxisAlignment.center,
            children: [
              IconButton(
                onPressed: _play,
                icon: const Icon(Icons.play_arrow),
              ),
              IconButton(
                onPressed: _pause,
                icon: const Icon(Icons.pause),
              ),
              IconButton(
                onPressed: _skipNext,
                icon: const Icon(Icons.skip_next),
              ),
              IconButton(
                onPressed: _skipPrevious,
                icon: const Icon(Icons.skip_previous),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
