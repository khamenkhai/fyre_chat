## 📦 Installation

Add this to your `pubspec.yaml`:

```yaml
dependencies:
  firechat: <latest_version>
```

---

## 🚀 Getting Started

### 1. Initialize Firebase

Make sure you’ve initialized Firebase in your app:

```dart
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}
```

### 2. Use the Singleton Instance

```dart
final fireChat = FyreChat.instance;
```

---

## 🛠️ Usage Examples

### 🔐 Listen to Current User

```dart
fireChat.firebaseUser.listen((user) {
  print('Current user: ${user?.uid}');
});
```

### 🧑‍ Create User in Firestore

```dart
await fireChat.createUserInFirestore(
  uid: 'user_123',
  name: 'Kham',
  imageUrl: 'https://example.com/avatar.png',
);
```

### 💬 Send a Text Message

```dart
await fireChat.sendMessage(
  roomId: 'room_abc',
  author: yourUser,
  text: 'Hello there!',
);
```

### 💬 Send a Message with Reply

```dart
await fireChat.sendMessageReply(
  roomId: 'room_abc',
  author: yourUser,
  text: 'This is a reply!',
  repliedMessage: originalMessage,
);
```

### 🧑‍🤝‍🧑 Create a Direct Chat Room

```dart
final room = await fireChat.createRoom(
  user1Id: 'user_a',
  user2Id: 'user_b',
);
```

### 👥 Create a Group Room

```dart
final room = await fireChat.createGroupRoom(
  userIds: ['user1', 'user2', 'user3'],
  currentUser: yourUser,
  groupName: 'Study Group',
  groupImage: 'https://example.com/group.png',
);
```

### 🔄 Listen to Messages in a Room

```dart
fireChat.messages('room_abc').listen((messages) {
  for (var msg in messages) {
    print('${msg.author.id}: ${msg.text}');
  }
});
```

### 👁 Mark Messages as Seen

This is automatic when streaming messages, but you can implement manual seen marking if needed:

```dart
await fireChat.markMessagesAsSeen(
  roomId: 'room_abc',
  userId: 'your_user_id',
);
```

---

## 📁 Firestore Structure

Here’s an example structure used by FyreChat:

```
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
```

---

## 📌 Requirements

- Firebase (Firestore + Auth)  
- Flutter 3.10 or newer  
- Dart 3.x  

---

## 🧪 Coming Soon

- ✅ Typing indicator support  
- ✅ Push notifications  
- ✅ Message editing  
- ✅ Group member roles (admin/mod)  

---

## 🤝 Contribution

Contributions are welcome! Feel free to open issues or submit pull requests.

### Setup for Development

```bash
git clone https://github.com/khamenkhai/fyre_chat
cd firechat
flutter pub get
```

---

## 📄 License

This project is licensed under the MIT License. See the LICENSE file for details.
