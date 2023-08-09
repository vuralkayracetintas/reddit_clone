class RedditModel {
  RedditModel({
    required this.kind,
    required this.data,
  });
  late final String kind;
  late final Data data;

  RedditModel.fromJson(Map<String, dynamic> json) {
    kind = json['kind'];
    data = Data.fromJson(json['data']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['kind'] = kind;
    _data['data'] = data.toJson();
    return _data;
  }
}

class Data {
  Data({
    this.after,
    required this.dist,
    required this.modhash,
    required this.geoFilter,
    required this.children,
    required this.before,
  });
  late final Null after;
  late final int dist;
  late final String modhash;
  late final String geoFilter;
  late final List<Children> children;
  late final String before;

  Data.fromJson(Map<String, dynamic> json) {
    after = null;
    dist = json['dist'];
    modhash = json['modhash'];
    geoFilter = json['geo_filter'];
    children =
        List.from(json['children']).map((e) => Children.fromJson(e)).toList();
    before = json['before'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['after'] = after;
    _data['dist'] = dist;
    _data['modhash'] = modhash;
    _data['geo_filter'] = geoFilter;
    _data['children'] = children.map((e) => e.toJson()).toList();
    _data['before'] = before;
    return _data;
  }
}

class Children {
  Children({
    required this.kind,
    required this.data,
  });
  late final String kind;
  late final Data data;

  Children.fromJson(Map<String, dynamic> json) {
    kind = json['kind'];
    data = Data.fromJson(json['data']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['kind'] = kind;
    _data['data'] = data.toJson();
    return _data;
  }
}
