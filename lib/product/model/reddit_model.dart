// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

RedditModel redditModelFromMap(String str) =>
    RedditModel.fromMap(json.decode(str));

String redditModelToMap(RedditModel data) => json.encode(data.toMap());

class RedditModel {
  String kind;
  RedditModelData data;

  RedditModel({
    required this.kind,
    required this.data,
  });

  factory RedditModel.fromMap(Map<String, dynamic> json) => RedditModel(
        kind: json["kind"],
        data: RedditModelData.fromMap(json["data"]),
      );

  Map<String, dynamic> toMap() => {
        "kind": kind,
        "data": data.toMap(),
      };
}

class RedditModelData {
  int dist;

  List<Child> children;
  String before;

  RedditModelData({
    required this.dist,
    required this.children,
    required this.before,
  });

  factory RedditModelData.fromMap(Map<String, dynamic> json) => RedditModelData(
        dist: json["dist"],
        children:
            List<Child>.from(json["children"].map((x) => Child.fromMap(x))),
        before: json["before"],
      );

  Map<String, dynamic> toMap() => {
        "dist": dist,
        "children": List<dynamic>.from(children.map((x) => x.toMap())),
        "before": before,
      };
}

class Child {
  Kind kind;
  ChildData data;

  Child({
    required this.kind,
    required this.data,
  });

  factory Child.fromMap(Map<String, dynamic> json) => Child(
        kind: kindValues.map[json["kind"]]!,
        data: ChildData.fromMap(json["data"]),
      );

  Map<String, dynamic> toMap() => {
        "kind": kindValues.reverse[kind],
        "data": data.toMap(),
      };
}

class ChildData {
  dynamic approvedAtUtc;
  Subreddit subreddit;
  String selftext;
  String authorFullname;
  bool saved;
  dynamic modReasonTitle;
  int gilded;
  bool clicked;
  String title;
  List<dynamic> linkFlairRichtext;
  SubredditNamePrefixed subredditNamePrefixed;
  bool hidden;
  int pwls;
  String linkFlairCssClass;
  int downs;
  int? thumbnailHeight;
  dynamic topAwardedType;
  bool hideScore;
  String name;
  bool quarantine;
  // LinkFlairTextColor linkFlairTextColor;
  double upvoteRatio;
  String authorFlairBackgroundColor;
  String linkFlairBackgroundColor;
  int ups;
  int totalAwardsReceived;
  MediaEmbed mediaEmbed;
  int? thumbnailWidth;
  dynamic authorFlairTemplateId;
  bool isOriginalContent;
  List<dynamic> userReports;
  Media? secureMedia;
  bool isRedditMediaDomain;
  bool isMeta;
  dynamic category;
  MediaEmbed secureMediaEmbed;
  bool canModPost;
  int score;
  dynamic approvedBy;
  bool isCreatedFromAdsUi;
  bool authorPremium;
  String thumbnail;
  // bool edited;
  AuthorFlairCssClass authorFlairCssClass;
  List<dynamic> authorFlairRichtext;
  Gildings gildings;
  String? postHint;
  dynamic contentCategories;
  bool isSelf;
  SubredditType subredditType;
  double created;
  FlairType linkFlairType;
  int wls;
  dynamic removedByCategory;
  dynamic bannedBy;
  FlairType authorFlairType;
  String domain;
  bool allowLiveComments;
  String? selftextHtml;
  dynamic likes;
  dynamic suggestedSort;
  dynamic bannedAtUtc;
  String? urlOverriddenByDest;
  dynamic viewCount;
  bool archived;
  bool noFollow;
  bool isCrosspostable;
  bool pinned;
  bool over18;
  Preview? preview;
  List<dynamic> allAwardings;
  List<dynamic> awarders;
  bool mediaOnly;
  String linkFlairTemplateId;
  bool canGild;
  bool spoiler;
  bool locked;
  String authorFlairText;
  List<dynamic> treatmentTags;
  bool visited;
  dynamic removedBy;
  dynamic modNote;
  dynamic distinguished;
  SubredditId subredditId;
  bool authorIsBlocked;
  dynamic modReasonBy;
  dynamic numReports;
  dynamic removalReason;
  String linkFlairText;
  String id;
  bool isRobotIndexable;
  dynamic reportReasons;
  String author;
  dynamic discussionType;
  int numComments;
  bool sendReplies;
  WhitelistStatus whitelistStatus;
  bool contestMode;
  List<dynamic> modReports;
  bool authorPatreonFlair;
  AuthorFlairTextColor authorFlairTextColor;
  String permalink;
  WhitelistStatus parentWhitelistStatus;
  bool stickied;
  String url;
  int subredditSubscribers;
  double createdUtc;
  int numCrossposts;
  Media? media;
  bool isVideo;

