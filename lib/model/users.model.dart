/*
// Example Usage
Map<String, dynamic> map = jsonDecode(<myJSONString>);
var myRootNode = Root.fromJson(map);
*/

class ListUsers {
  int? totalcount;
  bool? incompleteresults;
  List<User?>? items;

  ListUsers({this.totalcount, this.incompleteresults, this.items});

  ListUsers.fromJson(Map<String, dynamic> json) {
    totalcount = json['total_count'];
    incompleteresults = json['incomplete_results'];
    if (json['items'] != null) {
      items = <User>[];
      json['items'].forEach((v) {
        items!.add(User.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['total_count'] = totalcount;
    data['incomplete_results'] = incompleteresults;
    data['items'] =
        items != null ? items!.map((v) => v?.toJson()).toList() : null;
    return data;
  }
}

class User {
  String? login;
  int? id;
  String? nodeid;
  String? avatarurl;
  String? gravatarid;
  String? url;
  String? htmlurl;
  String? followersurl;
  String? followingurl;
  String? gistsurl;
  String? starredurl;
  String? subscriptionsurl;
  String? organizationsurl;
  String? reposurl;
  String? eventsurl;
  String? receivedeventsurl;
  String? type;
  bool? siteadmin;
  double? score;

  User(
      {this.login,
      this.id,
      this.nodeid,
      this.avatarurl,
      this.gravatarid,
      this.url,
      this.htmlurl,
      this.followersurl,
      this.followingurl,
      this.gistsurl,
      this.starredurl,
      this.subscriptionsurl,
      this.organizationsurl,
      this.reposurl,
      this.eventsurl,
      this.receivedeventsurl,
      this.type,
      this.siteadmin,
      this.score});

  User.fromJson(Map<String, dynamic> json) {
    login = json['login'];
    id = json['id'];
    nodeid = json['node_id'];
    avatarurl = json['avatar_url'];
    gravatarid = json['gravatar_id'];
    url = json['url'];
    htmlurl = json['html_url'];
    followersurl = json['followers_url'];
    followingurl = json['following_url'];
    gistsurl = json['gists_url'];
    starredurl = json['starred_url'];
    subscriptionsurl = json['subscriptions_url'];
    organizationsurl = json['organizations_url'];
    reposurl = json['repos_url'];
    eventsurl = json['events_url'];
    receivedeventsurl = json['received_events_url'];
    type = json['type'];
    siteadmin = json['site_admin'];
    score = json['score'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['login'] = login;
    data['id'] = id;
    data['node_id'] = nodeid;
    data['avatar_url'] = avatarurl;
    data['gravatar_id'] = gravatarid;
    data['url'] = url;
    data['html_url'] = htmlurl;
    data['followers_url'] = followersurl;
    data['following_url'] = followingurl;
    data['gists_url'] = gistsurl;
    data['starred_url'] = starredurl;
    data['subscriptions_url'] = subscriptionsurl;
    data['organizations_url'] = organizationsurl;
    data['repos_url'] = reposurl;
    data['events_url'] = eventsurl;
    data['received_events_url'] = receivedeventsurl;
    data['type'] = type;
    data['site_admin'] = siteadmin;
    data['score'] = score;
    return data;
  }
}
