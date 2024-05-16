class Book {
  int? id;
  String book, author, year, read, information, photo,count;
  DateTime time;

  Book({
    this.id,
    required this.book,
    required this.author,
    required this.photo,
    required this.year,
    required this.count,
    required this.read,
    required this.information,
    required this.time
  });
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'book': book,
      'author': author,
      'photo': photo,
      'year': year,
      'read': read,
      'count': count,
      'information': information,
      'time': time.toString(),
    };
  }
}
