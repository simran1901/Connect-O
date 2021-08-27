// import 'package:flutter/material.dart';
// import '../models/chat_model.dart';
// import '../screens/home_screen.dart';
// import '../widgets/button_card.dart';

// class LoginScreen extends StatefulWidget {
//   const LoginScreen({Key? key}) : super(key: key);

//   @override
//   _LoginScreenState createState() => _LoginScreenState();
// }

// class _LoginScreenState extends State<LoginScreen> {
//   late ChatModel sourceChat;
//   List<ChatModel> chatModels = [
//     ChatModel(
//       name: 'Simran',
//       isGroup: false,
//       currentMessage: 'Hello Simran',
//       time: '4:00',
//       icon: '',
//       id: 1,
//     ),
//     ChatModel(
//       name: 'Harsh',
//       isGroup: false,
//       currentMessage: 'Hello Harsh',
//       time: '8:00',
//       icon: '',
//       id: 2,
//     ),
//   ];
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: ListView.builder(
//         itemCount: chatModels.length,
//         itemBuilder: (ctx, index) => InkWell(
//           onTap: () {
//             sourceChat = chatModels.removeAt(index);
//             Navigator.of(context).pushReplacement(
//               MaterialPageRoute(
//                   builder: (context) => HomeScreen(chatModels: chatModels, sourceChat: sourceChat)),
//             );
//           },
//           child: ButtonCard(
//             name: chatModels[index].name,
//             icon: Icons.person,
//           ),
//         ),
//       ),
//     );
//   }
// }
