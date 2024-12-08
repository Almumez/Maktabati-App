import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:maktabati2/Models/M_Sarch_Author.dart';
import 'package:maktabati2/Models/M_View_Book.dart';
import 'package:maktabati2/const/linkapi.dart';




import '../Models/M_Sarch_Book.dart';



class AuthorApi {
  static Future<List<Author>> getBooks(String query) async {
    final url = Uri.parse(linkView_author);
    final response = await http.get(url);

    if (response.statusCode == 200) {
      List books = json.decode(response.body);

      return books.map((json) => Author.fromJson(json)).where((book) {
        final titleLower = book.author_name.toLowerCase();
        final authorLower = book.author_name.toLowerCase();
        final searchLower = query.toLowerCase();
        return titleLower.contains(searchLower) ||
            authorLower.contains(searchLower);
      }).toList();
    } else {
      throw Exception();
    }
  }
}
