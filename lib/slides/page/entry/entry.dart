import 'package:flutter/material.dart';
import 'package:tv_display/logic/listing_model.dart';
import 'package:tv_display/slides/page/entry/info.dart';
import 'package:intl/intl.dart';

class SlideEntry extends StatelessWidget {
  final Listing listing;

  SlideEntry({@required this.listing});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.height,
      height: MediaQuery.of(context).size.width / 2 - 52,
      child: Stack(
        children: [
          Image.network(
            listing.files.files.first.t,
            height: MediaQuery.of(context).size.width / 2 - 52,
            width: MediaQuery.of(context).size.height,
            fit: BoxFit.cover,
          ),
          if (listing.price.t != null)
            Positioned(
              top: 16,
              right: 16,
              child: DecoratedBox(
                decoration: BoxDecoration(
                  color: const Color(0xfff6c381),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(14),
                  child: Material(
                    color: Colors.transparent,
                    child: Text(
                      NumberFormat().format(double.parse(listing.price.t)) +
                          ' €',
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                        fontSize: 26,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          Positioned(
            left: 16,
            bottom: 16,
            right: 16,
            child: DecoratedBox(
              decoration: BoxDecoration(
                color: Colors.white70,
              ),
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: Row(
                    children: [
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          EntryInfo(
                            label: 'Lokacija',
                            info: listing.location.town?.t ?? '',
                          ),
                          EntryInfo(
                            label: 'Vrsta',
                            info: listing.category.hr.cdata,
                          ),
                          EntryInfo(
                            label: 'Površina',
                            info: (double.parse(listing.squareSize.t)
                                        .toStringAsFixed(0) ??
                                    '') +
                                ' m²',
                          ),
                          listing.category.hr.cdata == 'Zemljište'
                              ? EntryInfo(
                                  label: 'Građevinsko',
                                  info: listing.attributes?.attribute
                                              ?.firstWhere(
                                                  (e) =>
                                                      e.name ==
                                                      'Građevinska dozvola',
                                                  orElse: () => null)
                                              ?.value ==
                                          '1'
                                      ? 'Da'
                                      : 'Ne',
                                )
                              : EntryInfo(
                                  label: 'Spavaće sobe',
                                  info: listing.bedrooms?.t ?? '',
                                ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            listing.category.hr.cdata == 'Zemljište'
                                ? EntryInfo(
                                    label: 'Namjena',
                                    info: listing.attributes?.attribute
                                            ?.firstWhere(
                                                (e) => e.name == 'Namjena',
                                                orElse: () => null)
                                            ?.value ??
                                        '',
                                  )
                                : EntryInfo(
                                    label: 'WC',
                                    info: listing.toiletRooms?.t ?? '',
                                  ),
                            listing.category.hr.cdata == 'Zemljište'
                                ? EntryInfo(
                                    label: 'Uporabna',
                                    info: listing.attributes?.attribute
                                                ?.firstWhere(
                                                    (e) =>
                                                        e.name ==
                                                        'Uporabna dozvola',
                                                    orElse: () => null)
                                                ?.value ==
                                            '1'
                                        ? 'Ima'
                                        : 'Nema',
                                  )
                                : EntryInfo(
                                    label: 'Kupaonica',
                                    info: listing.bathrooms?.t ?? '',
                                  ),
                            listing.category.hr.cdata == 'Zemljište'
                                ? Text(
                                    '',
                                    style: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 16,
                                    ),
                                  )
                                : EntryInfo(
                                    label: 'Parking',
                                    info: (listing.attributes?.attribute
                                                    ?.firstWhere(
                                                        (e) =>
                                                            e?.name ==
                                                            'Parkirna mjesta',
                                                        orElse: () => null)
                                                    ?.value ??
                                                '')
                                            .startsWith('bez')
                                        ? 'Nema'
                                        : listing.attributes?.attribute
                                            ?.firstWhere(
                                                (e) =>
                                                    e?.name ==
                                                    'Parkirna mjesta',
                                                orElse: () => null)
                                            ?.value,
                                  ),
                            listing.category.hr.cdata == 'Zemljište'
                                ? Text(
                                    '',
                                    style: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 16,
                                    ),
                                  )
                                : EntryInfo(
                                    label: 'Kat',
                                    info: (listing.floor?.t ?? '')
                                            .startsWith('Visoko')
                                        ? 'Prizemlje'
                                        : listing.floor?.t,
                                  ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Center(
                          child: RichText(
                            textAlign: TextAlign.center,
                            text: TextSpan(
                              style: const TextStyle(color: Colors.black),
                              children: <InlineSpan>[
                                TextSpan(
                                  text: (double.parse(listing.price.t) /
                                              double.parse(
                                                  listing.squareSize.t))
                                          .round()
                                          .toString() +
                                      '\n',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.green.shade300,
                                    fontSize: 32,
                                  ),
                                ),
                                TextSpan(
                                  text: (listing.price.t.startsWith('1') &&
                                              !listing.price.t.endsWith('1')
                                          ? ' '
                                          : '') +
                                      'EUR / m²',
                                  style: const TextStyle(
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
