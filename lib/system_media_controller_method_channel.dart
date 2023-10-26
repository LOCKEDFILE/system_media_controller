import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'system_media_controller_platform_interface.dart';

/// An implementation of [SystemMediaControllerPlatform] that uses method channels.
class MethodChannelSystemMediaController extends SystemMediaControllerPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('system_media_controller');

  Future<bool> invokeMethod(String method) async {
    final response = await methodChannel.invokeMethod<String?>(method);
    return response == 'Success';
  }

  @override
  Future<bool> play() async => invokeMethod('play');

  @override
  Future<bool> pause() async => invokeMethod('pause');

  @override
  Future<bool> skipNext() async => invokeMethod('skipNext');

  @override
  Future<bool> skipPrevious() async => invokeMethod('skipPrevious');

  @override
  Future<bool> rewind() async => invokeMethod('rewind');

  @override
  Future<bool> fastForward() async => invokeMethod('fastForward');
}
