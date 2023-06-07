class ImageConstants {
  ImageConstants._init();
  static ImageConstants? _instace;

  static ImageConstants get instance => _instace ??= ImageConstants._init();

  String get konumPng => toPng("ic_konum");
  String get splashLogo => toPng("avukatlogo");
  String get dashboardPng => toPng("ic_dashboard");
  String get loginPng => toPng("ic_login");
  String get webIcon => toPng("webicon");
  String get pharmacy => toPng("pharmacy");
  String get question => toPng("question");

  String toPng(String name) => 'assets/image/$name.png';
}
