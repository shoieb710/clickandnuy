import 'package:dash_chat_2/dash_chat_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gemini/flutter_gemini.dart';
import 'package:testt/core/constant/color1.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  // final openAi = OpenAI.instance.build(
  //     token: OPENAI_API_KET,
  //     baseOption: HttpSetup(receiveTimeout: Duration(seconds: 5)),
  //     enableLog: true,
      
  //     );
  final Gemini gemini =Gemini.instance;

  final ChatUser currentUser =
      ChatUser(id: "0", firstName: "User", );
  final ChatUser aI = ChatUser(id: "1", firstName: "Chat");
  List<ChatMessage> masseges = [];
  List<ChatUser> typingusers =[];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DashChat(
        typingUsers: typingusers,
          currentUser: currentUser,
          messageOptions: MessageOptions(
              currentUserContainerColor: ColorApp.logo,
              containerColor: const Color.fromARGB(255, 63, 63, 63),
              textColor: ColorApp.white),
          onSend: (ChatMessage m) {
            send(m);
          },
          messages: masseges),
    );
  }
void send(ChatMessage chatMessage){
  setState(() {
    masseges =[chatMessage, ...masseges];
     typingusers.add(aI);
  });
  try {
    String q =chatMessage.text;
  
    gemini.streamGenerateContent(q).listen((event){
      ChatMessage? lastm =masseges.firstOrNull;
      if (lastm != null && lastm.user == aI) {
        lastm =masseges.removeAt(0);
         String response =event.content?.parts?.fold("", (previous,current)=> "$previous ${current.text}") ??"";
        lastm.text +=response;
        setState(() {
          masseges= [lastm!,...masseges];
        });
      } else {
        String response =event.content?.parts?.fold("", (previous,current)=> "$previous ${current.text}") ??"";
        ChatMessage message =ChatMessage(user: aI, createdAt: DateTime.now(),text:response);
        setState(() {
          masseges =[message,...masseges];
        });
      }
    });   
  } catch (e) {
    // ignore: avoid_print
    print(e);
  }
     setState(() {
      typingusers.remove(aI);
    });
}

}



//   Future<void> getChatResponse(ChatMessage m) async {
//     setState(() {
//       masseges.insert(0, m);
//       typingusers.add(aI);
//     });
//     List<Messages> messahehistory = masseges.reversed.map((m){
//       if(m.user == currentUser){
//         return Messages(role: Role.user,content: m.text);
//       }else{
//         return Messages(role: Role.assistant,content: m.text);
//       }
//     }).toList();
//     List<Map<String, dynamic>> messageHistoryMaps = messahehistory.map((message) => message.toJson()).toList();
//     // ignore: unused_local_variable
//     final request=ChatCompleteText(model: GptTurbo0301ChatModel(), 
//     maxToken: 200,
//     messages: messageHistoryMaps);
//     final response = await openAi.onChatCompletion(request: request);
//     for (var element in response!.choices) {
//       if (element.message != null) {
//         setState(() {
//           masseges.insert(0, ChatMessage(user: aI, createdAt: DateTime.now(),text: element.message!.content),
          
//           );
//         });
//       } 
//     }
//     setState(() {
//       typingusers.remove(aI);
//     });
//   }
  
// }
