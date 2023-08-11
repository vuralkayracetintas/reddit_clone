import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:kartal/kartal.dart';
import 'package:reddit_clone/product/constans/string_constans.dart';
import 'package:reddit_clone/product/model/drawer_model.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: const BoxDecoration(
              color: Colors.blue,
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(StringConstants.recentlyVisited,
                        style: context.general.textTheme.titleMedium),
                    InkWell(
                      onTap: () {},
                      child: Text(
                        StringConstants.seeAll,
                        style: context.general.textTheme.titleMedium,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    CircleAvatar(
                        radius: 20,
                        backgroundImage:
                            AssetImage(StringConstants.flutterDevImage)),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(StringConstants.flutterDevText),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    CircleAvatar(
                      radius: 20,
                      backgroundImage:
                          AssetImage(StringConstants.flutterHelpImage),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(StringConstants.flutterHelpText),
                  ],
                ),
              ],
            ),
          ),
          ListTile(
            leading: const FaIcon(FontAwesomeIcons.plus),
            title: Text(StringConstants.createCommunity),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          for (var item in community)
            ListTile(
              leading: CircleAvatar(
                backgroundImage: AssetImage(item.image),
              ),
              title: Text(item.username),
              onTap: () {
                Navigator.pop(context);
              },
              trailing: const FaIcon(FontAwesomeIcons.chevronRight),
            ),
          const Divider(),
          ListTile(
            leading: const FaIcon(FontAwesomeIcons.redditAlien),
            title: Text(StringConstants.settingsText),
            onTap: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
