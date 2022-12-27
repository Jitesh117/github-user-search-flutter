import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:github_user_search/components/focused_text.dart';
import 'package:github_user_search/components/user_info_tiles.dart';
import 'package:google_fonts/google_fonts.dart';

class GitHubUser extends StatefulWidget {
  GitHubUser({Key? key}) : super(key: key);

  @override
  State<GitHubUser> createState() => _GitHubUserState();
}

class _GitHubUserState extends State<GitHubUser> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Logo and github logo
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'GitHub Finder',
                  style: GoogleFonts.spaceMono(
                    textStyle: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                FaIcon(
                  FontAwesomeIcons.github,
                  color: Colors.white,
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),

            // username input field
            TextField(
              style: GoogleFonts.spaceMono(
                  textStyle: TextStyle(
                color: Colors.white,
                fontSize: 12,
              )),
              decoration: InputDecoration(
                suffixIcon: IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.search,
                  ),
                ),
                hintText: 'Search GitHub username',
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.deepPurple.shade300,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                  color: Colors.white,
                )),
              ),
            ),

            const SizedBox(
              height: 30,
            ),

            // User info
            //  pfp and username, user's Name
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CircleAvatar(
                  backgroundImage: AssetImage('lib/assets/pfp.png'),
                  radius: 30,
                ),
                Column(
                  children: [
                    Text(
                      'The Octocat',
                      style: GoogleFonts.spaceMono(
                        textStyle: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Text(
                      '@Octocat',
                      style: GoogleFonts.spaceMono(
                        textStyle: TextStyle(
                          color: Colors.deepPurple,
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
            SizedBox(
              height: 10,
            ),
            // Bio
            Row(
              children: [
                Text(
                  'This user has no bio',
                  style: GoogleFonts.spaceMono(
                    textStyle: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(
              height: 10,
            ),
            // repos, Followers, Following
            Neumorphic(
              style: NeumorphicStyle(
                  shape: NeumorphicShape.concave,
                  boxShape:
                      NeumorphicBoxShape.roundRect(BorderRadius.circular(12)),
                  depth: 8,
                  intensity: 0.5,
                  lightSource: LightSource.topLeft,
                  color: Colors.deepPurple.shade200),
              child: Container(
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.deepPurple.shade200,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Repos
                    FocusedText(description: 'Repos', value: '8'),
                    // Followers
                    FocusedText(description: 'Followers', value: '7857'),
                    // Following
                    FocusedText(description: 'Following', value: '9'),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 16,
            ),

            // Location, link, twitter,  Organisation
            Column(
              children: const [
                InfoTile(
                    iconName: FontAwesomeIcons.locationDot,
                    info: 'San Fransisco'),
                SizedBox(
                  height: 10,
                ),
                // Link
                InfoTile(
                    iconName: FontAwesomeIcons.link,
                    info: 'https://github.blog'),
                SizedBox(
                  height: 10,
                ),

                // Twitter
                InfoTile(
                    iconName: FontAwesomeIcons.twitter, info: 'Not available'),
                SizedBox(
                  height: 10,
                ),
                // Organisation
                InfoTile(iconName: FontAwesomeIcons.building, info: '@github'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
