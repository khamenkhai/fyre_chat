/rooms/{roomId}  
  - type: 'direct' or 'group'  
  - userIds: [user1, user2]  
  - userRoles: {user1: 'admin'}  
  - lastMsg: 'Last message text'  

/rooms/{roomId}/messages/{messageId}  
  - authorId: string  
  - text: string (for text messages)  
  - isDeleted: bool  
  - seenBy: {user1: timestamp}  
  - reactions: {user1: '❤️'}  