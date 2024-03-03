import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_slidable/flutter_slidable.dart';


void main() => runApp(MyApp());

// Apagar as Shared Preferences antes de enviar 

// void main() async {
//   WidgetsFlutterBinding.ensureInitialized(); // Ensure Flutter binding is initialized
//   await clearSharedPreferences(); // Clear SharedPreferences data before running the app
//   runApp(MyApp());
// }

// Future<void> clearSharedPreferences() async {
//   SharedPreferences prefs = await SharedPreferences.getInstance();
//   await prefs.clear(); // Clear all data stored in SharedPreferences
// }


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.grey[200],
      ),
      home: FacebookClone(),
    );
  }
}

class FacebookClone extends StatefulWidget {
  @override
  _FacebookCloneState createState() => _FacebookCloneState();
}

class _FacebookCloneState extends State<FacebookClone> {
  int _selectedIndex = 0;
  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'Facebook',
          style: TextStyle(
            color: Colors.blue,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              // açao de pesquisa
            },
          ),
        ],
      ),
      body: PageView(
        controller: _pageController,
        onPageChanged: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        children: <Widget>[
          HomePage(),
          ProfilePage(),
          FriendsPage(),
          WatchPage(),
          NotificationsPage(),
          MenuPage(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: 'Profile',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.message),
            label: 'Chat',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.video_library),
            label: 'Watch',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: 'Notifications',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.menu),
            label: 'Menu',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey[800], 
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
            _pageController.animateToPage(
              index,
              duration: Duration(milliseconds: 300),
              curve: Curves.easeInOut,
            );
          });
        },
      ),
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
}

