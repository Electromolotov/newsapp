class ResponseSources {
  final String? status;
  final List<Sources>? sources;

  ResponseSources({
    this.status,
    this.sources,
  });

  ResponseSources.fromJson(Map<String, dynamic> json)
      : status = json['status'] as String?,
        sources = (json['sources'] as List?)
            ?.map((dynamic e) => Sources.fromJson(e as Map<String, dynamic>))
            .toList();

  Map<String, dynamic> toJson() =>
      {'status': status, 'sources': sources?.map((e) => e.toJson()).toList()};
}

class Sources {
  final String? id;
  final String? name;
  final String? description;
  final String? url;
  final String? category;
  final String? language;
  final String? country;

  Sources({
    this.id,
    this.name,
    this.description,
    this.url,
    this.category,
    this.language,
    this.country,
  });

  Sources.fromJson(Map<String, dynamic> json)
      : id = json['id'] as String?,
        name = json['name'] as String?,
        description = json['description'] as String?,
        url = json['url'] as String?,
        category = json['category'] as String?,
        language = json['language'] as String?,
        country = json['country'] as String?;

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'description': description,
        'url': url,
        'category': category,
        'language': language,
        'country': country
      };
}
