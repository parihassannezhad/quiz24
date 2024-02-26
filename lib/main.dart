import 'dart:async';

import 'package:flutter/cupertino.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:quiz24/bloc/home_bloc.dart';

import 'bloc/api_state.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: HomaPage(),
    );
  }
}

class HomaPage extends StatefulWidget {
  const HomaPage({super.key});

  @override
  State<HomaPage> createState() => _HomaPageState();
}

class _HomaPageState extends State<HomaPage> with TickerProviderStateMixin {
  int _secondsRemining = 3 * 24 * 60 * 60;
  int currentIndex = 0;

  @override
  void initState() {
    super.initState();
    Timer.periodic(const Duration(seconds: 1), (Timer timer) {
      setState(() {
        if (_secondsRemining > 0) {
          _secondsRemining--;
        } else {
          timer.cancel();
        }
      });
    });
  }

  String _formatTime(int seconds) {
    int days = seconds ~/ (24 * 60 * 60);
    int hours = (seconds % (24 * 60 * 60)) ~/ 3600;
    int minutes = (seconds % 3600) ~/ 60;
    int remainingSeconds = seconds % 60;

    return '${days.toString().padLeft(2, '0')}:${hours.toString().padLeft(2, '0')}:${minutes.toString().padLeft(2, '0')}:${remainingSeconds.toString().padLeft(2, '0')}';
  }

