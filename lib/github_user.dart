import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:github_user_search/components/focused_text.dart';
import 'package:github_user_search/components/user_info_tiles.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class GitHubUser extends StatefulWidget {
  GitHubUser({Key? key}) : super(key: key);

  @override
  State<GitHubUser> createState() => _GitHubUserState();
}

class _GitHubUserState extends State<GitHubUser> {
  String stringResponse = '7886';
  Map mapResource = {};
  String username = "Jitesh117";
  Future fetchdata(String username) async {
    _usernamecontroller.clear();
    http.Response response;
    response =
        await http.get(Uri.parse("https://api.github.com/users/${username}"));
    setState(() {
      stringResponse = response.body.toString();
      mapResource = json.decode(stringResponse);
    });
  }

  @override
  void initState() {
    fetchdata('Octocat');
    super.initState();
  }

  final _usernamecontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Flexible(
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
                controller: _usernamecontroller,
                style: GoogleFonts.spaceMono(
                    textStyle: TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                )),
                decoration: InputDecoration(
                  suffixIcon: IconButton(
                    onPressed: () {
                      fetchdata(_usernamecontroller.text);
                    },
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
                    backgroundImage:
                        NetworkImage(mapResource['avatar_url'].toString()),
                    radius: 30,
                  ),
                  Column(
                    children: [
                      Text(
                        mapResource['name'].toString(),
                        style: GoogleFonts.spaceMono(
                          textStyle: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                      Text(
                        '@' + mapResource['login'].toString(),
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
                  Flexible(
                    child: Text(
                      mapResource['bio'].toString() != 'null'
                          ? mapResource['bio'].toString()
                          : 'This user has no bio',
                      style: GoogleFonts.spaceMono(
                        textStyle: TextStyle(
                          color: Colors.white,
                        ),
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
                      FocusedText(
                        description: 'Repos',
                        value: mapResource['public_repos'].toString(),
                      ),
                      // Followers
                      FocusedText(
                        description: 'Followers',
                        value: mapResource['followers'].toString(),
                      ),
                      // Following
                      FocusedText(
                        description: 'Following',
                        value: mapResource['following'].toString(),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 16,
              ),

              // Location, link, twitter,  Organisation
              Column(
                children: [
                  InfoTile(
                    iconName: FontAwesomeIcons.locationDot,
                    info: mapResource['location'].toString() != 'null'
                        ? mapResource['location'].toString()
                        : 'No blog mentioned',
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  // Link
                  InfoTile(
                    iconName: FontAwesomeIcons.link,
                    info: mapResource['blog'].toString() != ''
                        ? mapResource['blog'].toString()
                        : 'No blog mentioned',
                  ),
                  SizedBox(
                    height: 10,
                  ),

                  // Twitter
                  InfoTile(
                    iconName: FontAwesomeIcons.twitter,
                    info: mapResource['twitter_username'].toString() != 'null'
                        ? mapResource['twitter_username'].toString()
                        : 'Not active on twitter',
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  // Organisation
                  InfoTile(
                    iconName: FontAwesomeIcons.building,
                    info: mapResource['company'].toString() != 'null'
                        ? mapResource['company'].toString()
                        : 'No org mentioned',
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
