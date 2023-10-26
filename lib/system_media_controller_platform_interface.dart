import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'system_media_controller_method_channel.dart';

abstract class SystemMediaControllerPlatform extends PlatformInterface {
  /// Constructs a SystemMediaControllerPlatform.
  SystemMediaControllerPlatform() : super(token: _token);

  static final Object _token = Object();

  static SystemMediaControllerPlatform _instance =
      MethodChannelSystemMediaController();

  /// The default instance of [SystemMediaControllerPlatform] to use.
  ///
  /// Defaults to [MethodChannelSystemMediaController].
  static SystemMediaControllerPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [SystemMediaControllerPlatform] when
  /// they register themselves.
  static set instance(SystemMediaControllerPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<bool> play() {
    throw UnimplementedError('play() has not been implemented.');
  }

  Future<bool> pause() {
    throw UnimplementedError('pause() has not been implemented.');
  }

  Future<bool> skipNext() {
    throw UnimplementedError('skipNext() has not been implemented.');
  }

  Future<bool> skipPrevious() {
    throw UnimplementedError('skipPrevious() has not been implemented.');
  }

  Future<bool> fastForward() {
    throw UnimplementedError('fastForward() has not been implemented.');
  }

  Future<bool> rewind() {
    throw UnimplementedError('rewind() has not been implemented.');
  }
}
