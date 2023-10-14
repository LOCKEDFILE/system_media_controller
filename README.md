# System Media Controller plugin
<?code-excerpt path-base="example/lib"?>

[![pub package](https://img.shields.io/badge/pub-v0.0.1-blue)](https://pub.dev/packages/system_media_controller)


System Media Control package is a Flutter package that allows you to control the media on the system. 
> currently available for Android only

# Usage

To use this plugin, add system_media_controller as a dependency in your pubspec.yaml file.


Examples:

you can control current system media.

~~~dart
final _systemMediaController = SystemMediaController();

_systemMediaController.play();
_systemMediaController.pause();
_systemMediaController.skipNext();
_systemMediaController.skipPrevious();
~~~



### With FCM

If you use FCM(`silent notification`) with another Platforms(`like Flutter Web`), you can control the media being played on mobile from the another platforms.

~~~dart
// example fcm 
Map silentNotification = {
    'message': {
        'data': {
            'action': 'play'
        }
    }
}

FirebaseMessaging.onBackgroundMessage((message){
    /// ...another code
    final String? action = message.data['action'];
    if(action == 'play'){
        _systemMediaController.play();
    }
});
~~~

