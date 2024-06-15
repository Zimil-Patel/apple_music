class RadioModel {
  String thumbnail;
  String title;
  String description;
  String time;

  RadioModel({
    required this.thumbnail,
    required this.title,
    required this.description,
    required this.time,
  });

  factory RadioModel.fromJson(Map json) {
    return RadioModel(
      thumbnail: json['thumbnail'],
      title: json['title'],
      description: json['description'],
      time: json['time'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'thumbnail': thumbnail,
      'title': title,
      'description': description,
      'time': time,
    };
  }
}
