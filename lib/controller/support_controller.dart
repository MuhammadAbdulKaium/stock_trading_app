import 'package:flutter_sound/public/flutter_sound_recorder.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:stock_trading_app/models/chat_model.dart';

class SupportController extends GetxController {
  var isLoading = false.obs;

  var messages = <ChatModel>[].obs;
  var isRecording = false.obs;

  FlutterSoundRecorder recorder = FlutterSoundRecorder();
  final ImagePicker picker = ImagePicker();

  Future<void> initRecorder() async {
    var status = await Permission.microphone.request();
    if (status != PermissionStatus.granted) {
      throw Exception('Microphone permission not granted');
    }
    await recorder.openRecorder();
  }

  void sendTextMessage(String text) {
    messages.add(ChatModel(content: text, type: MessageType.text));
  }

  void sendAudioMessage(String path) {
    messages.add(ChatModel(content: path, type: MessageType.audio));
  }

  void sendImageMessage(String path) {
    messages.add(ChatModel(content: path, type: MessageType.image));
  }

  @override
  void onInit() {
    super.onInit();
    initRecorder();
  }

  @override
  void onClose() {
    recorder.closeRecorder();
    super.onClose();
  }
}