  ChildData({
    this.approvedAtUtc,
    required this.subreddit,
    required this.selftext,
    required this.authorFullname,
    required this.saved,
    this.modReasonTitle,
    required this.gilded,
    required this.clicked,
    required this.title,
    required this.linkFlairRichtext,
    required this.subredditNamePrefixed,
    required this.hidden,
    required this.pwls,
    required this.linkFlairCssClass,
    required this.downs,
    this.thumbnailHeight,
    this.topAwardedType,
    required this.hideScore,
    required this.name,
    required this.quarantine,
    // required this.linkFlairTextColor,
    required this.upvoteRatio,
    required this.authorFlairBackgroundColor,
    required this.linkFlairBackgroundColor,
    required this.ups,
    required this.totalAwardsReceived,
    required this.mediaEmbed,
    this.thumbnailWidth,
    this.authorFlairTemplateId,
    required this.isOriginalContent,
    required this.userReports,
    this.secureMedia,
    required this.isRedditMediaDomain,
    required this.isMeta,
    this.category,
    required this.secureMediaEmbed,
    required this.canModPost,
    required this.score,
    this.approvedBy,
    required this.isCreatedFromAdsUi,
    required this.authorPremium,
    required this.thumbnail,
    // required this.edited,
    required this.authorFlairCssClass,
    required this.authorFlairRichtext,
    required this.gildings,
    this.postHint,
    this.contentCategories,
    required this.isSelf,
    required this.subredditType,
    required this.created,
    required this.linkFlairType,
    required this.wls,
    this.removedByCategory,
    this.bannedBy,
    required this.authorFlairType,
    required this.domain,
    required this.allowLiveComments,
    this.selftextHtml,
    this.likes,
    this.suggestedSort,
    this.bannedAtUtc,
    this.urlOverriddenByDest,
    this.viewCount,
    required this.archived,
    required this.noFollow,
    required this.isCrosspostable,
    required this.pinned,
    required this.over18,
    this.preview,
    required this.allAwardings,
    required this.awarders,
    required this.mediaOnly,
    required this.linkFlairTemplateId,
    required this.canGild,
    required this.spoiler,
    required this.locked,
    required this.authorFlairText,
    required this.treatmentTags,
    required this.visited,
    this.removedBy,
    this.modNote,
    this.distinguished,
    required this.subredditId,
    required this.authorIsBlocked,
    this.modReasonBy,
    this.numReports,
    this.removalReason,
    required this.linkFlairText,
    required this.id,
    required this.isRobotIndexable,
    this.reportReasons,
    required this.author,
    this.discussionType,
    required this.numComments,
    required this.sendReplies,
    required this.whitelistStatus,
    required this.contestMode,
    required this.modReports,
    required this.authorPatreonFlair,
    required this.authorFlairTextColor,
    required this.permalink,
    required this.parentWhitelistStatus,
    required this.stickied,
    required this.url,
    required this.subredditSubscribers,
    required this.createdUtc,
    required this.numCrossposts,
    this.media,
    required this.isVideo,
  });

