package com.example.yourguardian // Replace with your package name

import android.media.MediaPlayer
import android.os.Bundle
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel

class MainActivity : FlutterActivity() {
    private val CHANNEL = "com.yourguardian/audio"
    private var mediaPlayer: MediaPlayer? = null

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL).setMethodCallHandler { call, result ->
            when (call.method) {
                "playAudio" -> {
                    if (mediaPlayer == null) {
                        mediaPlayer = MediaPlayer.create(this, R.raw.ringtone)
                        mediaPlayer?.setOnCompletionListener {
                            mediaPlayer?.release()
                            mediaPlayer = null
                        }
                    }
                    mediaPlayer?.start()
                    result.success("Audio started")
                }
                "stopAudio" -> {
                    mediaPlayer?.stop()
                    mediaPlayer?.release()
                    mediaPlayer = null
                    result.success("Audio stopped")
                }
                else -> result.notImplemented()
            }
        }
    }
}
