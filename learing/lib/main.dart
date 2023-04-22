import 'package:flutter/material.dart';
//notes --> green color text is widget

void main() {
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      darkTheme: ThemeData.dark(),
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("images/bg.jpg"), fit: BoxFit.cover),
          ),
          child: Padding(
            padding: const EdgeInsets.only(top: 100.0, left: 30),
            child: Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    const CircleAvatar(
                      backgroundImage: AssetImage("images/profile.png"),
                      radius: 45,
                    ),
                    const SizedBox(width: 40),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const <Widget>[
                        Text(
                          'Amogh',
                          style: TextStyle(
                            fontSize: 35,
                          ),
                        ),
                        Text(
                          'App Developer',
                        ),
                      ],
                    )
                  ],
                ),
                const SizedBox(height: 30),
                Padding(
                  padding: const EdgeInsets.only(left: 15, right: 10),
                  child: Column(
                    children: <Widget>[
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: const <Widget>[
                          Icon(
                            Icons.location_city,
                            size: 30,
                          ),
                          SizedBox(width: 40),
                          Text('Technology', style: TextStyle(fontSize: 20)),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: const <Widget>[
                          Icon(
                            Icons.location_pin,
                            size: 30,
                          ),
                          SizedBox(width: 40),
                          Text('Benguluru', style: TextStyle(fontSize: 20)),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: const <Widget>[
                          Icon(
                            Icons.yard,
                            size: 30,
                          ),
                          SizedBox(
                            width: 40,
                          ),
                          Text('center', style: TextStyle(fontSize: 20)),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: const <Widget>[
                          Icon(
                            Icons.email,
                            size: 30,
                          ),
                          SizedBox(width: 40),
                          Text('amoghballolli@gmail.com',
                              style: TextStyle(fontSize: 20)),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: const <Widget>[
                          Icon(Icons.phone, size: 30),
                          SizedBox(width: 40),
                          Text('7975078414', style: TextStyle(fontSize: 20)),
                        ],
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 100,
                ),
                const Padding(
                  padding: EdgeInsets.all(15.0),
                  child: Text(
                      'About me: "As an aspiring Flutter developer, I am passionate about creating innovative mobile applications. With a strong foundation in programming and experience in various technologies, I am eager to leverage my skills to develop high-quality Flutter apps. My collaborative approach, problem-solving skills, and attention to detail make me a valuable asset in delivering exceptional results."'),
                ),
                const SizedBox(
                  height: 85,
                ),
                const Text('Created by Amogh '),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
