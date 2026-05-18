import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/job_posting.dart';

class JobsApiService {
  static const _endpoint = 'https://www.arbeitnow.com/api/job-board-api';

  Future<List<JobPosting>> fetchJobs() async {
    final response = await http.get(Uri.parse(_endpoint));

    if (response.statusCode != 200) {
      throw Exception('API hatasi: ${response.statusCode}');
    }

    final map = jsonDecode(response.body) as Map<String, dynamic>;
    final data = map['data'] as List<dynamic>? ?? <dynamic>[];
    return data
        .map((item) => JobPosting.fromMap(item as Map<String, dynamic>))
        .toList();
  }
}
