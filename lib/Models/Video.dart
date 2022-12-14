class Video_Model {
  int Id;
  String Fecha;
  String Titulo;
  String Descripcion;
  String link;

  Video_Model(
      {required this.Descripcion,
      required this.link,
      required this.Id,
      required this.Titulo,
      required this.Fecha});
}
