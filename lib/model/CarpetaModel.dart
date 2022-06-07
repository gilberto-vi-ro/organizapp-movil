import 'dart:convert';

CarpetaModel carpetaModelFromJson(String str) =>
    CarpetaModel.fromJson(json.decode(str));

String carpetaModelToJson(CarpetaModel data) => json.encode(data.toJson());

class CarpetaModel {
  int ctime;
  int mtime;
  int size;
  String name;
  String path;
  String path_name;
  bool is_dir;
  String extension;
  bool is_deleteable;
  bool is_readable;
  bool is_writable;
  bool is_executable;

  CarpetaModel({
    this.ctime,
    this.mtime,
    this.size,
    this.name,
    this.path,
    this.path_name,
    this.is_dir,
    this.extension,
    this.is_deleteable,
    this.is_readable,
    this.is_writable,
    this.is_executable,
  });

  factory CarpetaModel.fromJson(Map<String, dynamic> json) => CarpetaModel(
        ctime: json["ctime"],
        mtime: json["mtime"],
        size: json["size"],
        name: json["name"],
        path: json["path"],
        path_name: json["path_name"],
        is_dir: json["is_dir"],
        extension: json["extension"],
        is_deleteable: json["is_deleteable"],
        is_readable: json["is_readable"],
        is_writable: json["is_writable"],
        is_executable: json["is_executable"],
      );

  Map<String, dynamic> toJson() => {
        "size": size,
        "name": name,
        "path": path,
        "path_name": path_name,
        "is_dir": is_dir,
        "extension": extension,
      };
}
