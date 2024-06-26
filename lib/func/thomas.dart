class Thomas {
  static double _determinant(List<List<double>> matrix) {
    // Verificar si la matriz es cuadrada
    int rows = matrix.length;
    int cols = matrix[0].length;
    if (rows != cols) {
      throw Exception('La matriz no es cuadrada');
    }

    // Caso base para matriz 1x1
    if (rows == 1) {
      return matrix[0][0];
    }

    double det = 0;
    // Expandir por la primera fila (o cualquier fila/ columna)
    for (int j = 0; j < cols; j++) {
      // Calcular el cofactor matrix[0][j]
      double cofactor = matrix[0][j] *
          _cofactorSign(0, j) *
          _determinant(_cofactorMatrix(matrix, 0, j));
      det += cofactor;
    }

    return det;
  }

  // Función para calcular el signo del cofactor
  static double _cofactorSign(int row, int col) {
    return ((row + col) % 2 == 0) ? 1 : -1;
  }

  // Función para obtener la matriz de cofactores eliminando la fila y columna específicas
  static List<List<double>> _cofactorMatrix(
      List<List<double>> matrix, int row, int col) {
    List<List<double>> subMatrix = [];
    int n = matrix.length;
    for (int i = 0; i < n; i++) {
      if (i != row) {
        List<double> newRow = [];
        for (int j = 0; j < n; j++) {
          if (j != col) {
            newRow.add(matrix[i][j]);
          }
        }
        subMatrix.add(newRow);
      }
    }
    return subMatrix;
  }

  static List<List<double>> _juntarMatriz(
      List<double> an, List<double> bn, List<double> cn) {
    List<List<double>> matriz =
        List.generate(bn.length, (i) => List.filled(bn.length, 0));
    // juntar an
    for (int i = 0; i < bn.length - 1; i++) {
      matriz[i][i + 1] = an[i];
    }
    // juntar bn
    for (int i = 0; i < bn.length; i++) {
      matriz[i][i] = bn[i];
    }
    // juntar cn
    for (int i = 0; i < bn.length - 1; i++) {
      matriz[i + 1][i] = cn[i];
    }
    return matriz;
  }

  static List<double>? method(
      List<double> an, List<double> bn, List<double> cn, List<double> d) {
    if (cn.isEmpty || bn.isEmpty || an.isEmpty || d.isEmpty)
      throw Exception('Campos vacíos');
    if (cn.any((element) => element == 0) ||
        bn.any((element) => element == 0) ||
        an.any((element) => element == 0)) {
      throw Exception('Ningun coeficiente de la diagonal debe ser cero');
    }
    if (_determinant(_juntarMatriz(an, bn, cn)) == 0)
      throw Exception('La matriz es no invertible');

    int size = d.length;

    // Paso 1: Eliminación hacia adelante
    for (int i = 1; i < size; i++) {
      double m = an[i - 1] / bn[i - 1];
      if (bn[i] == 0) {
        throw Exception(
            'División por cero detectada en la diagonal principal.');
      }
      bn[i] = bn[i] - m * cn[i - 1];
      d[i] = d[i] - m * d[i - 1];
    }

    // Paso 2: Sustitución hacia atrás
    List<double> x = List.filled(size, 0);
    x[size - 1] = d[size - 1] / bn[size - 1];
    for (int i = size - 2; i >= 0; i--) {
      if (bn[i] == 0) {
        throw Exception(
            'División por cero detectada en la diagonal principal.');
      }

      x[i] = (d[i] - cn[i] * x[i + 1]) / bn[i];
    }

    return x;
  }
}
