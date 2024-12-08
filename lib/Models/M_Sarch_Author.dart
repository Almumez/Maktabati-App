class Author {
  final String author_id;
  final String book_num;
  final String? author_deathday;
  final String author_nationality;
  final String author_birthday;
  final String author_img;
  final String author_name;
  final String author_description;
  final String author_profession;

  


  const Author({


    required this.author_id,
    required this.author_deathday,
    required this.book_num,
    required this.author_nationality,
    required this.author_birthday,
    required this.author_profession,
    required this.author_description,
    required this.author_name,
    required this.author_img,

  });

  factory Author.fromJson(Map<String, dynamic> json) => Author(

    author_id: json['author_id'],
    book_num: json['book_num'],
    author_birthday: json['author_birthday'],
    author_deathday: json['author_deathday'],
    author_nationality: json['author_nationality'],
    author_profession: json['author_profession'],
    author_img: json['author_img'],
    author_description: json['author_description'],
    author_name: json['author_name'],
  );

  Map<String, dynamic> toJson() => {

    'author_id': author_id,
    'book_num': book_num,
    'author_deathday': author_deathday,
    'author_nationality': author_nationality,
    'author_profession': author_profession,
    'author_description': author_description,
    'author_birthday': author_birthday,
    'author_img': author_img,
    'author_name': author_name,

  };
}
