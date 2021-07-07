import 'dart:convert';
import 'dart:io';
import 'package:fitness_app/sources/service_layer/result.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'endpoint_fabric.dart';
import 'news.dart';
import 'result.dart';

class NetworkService {
  Future<News> getNews(String token) async {
    final EndPointFabric endPointFabric = EndPointFabric();

    final response =
        await http.get(Uri.parse(endPointFabric.getNewsURL()), headers: {
      HttpHeaders.authorizationHeader: 'Bearer $token',
    });

    if (response.statusCode == 200) {
      return News.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load');
    }
  }

  Future<Result> postToken() async {
    final EndPointFabric endPointFabric = EndPointFabric();

    // await DotEnv().load('.env');
    // DotEnv().env['BEARER'];

    final response = await http.post(
      Uri.parse(endPointFabric.getTokenURL()),
      headers: {
        HttpHeaders.authorizationHeader:
            'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6NTksImlhdCI6MTYyMDQ5MTYxNCwiZXhwIjoxMDAxNjIwNDkxNjE0fQ.zGqmT0dH2bUMkG5DltUciML5CCXDbXsdO3p5a6AH5Z8',
      },
    );

    if (response.statusCode == 200) {
      return Result.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load');
    }
  }
}
