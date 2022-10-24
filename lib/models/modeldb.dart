class EnderecoModel {
  int id;
  String cep;
  String logradouro;
  String localidade;
  String uf;

  EnderecoModel({
    required this.id,
    required this.cep,
    required this.logradouro,
    required this.localidade,
    required this.uf,
  });

  factory EnderecoModel.fromJson(Map<String, dynamic> json) {
    return EnderecoModel(
        id: json['id'],
        cep: json['cep'],
        logradouro: json['logradouro'],
        localidade: json['localidade'],
        uf: json['uf']);
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'cep': cep,
      'logradouro': logradouro,
      'localidade': localidade,
      'uf': uf,
    };
  }
}
