import 'package:carousel_slider/carousel_slider.dart';
import 'package:custom_clippers/custom_clippers.dart';
import 'package:dicoding_taskmanager/Alert/WarningAlert.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';

class DesktopHome extends StatelessWidget {
  final BoxConstraints constraints;
  const DesktopHome({Key? key, required this.constraints}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        SizedBox(
          height: constraints.maxHeight / 2,
          width: (constraints.maxWidth * 2) / 4,
          child: ClipPath(
            clipper: SinCosineWaveClipper(),
            child: CarouselSlider(
              items: <Widget>[
                Container(
                  alignment: const Alignment(0, -0.2),
                  decoration: BoxDecoration(
                    image:DecorationImage(
                        image: const AssetImage('assets/images/home_background.png'),
                        fit: BoxFit.cover,
                        colorFilter: ColorFilter.mode(const Color(0xffF3F0D7).withOpacity(0.6), BlendMode.modulate,)
                    ),
                  ),
                  child: Text(
                    "Semangat Terus!",
                    style: TextStyle(
                      fontFamily: 'Signika',
                      fontSize: constraints.maxWidth < constraints.maxHeight? (constraints.maxWidth / 100) * 8 : (constraints.maxHeight / 100) * 8,
                      color: Colors.white70,
                    ),
                  ),
                ),
                Container(
                  alignment: const Alignment(0, -0.2),
                  decoration: BoxDecoration(
                    image:DecorationImage(
                        image: const AssetImage('assets/images/home_background.png'),
                        fit: BoxFit.cover,
                        colorFilter: ColorFilter.mode(const Color(0xffF3F0D7).withOpacity(0.6), BlendMode.modulate,)
                    ),
                  ),
                  child: Text(
                    "Sampe Kalo Mau Makan,",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'Signika',
                      fontSize: constraints.maxWidth < constraints.maxHeight? (constraints.maxWidth / 100) * 8 : (constraints.maxHeight / 100) * 8,
                      color: Colors.white70,
                    ),
                  ),
                ),
                Container(
                  alignment: const Alignment(0, -0.2),
                  decoration: BoxDecoration(
                    image:DecorationImage(
                        image: const AssetImage('assets/images/home_background.png'),
                        fit: BoxFit.cover,
                        colorFilter: ColorFilter.mode(const Color(0xffF3F0D7).withOpacity(0.6), BlendMode.modulate,)
                    ),
                  ),
                  child: Text(
                    "Gausah Mikir Keluarin Berapa",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'Signika',
                      fontSize: constraints.maxWidth < constraints.maxHeight? (constraints.maxWidth / 100) * 8 : (constraints.maxHeight / 100) * 8,
                      color: Colors.white70,
                    ),
                  ),
                ),
              ],
              options: CarouselOptions(
                enableInfiniteScroll: true,
                autoPlay: true,
                autoPlayInterval: const Duration(seconds: 3),
                autoPlayAnimationDuration: const Duration(milliseconds: 800),
                autoPlayCurve: Curves.fastOutSlowIn,
                scrollDirection: Axis.horizontal,
              ),
            ),
          ),
        ),
        Container(
          height: double.infinity,
          width: (constraints.maxWidth * 2) / 4,
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/daily-goals');
                },
                style: ElevatedButton.styleFrom(
                  fixedSize: Size(constraints.maxWidth*0.3, 60),
                  primary: const Color(0xffE2CEDB),
                ),
                child: Row(
                  children: <Widget>[
                    const Expanded(
                      flex: 2,
                      child: Center(
                        child: Icon(Icons.file_copy, color: Colors.black,),
                      ),
                    ),
                    Expanded(
                      flex: 8,
                      child: Container(
                        alignment: Alignment.centerLeft,
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: const Text('Daily Goals', style: TextStyle(color: Colors.black,),),
                      ),
                    ),
                  ],
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return const WarningAlert(warnMess: "Fitur Belum Ada");
                    },
                  );
                },
                style: ElevatedButton.styleFrom(
                  fixedSize: Size(constraints.maxWidth*0.3, 60),
                  primary: const Color(0xffCDE2F8),
                ),
                child: Row(
                  children: <Widget>[
                    const Expanded(
                      flex: 2,
                      child: Center(
                        child: Icon(
                          Icons.done_all,
                          color: Colors.black,
                          size: 42,
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 8,
                      child: Container(
                        alignment: Alignment.centerLeft,
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: const Text('Personal Wish', style: TextStyle(color: Colors.black,),),
                      ),
                    ),
                  ],
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return const WarningAlert(warnMess: "Fitur Belum Ada");
                    },
                  );
                },
                style: ElevatedButton.styleFrom(
                  fixedSize: Size(constraints.maxWidth*0.3, 60),
                  primary: const Color(0xffF2C89B),
                ),
                child: Row(
                  children: <Widget>[
                    const Expanded(
                      flex: 2,
                      child: Center(
                        child: Icon(Icons.monetization_on_outlined, color: Colors.black,),
                      ),
                    ),
                    Expanded(
                      flex: 8,
                      child: Container(
                        alignment: Alignment.centerLeft,
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: const Text('Financial Arrangements', style: TextStyle(color: Colors.black,),),
                      ),
                    ),
                  ],
                ),

              ),
            ],
          ),
        ),
      ],
    );
  }
}