class HomePage extends StatelessWidget {
  final List<Map<String, dynamic>> posts = [
    {
      'userName': 'Gyokeres',
      'postContent': 'Liga BWIN TOPSCORER 2023/2024 🏆🥇🔥🔝🦁',
      'postImageUrl': 'https://asset.skoiy.com/ojonxcycnuapxiqs/svhpxxkvsfuf.jpg?w=1852&q=80',
    },
    {
      'userName': 'Di Maria',
      'postContent': 'Liga BWIN 2023/2024 Champions 🏆🥇🔥🔝🦅',
      'postImageUrl': 'https://images.impresa.pt/olimpia/2023-08-09-Di-Maria-Benfica-Supertaca.jpg-b0cac266/original/mw-860',
    },
      {
    'userName': 'Taremi',
    'postContent': 'Great game last night! ⚽️🔥 #football',
    'postImageUrl': 'https://cdn.pixabay.com/photo/2015/03/11/15/19/divers-668777_1280.jpg',
  },
  {
    'userName': 'Raptruista',
    'postContent': 'Novo som primaços! 🎵🔥',
    'postImageUrl': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQNiMEf75vOg0ASuthE9WF75ErtLsFU6j5HJ8fCGUm0pc5qk9Vxbz4Nvhk_4Oc4JCDGnFY&usqp=CAU',
  },
  {
    'userName': 'Dj8Cr8',
    'postContent': 'Novas Mixes malta! 💻💪 #dj8cr8',
    'postImageUrl': 'https://pbs.twimg.com/media/DAAth70WsAEEfn2.jpg:large',
  },
  {
    'userName': 'Smiletdm',
    'postContent': 'Enjoying a peaceful day in nature! 🌳☀️',
    'postImageUrl': 'https://i.ytimg.com/vi/OcueQzaNayg/maxresdefault.jpg',
  },
  {
    'userName': 'AfonsoG',
    'postContent': 'Excited to start my new project! 🚀 #development',
    'postImageUrl': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR0nseOeP8RPcX1RY4cUdQ4Gr8lnR4Rx0Iw0A&usqp=CAU',
  },
  {
    'userName': 'Maria',
    'postContent': 'Enjoying the evening with my dog! #beagle',
    'postImageUrl': 'https://upload.wikimedia.org/wikipedia/commons/c/c2/Beagle_portrait_Camry.jpg',
  },
  {
    'userName': 'Dillaz',
    'postContent': 'Chilling with friends at the beach! 🏖️☀️ #summer',
    'postImageUrl': 'https://www.e-cultura.pt/images/user/image16448553404865.jpg',
  },
  {
    'userName': 'Bruno Pascoa',
    'postContent': 'Weekend coding at home! 🏞️⛺️ #code',
    'postImageUrl': 'https://prodaly.com.br/wp-content/uploads/2024/01/Capa-programador.png',
  },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: posts.length,
        itemBuilder: (context, index) {
          final postData = posts[index];
          String userName = postData['userName'];
          String postContent = postData['postContent'];
          String postImageUrl = postData['postImageUrl'];

          return Card(
            elevation: 0,
            margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
            child: ListTile(
              contentPadding: EdgeInsets.all(10),
              leading: CircleAvatar(
                backgroundImage: NetworkImage(postImageUrl),
              ),
              title: Text(
                userName,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 5),
                  Text(
                    'Posted 1 hour ago',
                    style: TextStyle(
                      color: Colors.grey[600],
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    postContent,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
              trailing: Container(
                width: 70,
                height: 70,
                child: Image.network(
                postImageUrl,
                fit: BoxFit.cover, 
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}


class FriendsPage extends StatelessWidget {
  final List<Map<String, String>> friends = [
    {
      'name': 'Liro o Beagle',
      'profilePictureUrl': 'https://upload.wikimedia.org/wikipedia/commons/c/c2/Beagle_portrait_Camry.jpg',
      'bio': 'I love to travel and take photos.',
    },
    {
      'name': 'Bruno Pascoa',
      'profilePictureUrl': 'https://prodaly.com.br/wp-content/uploads/2024/01/Capa-programador.png',
      'bio': 'I am a programmer. I love codding :) .',
    },
    {
      'name': 'Dj8Cr8',
      'profilePictureUrl': 'https://pbs.twimg.com/media/DAAth70WsAEEfn2.jpg:large',
      'bio': 'I am a music lover.',
    },
    {
      'name': 'Dillaz',
      'profilePictureUrl': 'https://www.e-cultura.pt/images/user/image16448553404865.jpg',
      'bio': 'I am a rapper.',
    },
    {
      'name': 'Smiletdm',
      'profilePictureUrl': 'https://i.ytimg.com/vi/OcueQzaNayg/maxresdefault.jpg',
      'bio': 'I am a rap and Bonecos lover.',
    },
    {
      'name': 'Raptruista',
      'profilePictureUrl': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQNiMEf75vOg0ASuthE9WF75ErtLsFU6j5HJ8fCGUm0pc5qk9Vxbz4Nvhk_4Oc4JCDGnFY&usqp=CAU',
      'bio': 'I am bald and a music lover.',
    },
    {
      'name': 'AfonsoG',
      'profilePictureUrl': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR0nseOeP8RPcX1RY4cUdQ4Gr8lnR4Rx0Iw0A&usqp=CAU',
      'bio': 'I am Boneco.',
    },
    {
      'name': 'Di Maria',
      'profilePictureUrl': 'https://images.impresa.pt/olimpia/2023-08-09-Di-Maria-Benfica-Supertaca.jpg-b0cac266/original/mw-860',
      'bio': 'I am a football player for Benfica.',
    },
    {
      'name': 'Gyokeres',
      'profilePictureUrl': 'https://asset.skoiy.com/ojonxcycnuapxiqs/svhpxxkvsfuf.jpg?w=1852&q=80',
      'bio': 'I am a football player for Sporting.',
    },
    {
      'name': 'Taremi',
      'profilePictureUrl': 'https://cdn.pixabay.com/photo/2015/03/11/15/19/divers-668777_1280.jpg',
      'bio': 'I am a professional diver and swimmer.',
    },
  ];

 @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Friends'),
      ),
      body: ListView.builder(
        itemCount: friends.length,
        itemBuilder: (context, index) {
          final friend = friends[index];
          String friendName = friend['name']!;
          String profilePictureUrl = friend['profilePictureUrl']!;
          String bio = friend['bio'] ?? ''; 

          return Slidable(
            actionPane: SlidableDrawerActionPane(),
            actionExtentRatio: 0.25,
            child: ListTile(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ChatPage(friendName: friendName)),
                );
              },
              leading: CircleAvatar(
                backgroundImage: NetworkImage(profilePictureUrl),
              ),
              title: Text(friendName),
            ),
            secondaryActions: [
              IconSlideAction(
                caption: 'View Profile',
                color: Colors.blue,
                icon: Icons.person,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => FriendProfilePage(friendName: friendName, profilePictureUrl: profilePictureUrl, bio: bio)), // Pass the bio description
                  );
                },
              ),
            ],
          );
        },
      ),
    );
  }
}

