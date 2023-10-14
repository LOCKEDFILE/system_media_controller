import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:system_media_controller/system_media_controller_method_channel.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  MethodChannelSystemMediaController platform =
      MethodChannelSystemMediaController();
  const MethodChannel channel = MethodChannel('system_media_controller');

  setUp(() {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(
      channel,
      (MethodCall methodCall) async {
        return '42';
      },
    );
  });

  tearDown(() {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(channel, null);
  });

  test('play', () async {
    expect(platform.play(), true);
  });
  test('pause', () async {
    expect(platform.pause(), true);
  });

  test('skipNext', () async {
    expect(platform.skipNext(), true);
  });

  test('skipPrevious', () async {
    expect(platform.skipPrevious(), true);
  });
}
