import 'package:flutter/material.dart';
import 'package:tv_display/logic/listing_model.dart';
import 'package:tv_display/slides/page/entry/entry.dart';

class SlidePage extends StatelessWidget {
  final List<Listing> listings;

  SlidePage({@required this.listings});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SlideEntry(listing: listings[0]),
        SlideEntry(listing: listings[1]),
      ],
    );
  }
}
