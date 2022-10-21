class Modeldb {
  int? id;
  String? logradouro;
  String? localidade;
  String? uf;
  String? cep;

  Modeldb({
    this.id,
    this.logradouro,
    this.localidade,
    this.uf,
    this.cep,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'logradouro': logradouro,
      'localidade': localidade,
      'uf': uf,
      'cep': cep,
    };
  }
}
