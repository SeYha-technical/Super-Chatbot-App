
import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:chat_bot/helper/global.dart';
import 'package:http/http.dart';
class apiService {
  static Future <String> getMessage(String question) async {
    try {
      final response = await post(
        Uri.parse('https://api.openai.com/v1/chat/completions'),
        headers: {
          HttpHeaders.contentTypeHeader: 'application/json',
          HttpHeaders.authorizationHeader: 'Bearer $apiKey'
        },
        body: jsonEncode({
          "model": "gpt-5",
          "max_completion_tokens":2000,
          "temperature": 1,
          "messages": [
            {"role": "user", "content": question},
          ],
        }),
      );
      final data = jsonDecode(response.body);
      //log('response: $data');
      String content = data['choices'][0]['message']['content'];
      log('this show contents only: $content');
      return content;

    } catch(e){
      log('getAnswerGptE: $e');
      return 'Something went wrong (Try again in sometime)';
    }
  }
}
