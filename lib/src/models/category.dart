class Category {
  /// Unique identifier for the term.
  dynamic id;

  /// Number of published posts for the term.
  dynamic count;

  /// HTML description of the term.
  String description;

  /// URL of the term.
  String link;

  /// HTML title for the term
  String title;

  /// An alphanumeric identifier for the term unique to its type.
  String slug;

  /// Type attribution for the term.
  String taxonomy;

  /// The parent term ID.
  dynamic parent;

  /// Meta fields
  dynamic meta; // List?

  dynamic iD;
  String name;

  List<Items> items;

  Category.fromJson(Map json) {
    if (json['items'] != null) {
      items = new List<Items>();
      json['items'].forEach((v) {
        items.add(new Items.fromJson(v));
      });
    }
  }
}

class Items {
  int id;
  int order;
  int parent;
  String title;
  String url;
  String attr;
  String target;
  String classes;
  String xfn;
  String description;
  int objectId;
  String object;
  String objectSlug;
  String type;
  String typeLabel;

  Items(
      {this.id,
      this.order,
      this.parent,
      this.title,
      this.url,
      this.attr,
      this.target,
      this.classes,
      this.xfn,
      this.description,
      this.objectId,
      this.object,
      this.objectSlug,
      this.type,
      this.typeLabel});

  Items.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    order = json['order'];
    parent = json['parent'];
    title = json['title'];
    url = json['url'];
    attr = json['attr'];
    target = json['target'];
    classes = json['classes'];
    xfn = json['xfn'];
    description = json['description'];
    objectId = json['object_id'];
    object = json['object'];
    objectSlug = json['object_slug'];
    type = json['type'];
    typeLabel = json['type_label'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['order'] = this.order;
    data['parent'] = this.parent;
    data['title'] = this.title;
    data['url'] = this.url;
    data['attr'] = this.attr;
    data['target'] = this.target;
    data['classes'] = this.classes;
    data['xfn'] = this.xfn;
    data['description'] = this.description;
    data['object_id'] = this.objectId;
    data['object'] = this.object;
    data['object_slug'] = this.objectSlug;
    data['type'] = this.type;
    data['type_label'] = this.typeLabel;
    return data;
  }
}
