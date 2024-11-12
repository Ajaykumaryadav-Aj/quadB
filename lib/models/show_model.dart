class ShowModel {
  final int id;
  final String url;
  final String name;
  final String type;
  final String language;
  final List<String> genres;
  final String status;
  final int? runtime; 
  final String? premiered;
  final String? ended;
  final String officialSite;
  final Schedule schedule;
  final double? rating; 
  final Network? network; 
  final String summary;
  final ImageModel? image; 

  ShowModel({
    required this.id,
    required this.url,
    required this.name,
    required this.type,
    required this.language,
    required this.genres,
    required this.status,
    this.runtime,
    this.premiered,
    this.ended,
    required this.officialSite,
    required this.schedule,
    this.rating,
    this.network,
    required this.summary,
    this.image,
  });

  factory ShowModel.fromJson(Map<String, dynamic> json) {
    return ShowModel(
      id: json['id'] ?? 0,
      url: json['url'] ?? '',
      name: json['name'] ?? 'Unknown',
      type: json['type'] ?? 'Unknown',
      language: json['language'] ?? 'Unknown',
      genres: List<String>.from(json['genres'] ?? []),
      status: json['status'] ?? 'Unknown',
      runtime: json['runtime'] as int?,
      premiered: json['premiered'] as String?,
      ended: json['ended'] as String?,
      officialSite: json['officialSite'] ?? '',
      schedule: Schedule.fromJson(json['schedule'] ?? {}),
      rating: (json['rating']?['average'] as num?)?.toDouble(),
      network: json['network'] != null ? Network.fromJson(json['network']) : null,
      summary: json['summary'] ?? '',
      image: json['image'] != null ? ImageModel.fromJson(json['image']) : null,
    );
  }
}

class Schedule {
  final String time;
  final List<String> days;

  Schedule({
    required this.time,
    required this.days,
  });

  factory Schedule.fromJson(Map<String, dynamic> json) {
    return Schedule(
      time: json['time'] ?? 'Unknown',
      days: List<String>.from(json['days'] ?? []),
    );
  }
}

class Network {
  final String name;
  final String country;

  Network({
    required this.name,
    required this.country,
  });

  factory Network.fromJson(Map<String, dynamic> json) {
    return Network(
      name: json['name'] ?? 'Unknown',
      country: json['country']?['name'] ?? 'Unknown',
    );
  }
}

class ImageModel {
  final String medium;
  final String original;

  ImageModel({
    required this.medium,
    required this.original,
  });

  factory ImageModel.fromJson(Map<String, dynamic> json) {
    return ImageModel(
      medium: json['medium'] ?? '',
      original: json['original'] ?? '',
    );
  }
}