  @override
  Widget build(BuildContext context) {
    final List<String> imageUrls = [
      'assets/img/placeHolder.png',
      'assets/img/placeHolder.png',
      'assets/img/placeHolder.png',
    ];

    final Shader linearGradient = const LinearGradient(
      colors: [Color(0xffDB006F), Color(0xffAE2BB6)],
    ).createShader(const Rect.fromLTWH(0.0, 0.0, 200.0, 70.0));
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Column(
              children: [
                SizedBox(
                  height: 240,
                  child: Stack(
                    children: [
                      Container(
                        width: 540,
                        height: 220,
                        decoration: const BoxDecoration(
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(130),
                              bottomRight: Radius.circular(130),
                            ),
                            gradient: LinearGradient(
                                begin: Alignment.topRight,
                                colors: [
                                  Color(0xffDB006F),
                                  Color(0xffAE2BB6)
                                ])),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 35, right: 35),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              width: 65,
                              height: 31,
                              decoration: const BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(8),
                                    bottomRight: Radius.circular(8),
                                  )),
                              child: Center(
                                child: Text(
                                  'نسخه رایگان',
                                  style: TextStyle(
                                      foreground: Paint()
                                        ..shader = linearGradient,
                                      fontSize: 10,
                                      fontWeight: FontWeight.w700),
                                ),
                              ),
                            ),
                            const Icon(
                              Icons.menu,
                              color: Colors.white,
                              size: 24,
                            ),
                          ],
                        ),
                      ),
                      Positioned(
                        top: 45,
                        right: 20,
                        child: SizedBox(
                          height: 200,
                          child: Container(
                            width: 368,
                            height: 240,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(55)),
                            child: SizedBox(
                              height: 240,
                              child: PageView.builder(
                                itemCount: imageUrls.length,
                                physics: const BouncingScrollPhysics(),
                                controller: PageController(
                                    initialPage: 2, viewportFraction: 1),
                                onPageChanged: (value) {
                                  currentIndex = value;
                                  setState(() {});
                                },
                                itemBuilder: (context, index) {
                                  return Stack(
                                    children: [
                                      Container(
                                        width: 398,
                                        height: 240,
                                        margin: const EdgeInsets.all(8),
                                        clipBehavior: Clip.antiAlias,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(35),
                                        ),
                                        child: Image.asset(
                                          imageUrls[index],
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      Positioned(
                                        top: 135,
                                        right: 9,
                                        child: Container(
                                          width: 351,
                                          height: 55,
                                          decoration: const BoxDecoration(
                                              gradient: LinearGradient(
                                                  begin: Alignment.bottomLeft,
                                                  colors: [
                                                    Color(0xffDB006F),
                                                    Color(0xffAE2BB6)
                                                  ]),
                                              borderRadius: BorderRadius.only(
                                                bottomLeft: Radius.circular(35),
                                                bottomRight:
                                                    Radius.circular(35),
                                              )),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              RichText(
                                                text: const TextSpan(
                                                  text: 'متمایز باشید با ',
                                                  style: TextStyle(
                                                    fontSize: 14,
                                                    color: Colors.white,
                                                  ),
                                                  children: <TextSpan>[
                                                    TextSpan(
                                                      text: 'آزمون های ما',
                                                      style: TextStyle(
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              SizedBox(
                                                width: 10,
                                              ),
                                              Image.asset(
                                                  'assets/img/arrow_left.png'),
                                            ],
                                          ),
                                        ),
                                      )
                                    ],
                                  );
                                },
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                TabPageSelector(
                  controller: TabController(
                    length: imageUrls.length,
                    initialIndex: currentIndex,
                    vsync: this,
                  ),
                  selectedColor: Color(0xffAE2BB6),
                  color: Colors.grey.shade300,
                  indicatorSize: 8,
                  borderStyle: BorderStyle.none,
                ),
                const SizedBox(
                  height: 100,
                  child: MenuItem(
                    imagePath: 'assets/img/1.png',
                    title: 'مطالعه هوشمند',
                    tagTitle: 'متمایز',
                  ),
                ),
                const SizedBox(
                  height: 100,
                  child: MenuItem(
                    imagePath: 'assets/img/2.png',
                    title: 'آزمون چندسطحی',
                    tagTitle: 'تستی',
                  ),
                ),
                const SizedBox(
                  height: 120,
                  child: MenuItem(
                    imagePath: 'assets/img/3.png',
                    title: 'نمونه سوال امتحانی',
                    tagTitle: 'تشریحی',
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset('assets/img/line.png'),
                    const SizedBox(width: 4),
                    Image.asset('assets/img/clock.png'),
                    const SizedBox(
                      width: 5,
                    ),
                    Text(
                      'آزمون هماهنگ کشوری',
                      style: TextStyle(
                          foreground: Paint()..shader = linearGradient,
                          fontSize: 14,
                          fontWeight: FontWeight.w400),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
          Image.asset('assets/img/clock.png'),
                    const SizedBox(width: 4),
                    Image.asset('assets/img/line.png'),
                  ],
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 52,
                      height: 35,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.grey.shade100,
                        border: Border.all(
                          color: const Color(0xffAE2BB6),
                          width: 1,
                        ),
                      ),
                      padding: const EdgeInsets.all(8),
                      child: Center(
                        child: Text(
                          _formatTime(_secondsRemining).split(':')[0],
                          // عدد روز
                          style: TextStyle(
                            foreground: Paint()..shader = linearGradient,
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    const Text(
                      ':',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w900,
                          color: Color(0xffAE2BB6)),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Container(
                      width: 52,
                      height: 35,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.grey.shade100,
                        border: Border.all(
                          color: const Color(0xffAE2BB6),
                          width: 1,
                        ),
                      ),
                      padding: const EdgeInsets.all(8),
                      child: Center(
                        child: Text(
                          _formatTime(_secondsRemining).split(':')[1],
                          // عدد روز
                          style: TextStyle(
                            foreground: Paint()..shader = linearGradient,
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    const Text(
                      ':',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w900,
                          color: Color(0xffAE2BB6)),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Container(
                      width: 52,
                      height: 35,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.grey.shade100,
                        border: Border.all(
                          color: const Color(0xffAE2BB6),
                          width: 1,
                        ),
                      ),
                      padding: const EdgeInsets.all(8),
                      child: Center(
                        child: Text(
                          _formatTime(_secondsRemining).split(':')[2],
                          // عدد روز
                          style: TextStyle(
                            fontSize: 12,
                            foreground: Paint()..shader = linearGradient,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    const Text(
                      ':',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w900,
                          color: Color(0xffAE2BB6)),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Container(
                      width: 52,
                      height: 35,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.grey.shade100,
                        border: Border.all(
                          color: const Color(0xffAE2BB6),
                          width: 1,
                        ),
                      ),
                      padding: const EdgeInsets.all(8),
                      child: Center(
                        child: Text(
                          _formatTime(_secondsRemining).split(':')[3],
                          // عدد روز
                          style: TextStyle(
                            foreground: Paint()..shader = linearGradient,
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                  ],
                ),
              ],
            ),
            Positioned(
              bottom: 0,
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 95,
                color: Colors.white,
                child: Stack(
                  children: [
                    Image.asset('assets/img/navigation.png'),
                    Positioned(
                        left: 60,
                        top: 12,
                        child: InkWell(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => BlocProvider(
  create: (context) => HomeBloc(),
  child:  ProfileScreen(),
),
                            ));
                          },
                          child: Column(
                            children: [
                              Image.asset('assets/img/profile.png'),
                              const SizedBox(
                                height: 10,
                              ),
                              const Text(
                                'پروفایل',
                                style: TextStyle(
                                    color: Color(0xff2B396B),
                                    fontWeight: FontWeight.w700,
                                    fontSize: 16),
                              )
                            ],
                          ),
                        )),
                    Positioned(
                        right: 60,
                        top: 12,
                        child: InkWell(
                          onTap: () {},
                          child: Column(
                            children: [
                              Image.asset('assets/img/plus.png'),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                'آزمون',
                                style: TextStyle(
                                    foreground: Paint()
                                      ..shader = linearGradient,
                                    fontWeight: FontWeight.w700,
                                    fontSize: 16),
                              )
                            ],
                          ),
                        )),
                  ],
                ),
              ),
            ),
            Positioned(
              left: 175,
              bottom: 50,
              child: Image.asset('assets/img/logo.png'),
            )
          ],
        ),
      ),
    );
  }
}

class MenuItem extends StatelessWidget {
  final String imagePath;
  final String title;
  final String tagTitle;

  const MenuItem({
    super.key,
    required this.imagePath,
    required this.title,
    required this.tagTitle,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          top: 10,
          right: 30,
          child: Container(
            width: 345,
            height: 86,
            decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: const Color(0xffAE2BB6)),
                borderRadius: BorderRadius.circular(20)),
          ),
        ),
        Positioned(
          top: 0,
          right: 25,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 35, right: 10),
                child: Container(
                  width: 37,
                  height: 17,
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.bottomLeft,
                        colors: [Color(0xffDB006F), Color(0xffAE2BB6)]),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(5),
                      topRight: Radius.circular(5),
                      topLeft: Radius.circular(5),
                    ),
                  ),
                  child: Center(
                      child: Text(
                    tagTitle,
                    style: const TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 10,
                        color: Colors.white),
                  )),
                ),
              ),
              SizedBox(
                width: 108,
                child: Text(
                  textAlign: TextAlign.end,
                  title,
                  style: const TextStyle(
                      fontSize: 14, fontWeight: FontWeight.w500),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              const Icon(
                CupertinoIcons.arrow_left,
                color: Color(0xffAE2BB6),
                size: 18,
              ),
              const SizedBox(
                width: 12,
              ),
              Padding(
                padding: const EdgeInsets.only(right: 10),
                child: SizedBox(
                    width: 128, height: 96, child: Image.asset(imagePath)),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class ProfileScreen extends StatefulWidget {
  @override
  State<ProfileScreen> createState() => _HomePageState();
}

class _HomePageState extends State<ProfileScreen> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<HomeBloc>(context).add(LoadProductEvent());
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          floatingActionButton: SizedBox(
            width: 340,
            child: FloatingActionButton.extended(
                backgroundColor: Colors.purple.shade200,
                onPressed: ()  {

                },
                label: const Text(
                  'دیتا فیک هستند .( انتقال صفحه و مدیریت اتصال به ای پی ای با بلاک ) ',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.w700),
                )),
          ),
          floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
          body: BlocBuilder<HomeBloc, HomeState>(
            builder: (context, state) {
              if (state.apiState is APILoading ) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state.apiState is ApiError) {
                return Center(
                  child: Text((state.apiState as ApiError).error),
                );
              } else if (state.apiState is ApiCompleted) {
                final data = (state.apiState as ApiCompleted).data['data'] as List;
                return ListView.builder(

                    itemCount: data.length,
                    itemBuilder: (context, index) {
                      final product=data[index];
                      return ListTile(
                        title: Text('slug: ${product['slug']}'),
                        trailing: Text(product['id'].toString()),

                      );
                    },);
               
              }
              return Container();
            },
          ),
        ));
  }
}
