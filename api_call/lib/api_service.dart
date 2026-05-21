import 'dart:convert';
import 'dart:nativewrappers/_internal/vm/lib/typed_data_patch.dart';

import 'package:api_call/Single_Post_With_Model.dart';
import 'package:api_call/post_model.dart';
import 'package:http/http.dart' as http;

class ApiService {
  Future<SinglePostWithModel?> getsinglepostwithmodel() async {
    try {
      var response = await http.get(
        Uri.parse("https://jsonplaceholder.typicode.com/posts/1"),
      );

      if (response.statusCode == 200) {
        return SinglePostWithModel.fromJson(json.decode(response.body));
      }
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  Future<dynamic> getsinglepostwithoutmodel() async {
    try {
      var response = await http.get(
        Uri.parse("https://jsonplaceholder.typicode.com/posts/1"),
      );

      if (response.statusCode == 200) {
        final body = response.body;
        final data = jsonDecode(body);
        return data;
      }
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  Future<List<postmodel>?> getpostmodel() async {
    try {
      var response = await http.get(
        Uri.parse("https://jsonplaceholder.typicode.com/posts"),
      );

      if (response.statusCode == 200) {
        final List<postmodel> model = List<postmodel>.from(
          json.decode(response.body).map((x) => postmodel.fromJson(x)),
        );
        return model;
      }
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  Future<dynamic> getwithoutmodel() async {
    try {
      var response = await http.get(
        Uri.parse("https://jsonplaceholder.typicode.com/posts"),
      );

      if (response.statusCode == 200) {
        final body = jsonDecode(response.body);
        return body;
      }
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  Future<dynamic> gettoken() async {
    try {
      String token =
          "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOjEsImlhdCI6MTc2ODk3NTc0NCwiZXhwIjoxNzcwNzAzNzQ0fQ.5xGFrK8Xnts1UbtCMCU_XCrlzWiTItB5lGGYVYghsoU";
      var response = await http.get(
        Uri.parse("https://api.escuelajs.co/api/v1/auth/profile"),
        headers: {"Authorization": "Bearer $token"},
      );

      if (response.statusCode == 200) {
        final body = jsonDecode(response.body);
        return body;
      }
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  Future<dynamic> uploadimage(bytes,String filename) async {
    try {
      var request = await http.MultipartRequest(
        'POST',
        Uri.parse('https://api.escuelajs.co/api/v1/files/upload'),

      );
      var multipart = http.MultipartFile('file',http.ByteStream.fromBytes(bytes),bytes.length,filename: filename);
      request.files.add(multipart);
      var response = await request.send();

    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
