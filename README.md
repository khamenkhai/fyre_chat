# 🔥 FyreChat

**FyreChat** is a lightweight and scalable Firebase-based chat service for Flutter. It allows you to easily implement 1-on-1 and group messaging with full support for message replies, roles, message types (text, image, file, custom), and read receipts — all backed by Firebase Firestore.

Built with clean and extensible architecture, **FyreChat** can power a wide range of real-time chat features in your apps, whether you're building a messenger, team collaboration app, or customer support system.

---

## ✨ Features

- 🔐 Firebase Authentication integration
- 🧑‍🤝‍🧑 Direct & group chat room creation
- 💬 Send & receive messages (text, image, file, custom)
- 💬 Reply to messages
- 👁 Seen message tracking (`seenBy`)
- 🔄 Real-time updates via Firestore streams
- 🧹 Delete messages and rooms
- 🔧 Extensible metadata support
- 📦 Designed for package-based modularity

---

## 📦 Installation

Add this to your `pubspec.yaml`:

```yaml
dependencies:
  firechat: <latest_version>


🚀 Getting Started
1. Initialize Firebase
Make sure you’ve initialized Firebase in your app:


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

2. Use the Singleton Instance
dart
Copy
Edit
final fireChat = FyreChat.instance;
🛠 Usage Examples
🔐 Listen to Current User
dart
Copy
Edit
fireChat.firebaseUser.listen((user) {
  print('Current user: ${user?.uid}');
});
🧑‍ Create User in Firestore
dart
Copy
Edit
await fireChat.createUserInFirestore(
  uid: 'user_123',
  name: 'Kham',
  imageUrl: 'https://example.com/avatar.png',
);
💬 Send a Text Message
dart
Copy
Edit
await fireChat.sendMessage(
  roomId: 'room_abc',
  author: yourUser,
  text: 'Hello there!',
);
💬 Send a Message with Reply
dart
Copy
Edit
await fireChat.sendMessageReply(
  roomId: 'room_abc',
  author: yourUser,
  text: 'This is a reply!',
  repliedMessage: originalMessage,
);
🧑‍🤝‍🧑 Create a Direct Chat Room
dart
Copy
Edit
final room = await fireChat.createRoom(
  user1Id: 'user_a',
  user2Id: 'user_b',
);
👥 Create a Group Room
dart
Copy
Edit
final room = await fireChat.createGroupRoom(
  userIds: ['user1', 'user2', 'user3'],
  currentUser: yourUser,
  groupName: 'Study Group',
  groupImage: 'https://example.com/group.png',
);
🔄 Listen to Messages in a Room
dart
Copy
Edit
fireChat.messages('room_abc').listen((messages) {
  for (var msg in messages) {
    print('${msg.author.id}: ${msg.text}');
  }
});
👁 Mark Messages as Seen
This is automatic when streaming messages, but you can implement manual seen marking if needed:

dart
Copy
Edit
await fireChat.markMessagesAsSeen(roomId: 'room_abc', userId: 'your_user_id');
📁 Firestore Structure
Here’s an example structure used by FyreChat:

css
Copy
Edit
Firestore Root
├── rooms (Collection)
│   └── {roomId} (Document)
│       ├── userIds: [uid1, uid2]
│       ├── type: 'group' or 'direct'
│       └── ...
│
├── messages/{roomId} (Subcollection)
│   └── {messageId}
│       ├── author: {id, name, imageUrl}
│       ├── text / imageUrl / fileUrl
│       ├── seenBy: { uid1: timestamp, uid2: timestamp }
│       └── metadata (including reply info)
📌 Requirements
Firebase (Firestore + Auth)

Flutter 3.10 or newer

Dart 3.x

🧪 Coming Soon
✅ Typing indicator support

✅ Push notifications

✅ Message editing

✅ Group member roles (admin/mod)

🤝 Contribution
Contributions are welcome! Feel free to open issues or submit pull requests.

Setup for Development
bash
Copy
Edit
git clone https://github.com/your_username/firechat.git
cd firechat
flutter pub get
📄 License
This project is licensed under the MIT License. See the LICENSE file for details.

