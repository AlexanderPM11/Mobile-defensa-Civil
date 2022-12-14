class Noticia {
  int Id;
  String Fecha;
  String Titulo;
  String Contenido;
  String Foto;

  Noticia(
      {required this.Contenido,
      required this.Foto,
      required this.Id,
      required this.Titulo,
      required this.Fecha});
}
