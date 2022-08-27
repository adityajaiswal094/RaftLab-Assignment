import 'dart:convert';

import 'package:http/http.dart' as http;

class RemoteService {
  Future<Map<String, dynamic>> getEntries() async {
    var url = 'https://api.publicapis.org/entries';
    var response = await http.get(
      Uri.parse(url),
      // headers: {
      //   'content-type': 'application/json',
      //   'access-control-allow-origin': '*',
      // },
    );

    // print(response);
    // print(response.body);

    var entries = jsonDecode(response.body);

    // List<Entries> entryList = entries['entries']
    //     .map<Entries>((json) => Entries.fromJson(json))
    //     .toList();

    return entries;
  }
}
