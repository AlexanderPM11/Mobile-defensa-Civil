class Reportar_Situacionmodel {
  String Titulo;
  String Descripcion;
  String Foto;
  String Latitud;
  String Longitud;
  String Estado;
  String Fecha;

  Reportar_Situacionmodel({
    this.Estado = "",
    required this.Latitud,
    required this.Fecha,
    required this.Longitud,
    required this.Titulo,
    required this.Foto,
    required this.Descripcion,
  });
}
