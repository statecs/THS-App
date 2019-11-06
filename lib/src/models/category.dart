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

  //Category();

  Category.fromJson(Map json) {
    if (json == null) {
      return;
    }
    title = json['title'];
  }

  Map<String, dynamic> toMap() => {
        'title': title,
      };

  toString() => "Menu => " + toMap().toString();
}