  factory ChildData.fromMap(Map<String, dynamic> json) => ChildData(
        approvedAtUtc: json["approved_at_utc"],
        subreddit: subredditValues.map[json["subreddit"]]!,
        selftext: json["selftext"],
        authorFullname: json["author_fullname"],
        saved: json["saved"],
        modReasonTitle: json["mod_reason_title"],
        gilded: json["gilded"],
        clicked: json["clicked"],
        title: json["title"],
        linkFlairText: json["link_flair_text"],
        linkFlairRichtext:
            List<dynamic>.from(json["link_flair_richtext"].map((x) => x)),
        subredditNamePrefixed:
            subredditNamePrefixedValues.map[json["subreddit_name_prefixed"]]!,
        hidden: json["hidden"],
        pwls: json["pwls"],
        linkFlairCssClass: json["link_flair_css_class"],
        downs: json["downs"],
        thumbnailHeight: json["thumbnail_height"],
        topAwardedType: json["top_awarded_type"],
        hideScore: json["hide_score"],
        name: json["name"],
        quarantine: json["quarantine"],
        linkFlairBackgroundColor: json["link_flair_background_color"],
        // linkFlairTextColor:
        //     linkFlairTextColorValues.map[json["link_flair_text_color"]]!,
        upvoteRatio: json["upvote_ratio"]?.toDouble(),
        authorFlairBackgroundColor: json["author_flair_background_color"],
        ups: json["ups"],
        totalAwardsReceived: json["total_awards_received"],
        mediaEmbed: MediaEmbed.fromMap(json["media_embed"]),
        thumbnailWidth: json["thumbnail_width"],
        authorFlairTemplateId: json["author_flair_template_id"],
        isOriginalContent: json["is_original_content"],
        userReports: List<dynamic>.from(json["user_reports"].map((x) => x)),
        secureMedia: json["secure_media"] == null
            ? null
            : Media.fromMap(json["secure_media"]),
        isRedditMediaDomain: json["is_reddit_media_domain"],
        isMeta: json["is_meta"],
        category: json["category"],
        secureMediaEmbed: MediaEmbed.fromMap(json["secure_media_embed"]),
        canModPost: json["can_mod_post"],
        score: json["score"],
        approvedBy: json["approved_by"],
        isCreatedFromAdsUi: json["is_created_from_ads_ui"],
        authorPremium: json["author_premium"],
        thumbnail: json["thumbnail"],
        // edited: json["edited"],
        authorFlairCssClass:
            authorFlairCssClassValues.map[json["author_flair_css_class"]]!,
        authorFlairRichtext:
            List<dynamic>.from(json["author_flair_richtext"].map((x) => x)),
        gildings: Gildings.fromMap(json["gildings"]),
        postHint: json["post_hint"],
        contentCategories: json["content_categories"],
        isSelf: json["is_self"],
        subredditType: subredditTypeValues.map[json["subreddit_type"]]!,
        created: json["created"],
        linkFlairType: flairTypeValues.map[json["link_flair_type"]]!,
        wls: json["wls"],
        removedByCategory: json["removed_by_category"],
        bannedBy: json["banned_by"],
        authorFlairType: flairTypeValues.map[json["author_flair_type"]]!,
        domain: json["domain"],
        allowLiveComments: json["allow_live_comments"],
        selftextHtml: json["selftext_html"],
        likes: json["likes"],
        suggestedSort: json["suggested_sort"],
        bannedAtUtc: json["banned_at_utc"],
        urlOverriddenByDest: json["url_overridden_by_dest"],
        viewCount: json["view_count"],
        archived: json["archived"],
        noFollow: json["no_follow"],
        isCrosspostable: json["is_crosspostable"],
        pinned: json["pinned"],
        over18: json["over_18"],
        preview:
            json["preview"] == null ? null : Preview.fromMap(json["preview"]),
        allAwardings: List<dynamic>.from(json["all_awardings"].map((x) => x)),
        awarders: List<dynamic>.from(json["awarders"].map((x) => x)),
        mediaOnly: json["media_only"],
        linkFlairTemplateId: json["link_flair_template_id"],
        canGild: json["can_gild"],
        spoiler: json["spoiler"],
        locked: json["locked"],
        authorFlairText: json["author_flair_text"],
        treatmentTags: List<dynamic>.from(json["treatment_tags"].map((x) => x)),
        visited: json["visited"],
        removedBy: json["removed_by"],
        modNote: json["mod_note"],
        distinguished: json["distinguished"],
        subredditId: subredditIdValues.map[json["subreddit_id"]]!,
        authorIsBlocked: json["author_is_blocked"],
        modReasonBy: json["mod_reason_by"],
        numReports: json["num_reports"],
        removalReason: json["removal_reason"],
        id: json["id"],
        isRobotIndexable: json["is_robot_indexable"],
        reportReasons: json["report_reasons"],
        author: json["author"],
        discussionType: json["discussion_type"],
        numComments: json["num_comments"],
        sendReplies: json["send_replies"],
        whitelistStatus: whitelistStatusValues.map[json["whitelist_status"]]!,
        contestMode: json["contest_mode"],
        modReports: List<dynamic>.from(json["mod_reports"].map((x) => x)),
        authorPatreonFlair: json["author_patreon_flair"],
        authorFlairTextColor:
            authorFlairTextColorValues.map[json["author_flair_text_color"]]!,
        permalink: json["permalink"],
        parentWhitelistStatus:
            whitelistStatusValues.map[json["parent_whitelist_status"]]!,
        stickied: json["stickied"],
        url: json["url"],
        subredditSubscribers: json["subreddit_subscribers"],
        createdUtc: json["created_utc"],
        numCrossposts: json["num_crossposts"],
        media: json["media"] == null ? null : Media.fromMap(json["media"]),
        isVideo: json["is_video"],
      );

