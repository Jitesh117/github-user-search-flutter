import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class InfoTile extends StatelessWidget {
  const InfoTile({Key? key, required this.iconName,required this.info}) : super(key: key);

  final IconData iconName;
  final String info;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        FaIcon(iconName),
        const SizedBox(
          width: 5,
        ),
        Text(info),
      ],
    );
  }
}
