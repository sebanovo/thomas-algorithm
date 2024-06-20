void mostrarMatriz(List<List<double>> v, int size) {
  String s = '';
  for (int i = 0; i < size; i++) {
    for (int j = 0; j < size; j++) {
      s = s + v[i][j].toString() + '\t';
    }
    s = s + '\n';
  }
  print(s);
}

List<double> thomas({
  required int size,
  required List<double> cn,
  required List<double> bn,
  required List<double> an,
  required List<double> b,
}) {
  List<List<double>> L = List.generate(size, (i) => List.filled(size, 0));
  List<List<double>> U = List.generate(size, (i) => List.filled(size, 0));

  // Crear la matriz L
  for (int i = 0; i < size; i++) {
    for (int j = 0; j < size; j++) {
      L[i][j] = (i == j) ? 1 : 0;
      U[i][j] = 0;
    }
  }

  U[0][0] = bn[0];
  for (int i = 1; i < size; i++) {
    U[i - 1][i] = cn[i - 1];
  }

  for (int i = 2; i <= size; i++) {
    an[i - 2] = an[i - 2] / bn[i - 2];
    L[i - 1][i - 2] = an[i - 2];
    bn[i - 1] = bn[i - 1] - an[i - 2] * cn[i - 2];
    U[i - 1][i - 1] = bn[i - 1];
  }

  mostrarMatriz(L, size);
  mostrarMatriz(U, size);

  // Resolver L * D = B
  List<double> d = List.filled(size, 0);
  d[0] = b[0];
  for (int i = 1; i < size; i++) {
    d[i] = b[i] - (L[i][i - 1]) * d[i - 1];
  }
  print(d);

  // Resolver U * X = D
  List<double> x = List.filled(size, 0);
  x[size - 1] = d[size - 1] / U[size - 1][size - 1];
  for (int i = size - 2; i >= 0; i--) {
    x[i] = (d[i] - U[i][i + 1] * x[i + 1]) / U[i][i];
  }
  return x;
}

void main() {
  List<List<double>> original = [
    [0.5, -2.7, 0, 0],
    [1, -0.2, -3, 0],
    [0, 4.9, -7.8, 4],
    [0, 0, 2.8, -3.4],
  ];
  List<double> b = [-5.925, -1.35, 4.975, -0.1];

  mostrarMatriz(original, 4);

  int size = 4;
  List<double> cn = [-2.7, -3, 4];
  List<double> bn = [0.5, -0.2, -7.8, -3.4];
  List<double> an = [1, 4.9, 2.8, -3.4];

  thomas(size: size, cn: cn, bn: bn, an: an, b: b);
}
