import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:stock_trading_app/controller/support_controller.dart';
import 'package:stock_trading_app/models/chat_model.dart';

class Chat extends StatelessWidget {
  const Chat({super.key});

  @override
  Widget build(BuildContext context) {
    final SupportController supportController = Get.find<SupportController>();

    return Column(
      children: [
        Expanded(
          child: Obx(() => ListView.builder(
            itemCount: supportController.messages.length,
            itemBuilder: (context, index) {
              final message = supportController.messages[index];
              if (message.type == MessageType.text) {
                return ListTile(title: Text(message.content));
              } else if (message.type == MessageType.audio) {
                return ListTile(
                  title: const Text('Audio Message'),
                  subtitle: Text(message.content),
                );
              } else if (message.type == MessageType.image) {
                return ListTile(
                  title: Image.file(File(message.content)),
                );
              }
              return Container();
            },
          )),
        ),
        _buildInputBar(),
      ],
    );
  }

  Widget _buildInputBar() {
    TextEditingController textController = TextEditingController();
    final SupportController supportController = Get.find<SupportController>();
    // final FlutterSoundRecorder recorder = FlutterSoundRecorder();
    // final ImagePicker picker = ImagePicker();
    
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          IconButton(
            icon: const Icon(Icons.image),
            onPressed: () async {
              final XFile? image = await ImagePicker().pickImage(source: ImageSource.gallery);
              if (image != null) {
                supportController.sendImageMessage(image.path);
              }
            },
          ),
          Expanded(
            child: TextField(
              controller: textController,
              decoration: const InputDecoration(hintText: 'Type a message...'),
            ),
          ),
          IconButton(
            icon: const Icon(Icons.send),
            onPressed: () {
              if (textController.text.isNotEmpty) {
                supportController.sendTextMessage(textController.text);
                textController.clear();
              }
            },
          ),
          GestureDetector(
            onTapDown: (_) async {
              supportController.isRecording.value = true;
              await supportController.recorder.startRecorder(toFile: 'audioMessage.aac');
            },
            onTapUp: (_) async {
              supportController.isRecording.value = false;
              String? path = await supportController.recorder.stopRecorder();
              if (path != null) {
                supportController.sendAudioMessage(path);
              }
            },
            child: Obx(() => Icon(
              supportController.isRecording.value ? Icons.mic : Icons.mic_none,
              color: supportController.isRecording.value ? Colors.red : Colors.grey,
            )),
          ),
        ],
      ),
    );
  }
}