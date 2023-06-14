class ImageConstants {
  ImageConstants._init();
  static ImageConstants? _instace;

  static ImageConstants get instance => _instace ??= ImageConstants._init();

  String get starMarker => toPng("star-marker");

  String toPng(String name) => 'assets/image/$name.png';
}
