import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tv_display/logic/listing_model.dart';
import 'package:tv_display/logic/xml_parse.dart';
import 'package:tv_display/slides/bottom_info.dart';
import 'package:tv_display/slides/page/slide_page.dart';
import 'package:wakelock/wakelock.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final listings = await XMLParse.process();

  Wakelock.enable();

  SystemChrome.setEnabledSystemUIOverlays([]);

  runApp(Slides(listings));
}

class Slides extends StatelessWidget {
  final List<Listing> listings;

  Slides(this.listings);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Display(listings),
    );
  }
}

class Display extends StatefulWidget {
  final List<Listing> listings;

  Display(this.listings);

  @override
  _DisplayState createState() => _DisplayState();
}

class _DisplayState extends State<Display> {
  int _page = 0;

  PageController _pageController = PageController();

  Timer _pageTimer;
  Timer _updateTimer;

  List<Listing> _listings;
  List<SlidePage> _slides = [];

  bool _cached = false;

  @override
  void initState() {
    super.initState();
    _listings = widget.listings;
    _listings.removeWhere((listing) => listing.transaction?.t == 'rent');

    for (var i = 0;
        i <
            (_listings.length % 2 == 0
                ? _listings.length
                : _listings.length + 1);
        i += 2)
      _slides.add(
        SlidePage(
          listings: [
            _listings[i],
            i + 1 <= _listings.length - 1 ? _listings[i + 1] : _listings[0],
          ],
        ),
      );

    WidgetsBinding.instance.addPostFrameCallback(
      (_) => Future.forEach(
        _listings,
        (listing) async => await precacheImage(
          NetworkImage(listing.files.files.first.t),
          context,
        ),
      ).whenComplete(
        () {
          _pageTimer = Timer.periodic(
            const Duration(seconds: 10),
            (_) {
              if (_slides.length > 1) {
                _pageController
                    .jumpToPage(_page < _slides.length - 1 ? _page + 1 : 0);
                _page = _pageController.page.round();
              }
            },
          );

          _updateTimer = Timer.periodic(
            const Duration(hours: 12),
            (_) async {
              final listings = await XMLParse.process();
              setState(() {
                _slides.clear();
                for (var i = 0;
                    i <
                        (listings.length % 2 == 0
                            ? listings.length
                            : listings.length + 1);
                    i += 2)
                  _slides.add(
                    SlidePage(
                      listings: [
                        listings[i],
                        i + 1 <= listings.length - 1
                            ? listings[i + 1]
                            : listings[0],
                      ],
                    ),
                  );
              });
            },
          );

          setState(() => _cached = true);
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _cached
        ? RotatedBox(
            quarterTurns: 3,
            child: Column(
              children: [
                _slides.isEmpty
                    ? Center(child: Text('Dodajte slideove za prikaz'))
                    : Expanded(
                        child: PageView(
                          controller: _pageController,
                          physics: const NeverScrollableScrollPhysics(),
                          children: _slides,
                        ),
                      ),
                BottomInfo(),
              ],
            ),
          )
        : Center(child: CircularProgressIndicator());
  }

  @override
  void dispose() {
    _pageTimer.cancel();
    _updateTimer.cancel();
    _pageController.dispose();
    super.dispose();
  }
}
