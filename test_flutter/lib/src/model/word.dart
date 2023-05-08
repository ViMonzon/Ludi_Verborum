class PalabraInfo {
  final String inicial;
  final String palabra;
  final String definicion;

  PalabraInfo({
    required this.inicial,
    required this.palabra,
    required this.definicion,
  });
}

List<PalabraInfo> abc = [
  PalabraInfo(
      definicion:
          "1. f. Pájaro de 15 a 20 cm de largo, de cola ahorquillada, con cabeza y dorso de color pardo terroso y vientre blanco sucio, que anida en los campos de cereales, come insectos y granos, y abunda en toda España.",
      palabra: "alondra",
      inicial: "A"),
  PalabraInfo(definicion: "1. f. Dentadura", palabra: "Boca", inicial: "B"),
  PalabraInfo(definicion: "1. f. Flor.", palabra: "Capullo", inicial: "C")
];
