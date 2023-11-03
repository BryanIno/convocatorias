import 'dart:convert';

List<Convocatoria> convocatoriaFromJson(String str) => List<Convocatoria>.from(
    json.decode(str).map((x) => Convocatoria.fromJson(x)));

String convocatoriaToJson(List<Convocatoria> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Convocatoria {
  final String nombre;
  final String descripcion;
  final String modalidad;
  final String sede;
  final String nivelEducacional;
  final int expDoce;
  final int expLabo;
  final DateTime inicioConvo;
  final DateTime finConvo;
  final String otrosRequi;
  final String cursosInteres;

  Convocatoria({
    required this.nombre,
    required this.descripcion,
    required this.modalidad,
    required this.sede,
    required this.nivelEducacional,
    required this.expDoce,
    required this.expLabo,
    required this.inicioConvo,
    required this.finConvo,
    required this.otrosRequi,
    required this.cursosInteres,
  });

  factory Convocatoria.fromJson(Map<String, dynamic> json) => Convocatoria(
        nombre: json["nombre"],
        descripcion: json["descripcion"],
        modalidad: json["modalidad"],
        sede: json["sede"],
        nivelEducacional: json["NivelEducacional"],
        expDoce: json["expDoce"],
        expLabo: json["expLabo"],
        inicioConvo: DateTime.parse(json["inicioConvo"]),
        finConvo: DateTime.parse(json["finConvo"]),
        otrosRequi: json["otrosRequi"],
        cursosInteres: json["cursosInteres"],
      );

  Map<String, dynamic> toJson() => {
        "nombre": nombre,
        "descripcion": descripcion,
        "modalidad": modalidad,
        "sede": sede,
        "NivelEducacional": nivelEducacional,
        "expDoce": expDoce,
        "expLabo": expLabo,
        "inicioConvo": inicioConvo.toIso8601String(),
        "finConvo": finConvo.toIso8601String(),
        "otrosRequi": otrosRequi,
        "cursosInteres": cursosInteres,
      };
}
