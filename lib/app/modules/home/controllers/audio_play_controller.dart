import 'package:audioplayers/audioplayers.dart';
import 'package:get/get.dart';

class AudioController extends GetxController {
  // Map to store players for different audio assets
  final Map<String, AudioPlayer> _players = {};

  // To track if the audio is playing
  final Map<String, bool> isPlaying = {};

  // Play a specific sound without affecting others
  Future<void> playAudio(String assetPath, {bool loop = false}) async {
    try {
      if (!_players.containsKey(assetPath)) {
        _players[assetPath] = AudioPlayer(); // Create a new player for each sound
      }

      var player = _players[assetPath]!;

      // Set the release mode to loop if needed
      await player.setReleaseMode(loop ? ReleaseMode.loop : ReleaseMode.stop);

      // Play the sound
      await player.play(AssetSource(assetPath));

      // Update isPlaying status
      isPlaying[assetPath] = true;

      print("✅ Playing: $assetPath (Loop: $loop)");
    } catch (e) {
      print("❌ Error playing audio: $e");
    }
  }

  // Stop a specific audio without affecting others
  Future<void> stopAudio(String assetPath) async {
    try {
      if (_players.containsKey(assetPath)) {
        await _players[assetPath]!.stop();
        isPlaying[assetPath] = false;
        print("✅ Stopped: $assetPath");
      }
    } catch (e) {
      print("❌ Error stopping audio: $e");
    }
  }

  //stop all audio
  Future<void> stopAllAudio() async {
    try {
      _players.forEach((key, player) async {
        await player.stop();
        isPlaying[key] = false;
        print("✅ Stopped: $key");
      });
    } catch (e) {
      print("❌ Error stopping audio: $e");
    }
  }

  @override
  void onClose() {
    // Dispose all players when the controller is closed
    _players.forEach((key, player) {
      player.dispose();
    });
    super.onClose();
  }
}
