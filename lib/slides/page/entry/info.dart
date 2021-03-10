import 'package:flutter/material.dart';

class EntryInfo extends StatelessWidget {
  final String label, info;

  EntryInfo({@required this.label, @required this.info});

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        style: const TextStyle(
          color: Colors.black,
          fontSize: 16,
        ),
        children: <InlineSpan>[
          TextSpan(text: '$label: '),
          TextSpan(
            text: info,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