  Map<String, dynamic> toMap() => {
        "approved_at_utc": approvedAtUtc,
        "subreddit": subredditValues.reverse[subreddit],
        "selftext": selftext,
        "author_fullname": authorFullname,
        "saved": saved,
        "mod_reason_title": modReasonTitle,
        "gilded": gilded,
        "clicked": clicked,
        "title": title,
        "link_flair_richtext":
            List<dynamic>.from(linkFlairRichtext.map((x) => x)),
        "subreddit_name_prefixed":
            subredditNamePrefixedValues.reverse[subredditNamePrefixed],
        "hidden": hidden,
        "pwls": pwls,
        "link_flair_css_class": linkFlairCssClass,
        "downs": downs,
        "thumbnail_height": thumbnailHeight,
        "top_awarded_type": topAwardedType,
        "hide_score": hideScore,
        "name": name,
        "quarantine": quarantine,
        // "link_flair_text_color":
        //     linkFlairTextColorValues.reverse[linkFlairTextColor],
        "upvote_ratio": upvoteRatio,
        "author_flair_background_color": authorFlairBackgroundColor,
        "ups": ups,
        "total_awards_received": totalAwardsReceived,
        "media_embed": mediaEmbed.toMap(),
        "thumbnail_width": thumbnailWidth,
        "author_flair_template_id": authorFlairTemplateId,
        "is_original_content": isOriginalContent,
        "user_reports": List<dynamic>.from(userReports.map((x) => x)),
        "secure_media": secureMedia?.toMap(),
        "is_reddit_media_domain": isRedditMediaDomain,
        "is_meta": isMeta,
        "category": category,
        "secure_media_embed": secureMediaEmbed.toMap(),
        "can_mod_post": canModPost,
        "score": score,
        "approved_by": approvedBy,
        "is_created_from_ads_ui": isCreatedFromAdsUi,
        "author_premium": authorPremium,
        "thumbnail": thumbnail,
        // "edited": edited,
        "author_flair_css_class":
            authorFlairCssClassValues.reverse[authorFlairCssClass],
        "author_flair_richtext":
            List<dynamic>.from(authorFlairRichtext.map((x) => x)),
        "gildings": gildings.toMap(),
        "post_hint": postHint,
        "content_categories": contentCategories,
        "is_self": isSelf,
        "subreddit_type": subredditTypeValues.reverse[subredditType],
        "created": created,
        "link_flair_type": flairTypeValues.reverse[linkFlairType],
        "wls": wls,
        "removed_by_category": removedByCategory,
        "banned_by": bannedBy,
        "author_flair_type": flairTypeValues.reverse[authorFlairType],
        "domain": domain,
        "allow_live_comments": allowLiveComments,
        "selftext_html": selftextHtml,
        "likes": likes,
        "suggested_sort": suggestedSort,
        "banned_at_utc": bannedAtUtc,
        "url_overridden_by_dest": urlOverriddenByDest,
        "view_count": viewCount,
        "archived": archived,
        "no_follow": noFollow,
        "is_crosspostable": isCrosspostable,
        "pinned": pinned,
        "over_18": over18,
        "preview": preview?.toMap(),
        "all_awardings": List<dynamic>.from(allAwardings.map((x) => x)),
        "awarders": List<dynamic>.from(awarders.map((x) => x)),
        "media_only": mediaOnly,
        "link_flair_template_id": linkFlairTemplateId,
        "can_gild": canGild,
        "spoiler": spoiler,
        "locked": locked,
        "author_flair_text": authorFlairText,
        "treatment_tags": List<dynamic>.from(treatmentTags.map((x) => x)),
        "visited": visited,
        "removed_by": removedBy,
        "mod_note": modNote,
        "distinguished": distinguished,
        "subreddit_id": subredditIdValues.reverse[subredditId],
        "author_is_blocked": authorIsBlocked,
        "mod_reason_by": modReasonBy,
        "num_reports": numReports,
        "removal_reason": removalReason,
        "id": id,
        "is_robot_indexable": isRobotIndexable,
        "report_reasons": reportReasons,
        "author": author,
        "discussion_type": discussionType,
        "num_comments": numComments,
        "send_replies": sendReplies,
        "whitelist_status": whitelistStatusValues.reverse[whitelistStatus],
        "contest_mode": contestMode,
        "mod_reports": List<dynamic>.from(modReports.map((x) => x)),
        "author_patreon_flair": authorPatreonFlair,
        "author_flair_text_color":
            authorFlairTextColorValues.reverse[authorFlairTextColor],
        "permalink": permalink,
        "parent_whitelist_status":
            whitelistStatusValues.reverse[parentWhitelistStatus],
        "stickied": stickied,
        "url": url,
        "subreddit_subscribers": subredditSubscribers,
        "created_utc": createdUtc,
        "num_crossposts": numCrossposts,
        "media": media?.toMap(),
        "is_video": isVideo,
      };
}

