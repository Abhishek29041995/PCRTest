import 'package:http/http.dart';

String BASE_URL = "https://jobs.github.com/positions.json?location=remote";

Future<Response> commonMethod() async {
  final response = await get(BASE_URL);
  return response;
}

