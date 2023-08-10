import 'package:reddit_clone/product/constans/string_constans.dart';

class DrawerModel {
  final String username;
  final String image;

  DrawerModel(
    this.username,
    this.image,
  );
}

final List<DrawerModel> community = [
  DrawerModel(
    StringConstants.redditCommunityText,
    StringConstants.redditCommunityImage,
  ),
  DrawerModel(
    StringConstants.compsciText,
    StringConstants.compsciImage,
  ),
  DrawerModel(
    StringConstants.flutterDevText,
    StringConstants.flutterDevImage,
  ),
  DrawerModel(
    StringConstants.flutterHelpText,
    StringConstants.flutterHelpImage,
  ),
  DrawerModel(
    StringConstants.photoShopText,
    StringConstants.photoShopImage,
  ),
];