enum AuthorFlairCssClass { NEW }

final authorFlairCssClassValues = EnumValues({"new": AuthorFlairCssClass.NEW});

enum AuthorFlairTextColor { DARK }

final authorFlairTextColorValues =
    EnumValues({"dark": AuthorFlairTextColor.DARK});

enum FlairType { TEXT }

final flairTypeValues = EnumValues({"text": FlairType.TEXT});

class Gildings {
  Gildings();

  factory Gildings.fromMap(Map<String, dynamic> json) => Gildings();

  Map<String, dynamic> toMap() => {};
}

enum LinkFlairBackgroundColor { B8001_F, CCAC2_B }

final linkFlairBackgroundColorValues = EnumValues({
  "#b8001f": LinkFlairBackgroundColor.B8001_F,
  "#ccac2b": LinkFlairBackgroundColor.CCAC2_B
});

enum LinkFlairText { DISCUSSION, VIDEO }

final linkFlairTextValues = EnumValues(
    {"Discussion": LinkFlairText.DISCUSSION, "Video": LinkFlairText.VIDEO});

enum LinkFlairTextColor { LIGHT }

final linkFlairTextColorValues =
    EnumValues({"light": LinkFlairTextColor.LIGHT});

class Media {
  String type;
  Oembed oembed;

  Media({
    required this.type,
    required this.oembed,
  });

  factory Media.fromMap(Map<String, dynamic> json) => Media(
        type: json["type"],
        oembed: Oembed.fromMap(json["oembed"]),
      );

  Map<String, dynamic> toMap() => {
        "type": type,
        "oembed": oembed.toMap(),
      };
}

class Oembed {
  String providerUrl;
  String version;
  String title;
  String type;
  int thumbnailWidth;
  int height;
  int width;
  String html;
  String authorName;
  String providerName;
  String thumbnailUrl;
  int thumbnailHeight;
  String authorUrl;

  Oembed({
    required this.providerUrl,
    required this.version,
    required this.title,
    required this.type,
    required this.thumbnailWidth,
    required this.height,
    required this.width,
    required this.html,
    required this.authorName,
    required this.providerName,
    required this.thumbnailUrl,
    required this.thumbnailHeight,
    required this.authorUrl,
  });

