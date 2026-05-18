import 'package:flutter/material.dart';

import '../data/jobs_api_service.dart';
import '../models/job_posting.dart';

class JobsScreen extends StatefulWidget {
  const JobsScreen({super.key});

  static const routeName = '/jobs';

  @override
  State<JobsScreen> createState() => _JobsScreenState();
}

class _JobsScreenState extends State<JobsScreen> {
  final JobsApiService _jobsApiService = JobsApiService();
  late Future<List<JobPosting>> _jobsFuture;

  @override
  void initState() {
    super.initState();
    _jobsFuture = _jobsApiService.fetchJobs();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Is Ilanlari')),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFEAF3FF), Color(0xFFC7E0FF)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: FutureBuilder<List<JobPosting>>(
          future: _jobsFuture,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }

            if (snapshot.hasError) {
              return Center(
                child: Text('Ilanlar alinamadi: ${snapshot.error}'),
              );
            }

            final jobs = snapshot.data ?? <JobPosting>[];
            if (jobs.isEmpty) {
              return const Center(child: Text('Ilan bulunamadi.'));
            }

            return ListView.builder(
              padding: const EdgeInsets.all(8),
              itemCount: jobs.length,
              itemBuilder: (context, index) {
                final job = jobs[index];
                return Card(
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: const Color(0xFFD7E9FF),
                      child: Icon(
                        job.remote ? Icons.wifi_tethering : Icons.location_city,
                        color: const Color(0xFF0B3C75),
                      ),
                    ),
                    title: Text(job.title),
                    subtitle: Text('${job.companyName} - ${job.location}'),
                    trailing: job.tags.isEmpty
                        ? null
                        : Chip(
                            label: Text(
                              job.tags.first,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
