import 'system_media_controller_platform_interface.dart';

class SystemMediaController {
  Future<bool> play() {
    return SystemMediaControllerPlatform.instance.play();
  }

  Future<bool> pause() {
    return SystemMediaControllerPlatform.instance.pause();
  }

  Future<bool> skipNext() {
    return SystemMediaControllerPlatform.instance.skipNext();
  }

  Future<bool> skipPrevious() {
    return SystemMediaControllerPlatform.instance.skipPrevious();
  }
}
