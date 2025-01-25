import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final AudioPlayer _audioPlayer =
        AudioPlayer(); // Ensure initialization inside the widget

    return Scaffold(
      appBar: AppBar(
        title: Text('Your Guardian'),
        backgroundColor: Colors.red,
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            // Play the alert sound
            try {
              await _audioPlayer.play(AssetSource('assets/alert.mp3'));
            } catch (e) {
              print("Error playing audio: $e");
            }

            // Show a dialog when the Panic Button is pressed
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: Text('Panic Alert'),
                  content: Text('You pressed the Panic Button!'),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop(); // Close the dialog
                      },
                      child: Text('OK'),
                    ),
                  ],
                );
              },
            );
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.red,
            padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
          ),
          child: Text(
            'Panic Button',
            style: TextStyle(fontSize: 20, color: Colors.white),
          ),
        ),
      ),
    );
  }
}