class FriendProfilePage extends StatelessWidget {
  final String friendName;
  final String profilePictureUrl;
  final String bio;
  
  final List<Map<String, String>> staticPosts = [
    {
      'title': 'Post #4',
      'content': 'Last Post of the day. Have a good night!!!',
    },
    {
      'title': 'Post #3',
      'content': 'This is the post 3. Thank you for your support!',
    },
    {
      'title': 'Post #2',
      'content': 'This is the post 2. Thank you for your support!',
    },
    {
      'title': 'Post #1',
      'content': 'First post of the day. Good morning everyone!',
    },
  ];

  FriendProfilePage({
    Key? key,
    required this.friendName,
    required this.profilePictureUrl,
    required this.bio,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Friend Profile'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              color: Colors.blue,
              height: 200,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: 50,
                      backgroundImage: NetworkImage(profilePictureUrl),
                    ),
                    SizedBox(height: 10),
                    Text(
                      friendName,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      bio,
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Posts',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),
                  Column(
                    children: staticPosts.map((post) {
                      return PostItem(
                        title: post['title']!,
                        content: post['content']!,
                      );
                    }).toList(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}




class ChatPage extends StatefulWidget {
  final String friendName;

  ChatPage({required this.friendName});

  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  List<Map<String, String>> messages = [];
  TextEditingController messageController = TextEditingController();
  ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    loadMessages();
  }

void loadMessages() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  Object? messagesValue = prefs.get(widget.friendName);
  if (messagesValue is String && messagesValue.isNotEmpty) {
    String messagesJson = messagesValue as String;
    setState(() {
      List<dynamic> decodedMessages = jsonDecode(messagesJson);
      messages = decodedMessages.map((message) => Map<String, String>.from(message)).toList();
    });
  } else {
    setState(() {
      messages.addAll([
        {'sender': widget.friendName, 'content': 'Hello, how are you?'},
        {'sender': widget.friendName, 'content': 'I hope you are doing well!'},
        {'sender': widget.friendName, 'content': 'Let me know if you need anything.'},
      ]);
    });
  }
  WidgetsBinding.instance!.addPostFrameCallback((_) {
    _scrollController.jumpTo(_scrollController.position.maxScrollExtent);
  });
}


  void saveMessage(String message) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      messages.add({'sender': 'Me', 'content': message});
      prefs.setString(widget.friendName, jsonEncode(messages));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.friendName),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              reverse: false, 
              controller: _scrollController,
              itemCount: messages.length,
              itemBuilder: (context, index) {
                final message = messages[index];
                final isCurrentUserMessage = message['sender'] == 'Me';

                return Align(
                  alignment: isCurrentUserMessage ? Alignment.centerRight : Alignment.centerLeft,
                  child: Container(
                    margin: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: isCurrentUserMessage ? Colors.blue : Colors.green,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      message['content']!,
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: messageController,
                    decoration: InputDecoration(hintText: 'Type a message'),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.send),
                  onPressed: () {
                    saveMessage(messageController.text);
                    messageController.clear();
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}





class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              color: Color.fromARGB(255, 189, 71, 71),
              height: 200,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: 50,
                      backgroundImage: NetworkImage('https://scontent-lis1-1.xx.fbcdn.net/v/t39.30808-1/369905337_1815450075536694_3999614326748626569_n.jpg?stp=cp0_dst-jpg_e15_p120x120_q65&_nc_cat=103&ccb=1-7&_nc_sid=4da83f&_nc_ohc=2eOSSNa1cucAX91CSLK&_nc_ht=scontent-lis1-1.xx&oh=00_AfBFS5QCWe10VkfZ1aaqL4A0nwoEb48XHJe6tJJqCne3pA&oe=65E9328E'),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Miguel Miragaia',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      'Aluno de Engenharia Informática na Universidade de Aveiro',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Posts',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),
                  PostItem(
                    title: 'Disciplina de ICM',
                    content: 'Adoro as aulas de ICM!!.',
                  ),
                  PostItem(
                    title: 'Benfica vs Sporting',
                    content: 'Jogo fraco da nossa parte, na segunda mão vamos dar a volta.',
                  ),
                  PostItem(
                    title: 'DJ8CR8',
                    content: 'Adoro a musica do meu idolo. Obrigado!',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PostItem extends StatelessWidget {
  final String title;
  final String content;

  const PostItem({
    required this.title,
    required this.content,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 5),
            Text(
              content,
              style: TextStyle(
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }
}


class WatchPage extends StatelessWidget {
  final List<String> storyImages = [
    'https://media.istockphoto.com/id/1042451092/photo/paradisiac-beach-at-maldives.jpg?s=612x612&w=0&k=20&c=gSqg9x1zUEpHE_cirwVw5TGQ6-FwXFVgwdJbVr4ZMmo=',
    'https://media.istockphoto.com/id/1161389096/pt/foto/hammock-in-a-paradisiac-beach-at-maldives.webp?s=2048x2048&w=is&k=20&c=zqsHmmlwkpb99S-1tZhPo9kSbHLHgNYiml1PdOXSp1g=', 
    'https://media.istockphoto.com/id/546187164/pt/foto/the-underwater-view-of-fernando-de-noronha-paradisiac-island.webp?s=2048x2048&w=is&k=20&c=MS4VMXz06aShvNOAwV3WPoy_MXgx2McvGphJnj6FxU4=',
    'https://media.istockphoto.com/id/1763937485/pt/foto/muses-bunch-x-mature-paradisiac.webp?s=2048x2048&w=is&k=20&c=M5c53rH-WqB7b9PrnIr6Yunhn1-FjJzaJd-w_ZlaCJw=',
    'https://media.istockphoto.com/id/976610962/pt/foto/scenic-paradisiac-landscape-view-of-albanian-alps-mountains-traveling-exploring-holiday-concept.webp?s=2048x2048&w=is&k=20&c=F55l0DQL-WazCHpgWpnQx897NHmxL_Xk-tO_CF9Gb_w=',
    'https://media.istockphoto.com/id/1055430024/pt/foto/paradisiac-beach-at-maldives.webp?s=2048x2048&w=is&k=20&c=Mih_2VBgxnOOF49Ck2wK0AbRgjhMr99EX_MpPUMUAvg=',
    'https://media.istockphoto.com/id/1176224372/pt/foto/young-adult-woman-lying-on-a-paradisiac-beach-against-turquoise-water-in-maldives.webp?s=2048x2048&w=is&k=20&c=Dl0zLYRXJlG98DJHpwG5FMtEbnkMRXW-BleGXWayaRQ=',
    'https://media.istockphoto.com/id/1176158415/pt/foto/shaka-sign-in-a-paradisiac-sea-in-maldives.webp?s=2048x2048&w=is&k=20&c=210fjl524VKvbZ3IHsakj3Z2-6RUuvYpLI0zt59OfBo=',
    'https://media.istockphoto.com/id/1176158430/pt/foto/turtle-in-a-paradisiac-sea-at-maldives.webp?s=2048x2048&w=is&k=20&c=NWq_x462W6xdAIU4br4lX4f_wtgpPHiUPMLIG3sJMx4=',
    'https://media.istockphoto.com/id/1176156905/pt/foto/young-adult-woman-lying-on-a-paradisiac-beach-against-turquoise-water-in-maldives-at-sunset.webp?s=2048x2048&w=is&k=20&c=lNXdjOQtwqmgi9Xv1xLQzQG_HXZAkaazpys6XTuz3xA=',
    'https://media.istockphoto.com/id/984083058/pt/foto/handsome-and-happy-man-carrying-his-smiling-girlfriend-on-back-in-paradisiac-beach-holiday-and.webp?s=2048x2048&w=is&k=20&c=fTOVpkjJc2Qx-6i8HlRWIFwhDCdkqu5z1GbV6B6tjdA='
  ];

  @override
  Widget build(BuildContext context) {
    final PageController _pageController = PageController();

    return Scaffold(
      appBar: AppBar(
        title: Text('Watch'),
      ),
      body: PageView.builder(
        itemCount: storyImages.length,
        controller: _pageController,
        itemBuilder: (context, index) {
          return StoryItem(
            index: index,
            pageController: _pageController,
            storyImage: storyImages[index], // Pass the image URL to the StoryItem
          );
        },
      ),
    );
  }
}

class StoryItem extends StatelessWidget {
  final int index;
  final PageController pageController;
  final String storyImage; // Image URL for the story

  const StoryItem({
    Key? key,
    required this.index,
    required this.pageController,
    required this.storyImage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.8,
      child: Stack(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            margin: EdgeInsets.symmetric(horizontal: 8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              image: DecorationImage(
                image: NetworkImage(storyImage), // Use the provided image URL
                fit: BoxFit.cover,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Align(
                alignment: Alignment.bottomLeft,
                child: Text(
                  'Friend $index',
                  style: TextStyle(color: Color.fromARGB(255, 0, 0, 0), fontWeight: FontWeight.bold, fontSize: 22),
                ),
              ),
            ),
          ),
          Positioned(
            top: 0,
            bottom: 0,
            right: 0,
            child: GestureDetector(
              onTap: () {
                pageController.animateToPage(index + 1, duration: Duration(milliseconds: 500), curve: Curves.ease);
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Icon(
                  Icons.arrow_forward,
                  color: Colors.white,
                  size: 36,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}


class NotificationsPage extends StatefulWidget {
  @override
  _NotificationsPageState createState() => _NotificationsPageState();
}

class _NotificationsPageState extends State<NotificationsPage> {
  List<String> unreadNotifications = [
    'Maria sent you a friend request',
    'Bruno Pascoa sent you a friend request',
    'Dj8Cr8 sent you a friend request',
    'Dillaz sent you a friend request',
    'Smiletdm sent you a friend request',
    'AfonsoG sent you a friend request',
    'Di Maria sent you a friend request',
    'Gyokeres sent you a friend request', 
    'Taremi sent you a friend request',
  ];

  List<String> seenNotifications = [];

  void markAsRead(int index) {
    setState(() {
      String notification = unreadNotifications.removeAt(index);
      seenNotifications.add(notification);
    });
  }

  void dismissNotification(int index) {
    setState(() {
      unreadNotifications.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notifications'),
      ),
      body: ListView.builder(
        itemCount: unreadNotifications.length,
        itemBuilder: (context, index) {
          return NotificationItem(
            notification: unreadNotifications[index],
            onMarkAsRead: () => markAsRead(index),
            onDismiss: () => dismissNotification(index),
          );
        },
      ),
    );
  }
}

class NotificationItem extends StatelessWidget {
  final String notification;
  final VoidCallback onMarkAsRead;
  final VoidCallback onDismiss;

  const NotificationItem({
    Key? key,
    required this.notification,
    required this.onMarkAsRead,
    required this.onDismiss,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundImage: NetworkImage('https://www.creativefabrica.com/wp-content/uploads/2022/10/25/Person-icon-Graphics-43204353-1.jpg'), 
      ),
      title: Text('Friend Request'),
      subtitle: Text(notification),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            icon: Icon(Icons.check),
            onPressed: onMarkAsRead,
          ),
          IconButton(
            icon: Icon(Icons.close),
            onPressed: onDismiss,
          ),
        ],
      ),
    );
  }
}


class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
        children: [
          ListTile(
            title: Text('Account'),
            onTap: () {
              
            },
          ),
          Divider(),
          ListTile(
            title: Text('Notifications'),
            onTap: () {
              
            },
          ),
          Divider(),
          ListTile(
            title: Text('Privacy'),
            onTap: () {
              
            },
          ),
          Divider(),
          ListTile(
            title: Text('Security'),
            onTap: () {
             
            },
          ),
          Divider(),
          ListTile(
            title: Text('Help & Support'),
            onTap: () {
             
            },
          ),
          Divider(),
          ListTile(
            title: Text('Log Out'),
            onTap: () {
              
            },
          ),
          Divider(),
          ListTile(
            title: Text('Delete Account'),
            onTap: () {
              
            },
          ),
          Divider(),
          ListTile(
            title: Text('App Version'),
            trailing: Text(
              '1.0.0',
              style: TextStyle(
                color: Colors.grey,
              ),
            ),
            onTap: () {
              
            },
          ),
          Divider(),
          ListTile(
            title: Text('Terms of Service'),
            onTap: () {
              
            },
          ),
          Divider(),
          ListTile(
            title: Text('Privacy Policy'),
            onTap: () {
              
            },
          ),
          Divider(),
        ],
      ),
    );
  }
}


class MenuPage extends StatelessWidget {
  // Preloaded names and icons for the rectangles
  final List<String> rectangleNames = [
    'Memories',
    'Stored',
    'Groups',
    'Marketplace',
    'Help',
    'Terms',
  ];

  final List<IconData> rectangleIcons = [
    Icons.access_time,
    Icons.save,
    Icons.people,
    Icons.store,
    Icons.help,
    Icons.security,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Menu'),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundImage: NetworkImage(
                        'https://scontent-lis1-1.xx.fbcdn.net/v/t39.30808-1/369905337_1815450075536694_3999614326748626569_n.jpg?stp=cp0_dst-jpg_e15_p120x120_q65&_nc_cat=103&ccb=1-7&_nc_sid=4da83f&_nc_ohc=2eOSSNa1cucAX91CSLK&_nc_ht=scontent-lis1-1.xx&oh=00_AfBFS5QCWe10VkfZ1aaqL4A0nwoEb48XHJe6tJJqCne3pA&oe=65E9328E'),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Miguel Miragaia',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    'miguelexemplo@gmail.com',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Settings'),
              onTap: () {
                // Navigate to Settings Page
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SettingsPage()),
                );
              },
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.logout),
              title: Text('Logout'),
              onTap: () {
                // Show logout confirmation dialog
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text('Confirm Logout'),
                      content: Text('Are you sure you want to log out?'),
                      actions: <Widget>[
                        TextButton(
                          onPressed: () {
                            // Close the dialog
                            Navigator.of(context).pop();
                          },
                          child: Text('Cancel'),
                        ),
                        TextButton(
                          onPressed: () {
                            // Perform logout action
                            // For example, navigate to login page
                            Navigator.of(context).popUntil((route) => route.isFirst);
                          },
                          child: Text(
                            'Logout',
                            style: TextStyle(
                              color: const Color.fromARGB(255, 226, 6, 6),
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                );
              },
            ),
          ],
        ),
      ),
      body: GridView.count(
        crossAxisCount: 2,
        children: List.generate(6, (index) {
          return Card(
            margin: EdgeInsets.all(8),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  rectangleIcons[index],
                  size: 40,
                ),
                SizedBox(height: 10),
                Text(
                  rectangleNames[index], // Use preloaded names
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}



