import 'dart:convert';
import 'package:tv_display/logic/listing_model.dart';
import 'package:xml2json/xml2json.dart';
import 'package:http/http.dart' as http;

abstract class XMLParse {
  static Future<List<Listing>> process() async {
    Map<String, String> headers = {
      "Accept": 'text/html,application/xml',
      'Content-Type': 'application/json; text/xml;charset=UTF-8'
    };
    final response = await http.get(
      'https://franklin.hr/listings_xml/indomio',
      headers: headers,
    );

    final xmlConverter = Xml2Json();
    xmlConverter.parse(Utf8Decoder().convert(response.bodyBytes));

    final json = xmlConverter.toGData();

    final Franklin franklin = franklinFromJson(json);

    return franklin.listings.listings.listing;
  }
}
