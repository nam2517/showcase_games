// import 'dart:async';
// import 'package:http/http.dart' as http;
// import 'dart:convert' as convert;

// const url = "https://jsonplaceholder.typicode.com/photos";

// class API {
//   static Future getItems() async {
//     var response = await http.get(url);
//     if (response.statusCode == 200) {
//       var jsonResponse = convert.jsonDecode(response.body);
//       return jsonResponse;
//     } else {
//       throw Exception("Error while fetching data");
//     }
//   }
// }
