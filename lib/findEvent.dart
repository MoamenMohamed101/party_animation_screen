import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:party_screen/fadeAnimation.dart';

class FindEvent extends StatelessWidget {
  const FindEvent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(244, 243, 243, 1),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        systemOverlayStyle: SystemUiOverlayStyle.light,
        leading: const Icon(Icons.menu, color: Colors.black),
        actions: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              height: 35,
              width: 35,
              decoration: BoxDecoration(
                image: const DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage('assets/images/four.jpg'),
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Transform.translate(
                offset: const Offset(15, -15),
                child: Container(
                  margin: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    border: Border.all(width: 3, color: Colors.white),
                    shape: BoxShape.circle,
                    color: Colors.yellow,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              FadeAnimation(
                1,
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: Colors.white,
                  ),
                  child: const TextField(
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      prefixIcon: Icon(
                        Icons.search,
                        color: Colors.grey,
                      ),
                      hintText: 'search event',
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              FadeAnimation(
                1.2,
                makeItem('assets/images/one.jpg', 17),
              ),
              const SizedBox(
                height: 20,
              ),
              FadeAnimation(
                1.3,
                makeItem('assets/images/two.jpg', 18),
              ),
              const SizedBox(
                height: 20,
              ),
              FadeAnimation(
                1.4,
                makeItem('assets/images/three.jpg', 19),
              ),
              const SizedBox(
                height: 20,
              ),
              FadeAnimation(
                1.5,
                makeItem('assets/images/four.jpg', 20),
              ),
              const SizedBox(
                height: 20,
              ),
              FadeAnimation(
                1.6,
                makeItem('assets/images/five.jpg', 21),
              ),
              const SizedBox(
                height: 20,
              ),
              FadeAnimation(
                1.7,
                makeItem('assets/images/six.jpg', 22),
              ),
              const SizedBox(
                height: 20,
              ),
              FadeAnimation(
                1.8,
                makeItem('assets/images/seven.jpg', 23),
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }

  makeItem(image, date) {
    return Row(
      children: [
        Container(
          margin: const EdgeInsets.only(right: 20),
          height: 200,
          width: 50,
          child: Column(
            children: [
              Text(
                date.toString(),
                style: const TextStyle(
                  color: Colors.blue,
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Text(
                'sep',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: Container(
            height: 200,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              image:
                  DecorationImage(image: AssetImage(image), fit: BoxFit.cover),
            ),
            child: Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                gradient: LinearGradient(
                  colors: [
                    Colors.black.withOpacity(.4),
                    Colors.black.withOpacity(.1),
                  ],
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const Text(
                    'Bumbershoot 2019',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: const [
                      Icon(Icons.access_time, color: Colors.white),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        '19:00 pm',
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
