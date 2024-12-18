import 'package:face_book_home_ui/reel_page.dart';
import 'package:flutter/material.dart';

class FacebookHomePage extends StatefulWidget {
  const FacebookHomePage({super.key});

  @override
  State<FacebookHomePage> createState() => _FacebookHomePageState();
}

class _FacebookHomePageState extends State<FacebookHomePage> {
  List<String> networkImage = [
    "https://media.istockphoto.com/id/505239248/photo/humayun-tomb-new-delhi-india.jpg?s=1024x1024&w=is&k=20&c=eEvp7-HwZaY4itp3HAayDYdHPH_YSVDe9aLeHFI-A0w=",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTET4Q9f53kv3UwLPA_OFfCmmg-n7SjTCg00rao35hzpQbW4cyrlEtNlyv2Bn9rYU-8oNI&usqp=CAU",
    "https://media.istockphoto.com/id/505239248/photo/humayun-tomb-new-delhi-india.jpg?s=1024x1024&w=is&k=20&c=eEvp7-HwZaY4itp3HAayDYdHPH_YSVDe9aLeHFI-A0w=",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTET4Q9f53kv3UwLPA_OFfCmmg-n7SjTCg00rao35hzpQbW4cyrlEtNlyv2Bn9rYU-8oNI&usqp=CAU",
    "https://media.istockphoto.com/id/505239248/photo/humayun-tomb-new-delhi-india.jpg?s=1024x1024&w=is&k=20&c=eEvp7-HwZaY4itp3HAayDYdHPH_YSVDe9aLeHFI-A0w=",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          'facebook',
          style: TextStyle(
            color: Colors.blueAccent,
            fontSize: 28,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.search, color: Colors.black),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.message, color: Colors.black),
            onPressed: () {},
          ),
        ],
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Stories Section
            Container(
              height: 120,
              color: Colors.white,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 10,
                itemBuilder: (context, index) {
                  return Container(
                    width: 80,
                    margin:
                        const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: const DecorationImage(
                        image: NetworkImage('https://via.placeholder.com/150'),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        width: double.infinity,
                        color: Colors.black54,
                        padding: const EdgeInsets.all(4),
                        child: Text(
                          'User $index',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 10),

            // Post Composer
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
              color: Colors.white,
              child: const Row(
                children: [
                  CircleAvatar(
                    backgroundImage:
                        NetworkImage('https://via.placeholder.com/150'),
                    radius: 25,
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: "What's on your mind?",
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Divider(height: 2, color: Colors.grey[300]),
            Container(
              height: 50,
              color: Colors.white,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  TextButton.icon(
                    icon: const Icon(Icons.video_call, color: Colors.red),
                    label: const Text('Live'),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => VideoSliderPage(),
                          ));
                    },
                  ),
                  const VerticalDivider(width: 8),
                  TextButton.icon(
                    icon: const Icon(Icons.photo_library, color: Colors.green),
                    label: const Text('Photo'),
                    onPressed: () {},
                  ),
                  const VerticalDivider(width: 8),
                  TextButton.icon(
                    icon: const Icon(Icons.video_call, color: Colors.purple),
                    label: const Text('Room'),
                    onPressed: () {},
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),

            // Posts Feed
            for (int i = 0; i < networkImage.length; i++)
              _buildPost(context, i),
          ],
        ),
      ),
      backgroundColor: Colors.grey[200],
    );
  }

  Widget _buildPost(BuildContext context, int index) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            contentPadding: const EdgeInsets.all(8.0),
            leading: const CircleAvatar(
              backgroundImage: NetworkImage(
                  'https://buffer.com/cdn-cgi/image/w=1000,fit=contain,q=90,f=auto/library/content/images/size/w1200/2023/10/free-images.jpg'),
            ),
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('User $index',
                    style: const TextStyle(fontWeight: FontWeight.bold)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('5 mins ago',
                        style: TextStyle(color: Colors.grey, fontSize: 12)),
                    Row(
                      children: [
                        IconButton(
                          icon: const Icon(Icons.thumb_up_alt_outlined,
                              color: Colors.blue),
                          onPressed: () {},
                        ),
                        IconButton(
                          icon: const Icon(Icons.comment_outlined,
                              color: Colors.grey),
                          onPressed: () {},
                        ),
                        IconButton(
                          icon: const Icon(Icons.share_outlined,
                              color: Colors.grey),
                          onPressed: () {},
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            trailing: const Icon(Icons.more_horiz),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
              'This is a sample post content for post $index.',
              style: const TextStyle(fontSize: 16),
            ),
          ),
          Container(
            height: 200,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(networkImage[index]),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
