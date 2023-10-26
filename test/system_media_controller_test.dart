import 'package:flutter_test/flutter_test.dart';
import 'package:system_media_controller/system_media_controller.dart';
import 'package:system_media_controller/system_media_controller_platform_interface.dart';
import 'package:system_media_controller/system_media_controller_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockSystemMediaControllerPlatform
    with MockPlatformInterfaceMixin
    implements SystemMediaControllerPlatform {
  @override
  Future<bool> pause() async => true;

  @override
  Future<bool> play() async => true;

  @override
  Future<bool> skipNext() async => true;

  @override
  Future<bool> skipPrevious() async => true;

  @override
  Future<bool> fastForward() async => true;

  @override
  Future<bool> rewind() async => true;
}

void main() {
  final SystemMediaControllerPlatform initialPlatform =
      SystemMediaControllerPlatform.instance;

  test('$MethodChannelSystemMediaController is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelSystemMediaController>());
  });

  test('play', () async {
    SystemMediaController systemMediaControllerPlugin = SystemMediaController();
    MockSystemMediaControllerPlatform fakePlatform =
        MockSystemMediaControllerPlatform();
    SystemMediaControllerPlatform.instance = fakePlatform;

    expect(await systemMediaControllerPlugin.play(), true);
  });
  test('pause', () async {
    SystemMediaController systemMediaControllerPlugin = SystemMediaController();
    MockSystemMediaControllerPlatform fakePlatform =
        MockSystemMediaControllerPlatform();
    SystemMediaControllerPlatform.instance = fakePlatform;

    expect(await systemMediaControllerPlugin.pause(), true);
  });
  test('skipNext', () async {
    SystemMediaController systemMediaControllerPlugin = SystemMediaController();
    MockSystemMediaControllerPlatform fakePlatform =
        MockSystemMediaControllerPlatform();
    SystemMediaControllerPlatform.instance = fakePlatform;

    expect(await systemMediaControllerPlugin.skipNext(), true);
  });
  test('skipPrevious', () async {
    SystemMediaController systemMediaControllerPlugin = SystemMediaController();
    MockSystemMediaControllerPlatform fakePlatform =
        MockSystemMediaControllerPlatform();
    SystemMediaControllerPlatform.instance = fakePlatform;

    expect(await systemMediaControllerPlugin.skipPrevious(), true);
  });
}
