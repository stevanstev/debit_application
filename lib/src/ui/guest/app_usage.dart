import 'package:carousel_slider/carousel_slider.dart';
import 'package:debit/src/blocs/app_usage_bloc.dart';
import 'package:debit/src/events/app_usage_event.dart';
import 'package:debit/src/states/app_usage_state.dart';
import 'package:debit/src/ui/guest/login.dart';
import 'package:debit/src/ui/utils/colors.dart';
import 'package:debit/src/ui/utils/debit_buttons.dart';
import 'package:debit/src/ui/utils/dot_shape.dart';
import 'package:debit/src/ui/utils/strings.dart';
import 'package:flutter/material.dart';

class AppUsage extends StatefulWidget {
  @override
  _AppUsage createState() => _AppUsage();
}

class _AppUsage extends State<AppUsage> {
  CarouselController _controller = CarouselController();
  AppUsageBloc _bloc = AppUsageBloc();

  @override
  void dispose() {
    super.dispose();
    _bloc.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: debitGrey100,
      body: StreamBuilder(
          stream: _bloc.stateStream,
          initialData: GetImagesIndexState(currentIndex: 0),
          builder: (BuildContext ctx, AsyncSnapshot snapshot) {
            if (!snapshot.hasData) {
              return CircularProgressIndicator();
            }

            return ListView(
              padding: EdgeInsets.only(right: 10, left: 10),
              children: [
                Stack(children: [
                  CarouselSlider(
                      carouselController: _controller,
                      items: _bloc.images.map((i) {
                        return Builder(
                          builder: (BuildContext context) {
                            return Container(
                                decoration: BoxDecoration(border: Border()),
                                width: MediaQuery.of(context).size.width,
                                child: Stack(
                                  children: [
                                    Image(
                                      fit: BoxFit.cover,
                                      height:
                                          MediaQuery.of(context).size.height,
                                      width: MediaQuery.of(context).size.width,
                                      image: AssetImage('assets/images/$i'),
                                    ),
                                  ],
                                ));
                          },
                        );
                      }).toList(),
                      options: CarouselOptions(
                          onPageChanged: (index, reason) {
                            setState(() {
                              _bloc.eventSink.add(
                                  SetImagesIndexEvent(currentIndex: index));
                            });
                          },
                          viewportFraction: 1,
                          pageSnapping: true,
                          initialPage: snapshot.data.currentIndex,
                          enlargeCenterPage: true,
                          height: MediaQuery.of(context).size.height * 0.9)),
                  Positioned(
                      bottom: 30,
                      left: 0,
                      right: 0,
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: _bloc.images.map((items) {
                            int index = _bloc.images.indexOf(items);
                            return Row(
                              children: [
                                DotShape(
                                  opacity: (index == snapshot.data.currentIndex)
                                      ? 0.8
                                      : 0.3,
                                ),
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.02,
                                ),
                              ],
                            );
                          }).toList())),
                ]),
                debitDefaultButton(
                  splashColor: debitBlue800,
                  buttonColor: debitBlue900,
                  top: 10,
                  onTap: () {
                    Navigator.of(context).pushReplacement(
                      PageRouteBuilder(
                          transitionsBuilder:
                              (context, animation, secondaryAnimation, child) {
                            var begin = Offset(0.0, 1.0);
                            var end = Offset.zero;
                            var tween = Tween(begin: begin, end: end);
                            var offsetAnimation = animation.drive(tween);
                            return SlideTransition(
                              position: offsetAnimation,
                              child: child,
                            );
                          },
                          pageBuilder:
                              (context, animation, secondaryAnimation) =>
                                  Login()),
                    );
                  },
                  labelColor: debitWhite,
                  width: MediaQuery.of(context).size.width * 0.8,
                  height: MediaQuery.of(context).size.height * 0.06,
                  label: appUsageButton,
                )
              ],
            );
          }),
    );
  }
}
