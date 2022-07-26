import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:party_screen/fadeAnimation.dart';
import 'package:party_screen/findEvent.dart';

main() {
  runApp(
    const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    ),
  );
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  AnimationController? animationController;
  Animation<double>? animation;
  bool hide = false;

  @override
  void initState() {
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
    animation = Tween<double>(
      begin: 1,
      end: 30,
    ).animate(animationController!)
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          Navigator.push(
            context,
            PageTransition(
              child: const FindEvent(),
              type: PageTransitionType.leftToRight,
              duration: const Duration(milliseconds: 500),
            ),
          );
        }
      });
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/background.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Container(
          padding: const EdgeInsets.all(44.2),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.bottomCenter,
              colors: [
                Colors.black.withOpacity(.9),
                Colors.black.withOpacity(.6),
                Colors.black.withOpacity(.8),
                Colors.black.withOpacity(.3),
              ],
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              FadeAnimation(
                1,
                const Text(
                  'Find the best locations near you for a good night.',
                  style: TextStyle(
                      color: Colors.white,
                      height: 1.1,
                      fontSize: 40,
                      fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              FadeAnimation(
                1.2,
                Text(
                  'Let us find you an event for your interest',
                  style: TextStyle(
                      color: Colors.white.withOpacity(.8),
                      fontSize: 25,
                      fontWeight: FontWeight.w100),
                ),
              ),
              const SizedBox(
                height: 150,
              ),
              FadeAnimation(
                1.4,
                InkWell(
                  onTap: () {
                    setState(() {
                      hide = true;
                    });
                    animationController!.forward();
                  },
                  child: AnimatedBuilder(
                    animation: animationController!,
                    builder: (BuildContext context, Widget? child) =>
                        Transform.scale(
                      scale: animation!.value,
                      child: Container(
                        height: 60,
                        decoration: BoxDecoration(
                          color: Colors.yellow[700],
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: hide == false
                            ? Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: const [
                                  Text(
                                    'Find nearest event',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 17),
                                  ),
                                  Icon(
                                    Icons.arrow_forward,
                                    color: Colors.white,
                                  ),
                                ],
                              )
                            : Container(),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 60,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
