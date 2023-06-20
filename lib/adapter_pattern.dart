import 'dart:convert';

class YoutubeApi {
  String getYoutubePosts() {
    return '''
[
  {
    "title":"Singleton pattern",
    "desc":"only one instance"
  },
  {
    "title":"Prototype pattern",
    "desc":"clonning instance"
  }
]
''';
  }
}

class MediumApi {
  String getMediumPosts() {
    return '''
[
  {
    "header":"Singleton pattern medium",
    "bio":"only one instance"
  },
  {
    "header":"Prototype pattern medium",
    "bio":"clonning instance"
  }
]
''';
  }
}

class Post {
  final String title;
  final String bio;

  Post({
    required this.title,
    required this.bio,
  });
}

abstract class PostApi {
  List<Post> getPosts();
}

class YoutubeAdabter extends PostApi {
  final YoutubeApi _youtubeApi = YoutubeApi();
  @override
  List<Post> getPosts() {
    final data = jsonDecode(_youtubeApi.getYoutubePosts()) as List;

    return data.map((e) => Post(title: e['title'], bio: e['desc'])).toList();
  }
}

class MediumAdabter extends PostApi {
  final MediumApi _mediumApi = MediumApi();
  @override
  List<Post> getPosts() {
    final data = jsonDecode(_mediumApi.getMediumPosts()) as List;

    return data.map((e) => Post(title: e['header'], bio: e['bio'])).toList();
  }
}

class PostApiImpl extends PostApi {
  final YoutubeAdabter _youtubeAdabter = YoutubeAdabter();
  final MediumAdabter _mediumAdabter = MediumAdabter();
  @override
  List<Post> getPosts() {
    return _youtubeAdabter.getPosts() + _mediumAdabter.getPosts();
  }
}