  factory Oembed.fromMap(Map<String, dynamic> json) => Oembed(
        providerUrl: json["provider_url"],
        version: json["version"],
        title: json["title"],
        type: json["type"],
        thumbnailWidth: json["thumbnail_width"],
        height: json["height"],
        width: json["width"],
        html: json["html"],
        authorName: json["author_name"],
        providerName: json["provider_name"],
        thumbnailUrl: json["thumbnail_url"],
        thumbnailHeight: json["thumbnail_height"],
        authorUrl: json["author_url"],
      );

  Map<String, dynamic> toMap() => {
        "provider_url": providerUrl,
        "version": version,
        "title": title,
        "type": type,
        "thumbnail_width": thumbnailWidth,
        "height": height,
        "width": width,
        "html": html,
        "author_name": authorName,
        "provider_name": providerName,
        "thumbnail_url": thumbnailUrl,
        "thumbnail_height": thumbnailHeight,
        "author_url": authorUrl,
      };
}

class MediaEmbed {
  String? content;
  int? width;
  bool? scrolling;
  int? height;
  String? mediaDomainUrl;

  MediaEmbed({
    this.content,
    this.width,
    this.scrolling,
    this.height,
    this.mediaDomainUrl,
  });

  factory MediaEmbed.fromMap(Map<String, dynamic> json) => MediaEmbed(
        content: json["content"],
        width: json["width"],
        scrolling: json["scrolling"],
        height: json["height"],
        mediaDomainUrl: json["media_domain_url"],
      );

  Map<String, dynamic> toMap() => {
        "content": content,
        "width": width,
        "scrolling": scrolling,
        "height": height,
        "media_domain_url": mediaDomainUrl,
      };
}

enum WhitelistStatus { ALL_ADS }

final whitelistStatusValues = EnumValues({"all_ads": WhitelistStatus.ALL_ADS});

class Preview {
  List<Image> images;
  bool enabled = true;

  Preview({
    required this.images,
    required this.enabled,
  });

  factory Preview.fromMap(Map<String, dynamic> json) => Preview(
        images: List<Image>.from(json["images"].map((x) => Image.fromMap(x))),
        enabled: json["enabled"],
      );

  Map<String, dynamic> toMap() => {
        "images": List<dynamic>.from(images.map((x) => x.toMap())),
        "enabled": enabled,
      };
}

class Image {
  Source source;
  List<Source> resolutions;
  Gildings variants;
  String id;

  Image({
    required this.source,
    required this.resolutions,
    required this.variants,
    required this.id,
  });

  factory Image.fromMap(Map<String, dynamic> json) => Image(
        source: Source.fromMap(json["source"]),
        resolutions: List<Source>.from(
            json["resolutions"].map((x) => Source.fromMap(x))),
        variants: Gildings.fromMap(json["variants"]),
        id: json["id"],
      );

  Map<String, dynamic> toMap() => {
        "source": source.toMap(),
        "resolutions": List<dynamic>.from(resolutions.map((x) => x.toMap())),
        "variants": variants.toMap(),
        "id": id,
      };
}

class Source {
  String url;
  int width;
  int height;

  Source({
    required this.url,
    required this.width,
    required this.height,
  });

  factory Source.fromMap(Map<String, dynamic> json) => Source(
        url: json["url"],
        width: json["width"],
        height: json["height"],
      );

  Map<String, dynamic> toMap() => {
        "url": url,
        "width": width,
        "height": height,
      };
}

enum Subreddit { FLUTTER_DEV }

final subredditValues = EnumValues({"FlutterDev": Subreddit.FLUTTER_DEV});

enum SubredditId { T5_2_X3_Q8 }

final subredditIdValues = EnumValues({"t5_2x3q8": SubredditId.T5_2_X3_Q8});

enum SubredditNamePrefixed { R_FLUTTER_DEV }

final subredditNamePrefixedValues =
    EnumValues({"r/FlutterDev": SubredditNamePrefixed.R_FLUTTER_DEV});

enum SubredditType { PUBLIC }

final subredditTypeValues = EnumValues({"public": SubredditType.PUBLIC});

enum Kind { T3 }

final kindValues = EnumValues({"t3": Kind.T3});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
