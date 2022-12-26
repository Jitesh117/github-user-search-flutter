import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:github_user_search/components/user_info_tiles.dart';

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
            // Logo and theme toggle Button
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('GitHub Finder'),
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.sunny),
                )
              ],
            ),

            // username input field
            TextField(
              decoration: InputDecoration(
                suffixIcon: IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.search,
                  ),
                ),
                hintText: 'Search GitHub username',
                enabledBorder: OutlineInputBorder(),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                  color: Colors.blue,
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
                    Text('The Octocat'),
                    Text('@Octocat'),
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
                Text('This user has no bio'),
              ],
            ),

            const SizedBox(
              height: 10,
            ),
            // repos, Followers, Following
            Container(
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.deepPurple.shade200,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Repos
                  Column(
                    children: [Text('Repos'), Text('8')],
                  ),
                  // Followers
                  Column(
                    children: [Text('Followers'), Text('7857')],
                  ),
                  // Following
                  Column(
                    children: [Text('Following'), Text('9')],
                  )
                ],
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
