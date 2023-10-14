package com.lockedfile.system_media_controller

import androidx.annotation.NonNull

import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result

import android.content.Context
import android.media.AudioManager
import android.view.KeyEvent

/** SystemMediaControllerPlugin */
class SystemMediaControllerPlugin: FlutterPlugin, MethodCallHandler {
  /// The MethodChannel that will the communication between Flutter and native Android
  ///
  /// This local reference serves to register the plugin with the Flutter Engine and unregister it
  /// when the Flutter Engine is detached from the Activity
  private lateinit var channel : MethodChannel
  private lateinit var audioManager: AudioManager;
  private lateinit var context : Context;

  override fun onAttachedToEngine(flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
    channel = MethodChannel(flutterPluginBinding.binaryMessenger, "system_media_controller")
    context = flutterPluginBinding.applicationContext;
    audioManager = context.getSystemService(Context.AUDIO_SERVICE) as AudioManager
    channel.setMethodCallHandler(this)
  }

  override fun onMethodCall(call: MethodCall, result: Result) {
    if(call.method == "pause") {
      sendMediaButton(KeyEvent.KEYCODE_MEDIA_PAUSE)
      result.success("Success");
    }
    else if (call.method == "play") {
      sendMediaButton(KeyEvent.KEYCODE_MEDIA_PLAY)
      result.success("Success");
    }
    else if (call.method == "skipNext") {
      sendMediaButton(KeyEvent.KEYCODE_MEDIA_NEXT)
      result.success("Success");
    }
    else if (call.method == "skipPrevious") {
      sendMediaButton(KeyEvent.KEYCODE_MEDIA_PREVIOUS)
      result.success("Success");
    } else {
      result.notImplemented();
    }
  }
  private fun sendMediaButton(keyCode: Int) {
    var keyEvent = KeyEvent(KeyEvent.ACTION_DOWN, keyCode)
    audioManager!!.dispatchMediaKeyEvent(keyEvent)

    keyEvent = KeyEvent(KeyEvent.ACTION_UP, keyCode)
    audioManager!!.dispatchMediaKeyEvent(keyEvent)
  }

  override fun onDetachedFromEngine(binding: FlutterPlugin.FlutterPluginBinding) {
    channel.setMethodCallHandler(null)
  }
}
