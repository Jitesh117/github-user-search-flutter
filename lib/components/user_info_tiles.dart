import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class InfoTile extends StatefulWidget {
  const InfoTile({Key? key, required this.iconName, required this.info})
      : super(key: key);

  final IconData iconName;
  final String info;

  @override
  State<InfoTile> createState() => _InfoTileState();
}

class _InfoTileState extends State<InfoTile> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // icon
        FaIcon(
          widget.iconName,
          color: Colors.deepPurple.shade400,
        ),
        const SizedBox(
          width: 5,
        ),
        Text(
          widget.info,
          style: GoogleFonts.spaceMono(
            textStyle: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}
