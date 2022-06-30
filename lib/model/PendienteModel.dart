import 'dart:convert';

ActividadModel actividadModelFromJson(String str) =>
    ActividadModel.fromJson(json.decode(str));

String actividadModelToJson(ActividadModel data) => json.encode(data.toJson());

class ActividadModel {
  String carpeta_path;
  String carpeta_path_name;
  String carpeta_nombre;
  String carpeta_archivado;
  String archivo_nombre;
  String archivo_extension;
  String archivo_archivado;
  int archivo_size;
  String tarea_nombre;
  String tarea_fecha_entrega;
  int tarea_estado;
  String tarea_descripcion;
  int tarea_prioridad;
  int id_carpeta;
  int id_archivo;
  int id_tarea;

  ActividadModel({
    this.carpeta_path,
    this.carpeta_path_name,
    this.carpeta_nombre,
    this.carpeta_archivado,
    this.archivo_nombre,
    this.archivo_extension,
    this.archivo_archivado,
    this.archivo_size,
    this.tarea_nombre,
    this.tarea_fecha_entrega,
    this.tarea_estado,
    this.tarea_descripcion,
    this.tarea_prioridad,
    this.id_carpeta,
    this.id_archivo,
    this.id_tarea,
  });

  factory ActividadModel.fromJson(Map<String, dynamic> json) => ActividadModel(
      carpeta_path: json["carpeta_path"],
      carpeta_path_name: json["carpeta_path_name"],
      carpeta_nombre: json["carpeta_nombre"],
      carpeta_archivado: json["carpeta_archivado"],
      archivo_nombre: json["archivo_nombre"],
      archivo_extension: json["archivo_extension"],
      archivo_archivado: json["archivo_archivado"],
      archivo_size: int.parse(json["archivo_size"]),
      tarea_nombre: json["tarea_nombre"],
      tarea_fecha_entrega: json["tarea_fecha_entrega"],
      tarea_estado: int.parse(json["tarea_estado"]),
      tarea_descripcion: json["tarea_descripcion"],
      tarea_prioridad: int.parse(json["tarea_prioridad"]),
      id_carpeta: int.parse(json["id_carpeta"]),
      id_archivo: int.parse(json["id_archivo"]),
      id_tarea: int.parse(json["id_tarea"]));

  Map<String, dynamic> toJson() => {
        // "size": size,
        // "name": name,
        // "path": path,
        // "path_name": path_name,
        // "is_dir": is_dir,
        // "extension": extension,
      };
}
