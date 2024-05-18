class FileModel {
  final String name;
  final String path;

  const FileModel({
    required this.name,
    required this.path,
  });

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'path': path,
    };
  }
}
