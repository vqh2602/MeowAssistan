class BlogPost {
  String? kind;
  List<Items>? items;
  String? etag;

  BlogPost({this.kind, this.items, this.etag});

  factory BlogPost.fromJson( dynamic json) {

    if (json == null) {
      return BlogPost();
    } else {
      print('covert thanh cong');
      return BlogPost(
          kind :json['kind'],
        items : (json['items'] as List).map((e) => Items.fromJson(e)).toList(),
        etag : json['etag'],
      );
    }
  }

}

class Items {
  String? kind;
  String? id;
  Blog? blog;
  String? published;
  String? updated;
  String? url;
  String? selfLink;
  String? title;
  String? content;
  Author? author;
  Replies? replies;
  String? etag;

  Items(
      {this.kind,
        this.id,
        this.blog,
        this.published,
        this.updated,
        this.url,
        this.selfLink,
        this.title,
        this.content,
        this.author,
        this.replies,
        this.etag});

  factory Items.fromJson(dynamic json) {
    if (json == null) {
      return Items();
    } else {
      print('covert thanh cong');
      return Items(
          kind : json['kind'],
          id : json['id'],
          blog : json['blog'] != null ? new Blog.fromJson(json['blog']) : null,
          published : json['published'],
          updated : json['updated'],
      url : json['url'],
      selfLink : json['selfLink'],
      title : json['title'],
      content : json['content'],
      author :
      json['author'] != null ? new Author.fromJson(json['author']) : null,
    replies :
    json['replies'] != null ? new Replies.fromJson(json['replies']) : null,
    etag : json['etag'],
      );
    }
  }



}

class Blog {
  String? id;

  Blog({this.id});

 factory Blog.fromJson(dynamic json) {

    if (json == null) {
      return Blog();
    } else {
      print('covert thanh cong');
      return Blog(
          id : json['id'],
      );
    }
  }


}

class Author {
  String? id;
  String? displayName;
  String? url;
  Image? image;

  Author({this.id, this.displayName, this.url, this.image});

 factory Author.fromJson(dynamic json) {
    if (json == null) {
      return Author();
    } else {
      print('covert thanh cong');
      return Author(
          id : json['id'],
          displayName : json['displayName'],
          url : json['url'],
          image : json['image'] != null ? new Image.fromJson(json['image']) : null,
      );
    }

  }


}

class Image {
  String? url;

  Image({this.url});

 factory Image.fromJson( dynamic json) {
    if (json == null) {
      return Image();
    } else {
      print('covert thanh cong');
      return Image(
          url : json['url'],
      );
    }

  }


}

class Replies {
  String? totalItems;
  String? selfLink;

  Replies({this.totalItems, this.selfLink});

  factory Replies.fromJson( dynamic json) {
    if (json == null) {
      return Replies();
    } else {
      print('covert thanh cong');
      return Replies(
          totalItems : json['totalItems'],
          selfLink : json['selfLink'],
      );
    }

  }

  }

