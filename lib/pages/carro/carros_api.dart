import 'package:carros/pages/carro/carro.dart';

class CarrosApi {
  static List<Carro> getCarros() {
    final carros = List<Carro>();

    carros.add(
      Carro(
        nome: "hevrolet Impala Coup",
        urlFoto:
            "http://www.livroandroid.com.br/livro/carros/classicos/Chevrolet_Impala_Coupe.png",
      ),
    );
    carros.add(
      Carro(
        nome: "Cadillac Deville Convertible",
        urlFoto:
            "http://www.livroandroid.com.br/livro/carros/classicos/Cadillac_Deville_Convertible.png",
      ),
    );
    carros.add(
      Carro(
        nome: "Ford Mustang 1976",
        urlFoto:
            "http://www.livroandroid.com.br/livro/carros/classicos/Ford_Mustang.png",
      ),
    );

    return carros;
  }
}
