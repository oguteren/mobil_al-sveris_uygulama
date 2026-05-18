class JobPosting {
  JobPosting({
    required this.title,
    required this.companyName,
    required this.location,
    required this.remote,
    required this.tags,
    required this.applyUrl,
  });

  final String title;
  final String companyName;
  final String location;
  final bool remote;
  final List<String> tags;
  final String applyUrl;

  factory JobPosting.fromMap(Map<String, dynamic> map) {
    final tags = (map['tags'] as List<dynamic>?)
            ?.map((tag) => tag.toString())
            .toList() ??
        <String>[];
    return JobPosting(
      title: map['title']?.toString() ?? 'Baslik yok',
      companyName: map['company_name']?.toString() ?? 'Sirket bilgisi yok',
      location: map['location']?.toString() ?? 'Konum belirtilmedi',
      remote: map['remote'] as bool? ?? false,
      tags: tags,
      applyUrl: map['url']?.toString() ?? '',
    );
  }
}
