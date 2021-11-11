import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:video_player/video_player.dart';
import 'dart:math' as math;
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Flutter TikTok',
      debugShowCheckedModeBanner: false,
      home: MyStatefulWidget(),
    );
  }
}

/// This is the stateful widget that the main application instantiates.
class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key? key}) : super(key: key);

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

/// This is the private State class that goes with MyStatefulWidget.
class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: HomePage(),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          const BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/images/add.png',
              height: 25,
            ),
            label: 'Add',
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.comment_outlined),
            label: 'Comment',
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: 'Profil',
          ),
        ],
        currentIndex: _selectedIndex,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Color(0xFF141518),
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        onTap: _onItemTapped,
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);
  final List<Map> tiktokItems = [
    {"video": "assets/videos/video.mp4"},

    {"video": "assets/videos/AJGM1233.MP4"},

    {"video": "assets/videos/me.MP4"},

    {"video": "assets/videos/Nous.MP4"},
  ];

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
          height: double.infinity,
          scrollDirection: Axis.vertical,
          viewportFraction: 1.0),
      items: tiktokItems.map((item) {
        return Builder(
          builder: (BuildContext context) {
            return Container(
                color: const Color(0xFF141518),
                child: Stack(
                  children: [
                    VideoWidget(videoUrl: item['video']),
                    const PostContent ()
                  ],
                ));
          },
        );
      }).toList(),
    );
  }
}

class VideoWidget extends StatefulWidget {
  VideoWidget({Key? key, required this.videoUrl}) : super(key: key);
  final String videoUrl;

  @override
  _VideoWidgetState createState() => _VideoWidgetState(this.videoUrl);
}

class _VideoWidgetState extends State<VideoWidget> {
  late VideoPlayerController _controller;
  final String videoUrl;
  _VideoWidgetState(this.videoUrl);

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset(videoUrl)
      ..initialize().then((_) {
        _controller.setLooping(true);
        _controller.play();
        setState(() {});
      });
  }

  @override
  Widget build(BuildContext context) {
    return VideoPlayer(_controller);
  }
}


class PostContent extends StatelessWidget {
  const PostContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
        height: 100,
          padding: const EdgeInsets.only(top: 40),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: const [
              Text(
                'Abonnements  ',
                style:
                TextStyle(color: Colors.white54,
                    fontWeight: FontWeight.w600),
              ),
              Text(
                '|  Pour toi',
                style:
                TextStyle(color: Colors.white,
                    fontWeight: FontWeight.w600),
              ),
              SizedBox(width: 90),
              Icon(
                Icons.search,
                color: Colors.white,
                size: 35,
              ),
              SizedBox(width: 25),
            ],
          ),
        ),

        Expanded(
              child: Row(
               children: [
                 Expanded(
                   child: Container(
                      //color: Colors.red.withOpacity(0.5),
                     padding: EdgeInsets.all(10),
                     child: Column(
                       mainAxisAlignment: MainAxisAlignment.end,
                       crossAxisAlignment: CrossAxisAlignment.start,
                       children: [
                         const Text(
                           '@extremesports_95',
                           style: TextStyle(
                             color: Colors.white,
                         fontWeight: FontWeight.w600,
                         ),
                        ),
                         SizedBox(height: 10),
                          const Text(
                       'Goein full send in Squaw Valley. #snow @snowboarding # extremesports #sendit #winter',
                          style: TextStyle(
                          color: Colors.white,
                          ),
                          ),
                          SizedBox(height: 10),
                            Row(
                         children: const [
               Icon(
                 Icons.music_note,
                 color: Colors.white,
                 size: 15,
               ),
               SizedBox(width: 5),
               Text(
                 'Original Sound - extremesports_95',
                 style: TextStyle(
                   color: Colors.white,
                 ),
               ),
             ],
           )
         ],
       ),
    ),
        ),
        Container(
         width: 80,
      //color: Colors.green,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
              padding: EdgeInsets.all(10),
              child: Stack(
               alignment: AlignmentDirectional.bottomCenter,
               children: [
               Container(
                margin: EdgeInsets.only(bottom: 10),
                 child: const CircleAvatar(
                radius: 25,
                backgroundImage: AssetImage(
                'assets/images/photo.JPG'
                ),
                ),
                ),
    Container(
    padding: EdgeInsets.all(2),
    decoration: BoxDecoration(
    color: Colors.red,
    borderRadius: BorderRadius.circular(20),
    ),
    child: Icon(
    Icons.add,
    color: Colors.white,
    size: 15,
    ),
    )
    ],
    ),
    ),
             Container(
               height: 80,
                child: Column(
                children: [
                  Icon(
                   Icons.favorite,
            color: Colors.white.withOpacity(0.85),
            size: 45,
    ),
            Text(
           '25.0K',
           style: TextStyle(
           color: Colors.white,
           fontSize: 12,
           fontWeight: FontWeight.w600,
    ),
    )
    ],
    ),
    ),
           Container(
           height: 80,
           child: Column(
           children: [
            Icon(
           MdiIcons.chat,
          color: Colors.white.withOpacity(0.85),
           size: 45,
    ),
          Text(
          '156',
            style: TextStyle(
           color: Colors.white,
            fontSize: 12,
            fontWeight: FontWeight.w600,
    ),
    )
    ],
    ),
    ),
             Container(
             height: 80,
             child: Column(
             children: [
             Icon(
             MdiIcons.share,
             color: Colors.white.withOpacity(0.85),
             size: 45,
    ),
             const Text(
             '123',
             style: TextStyle(
             color: Colors.white,
              fontSize: 12,
               fontWeight: FontWeight.w600,
    ),
    )
    ],
    ),
    ),
              AnimatedLogo(),
    ],
    ),
    )
    ],
    ),
    ),
    ],
    );
  }
}

   class AnimatedLogo extends StatefulWidget {
  AnimatedLogo({Key? key}) : super(key: key);

  @override
  _AnimatedLogoState createState() => _AnimatedLogoState();
}

class _AnimatedLogoState extends State<AnimatedLogo>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    _controller = AnimationController(
      duration: const Duration(milliseconds: 4000),
      vsync: this,
    );
    _controller.repeat();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: _controller,
        builder: (_, child) {
      return Transform.rotate(
        angle: _controller.value * 2 * math.pi,
        child: child,
      );
    },

      child: Container(
  height: 45,
  width: 45,
  padding: EdgeInsets.all(5),
  decoration: BoxDecoration(
  borderRadius: BorderRadius.circular(25),
  image: DecorationImage(
  image: AssetImage("assets/images/disc.png"),
  ),
  ),
  child: Image.asset('assets/images/tiktok.jpg'),
  ),
  );
}
}