import 'dart:convert';

class Post {
  final String urlImage;
  final String nome;
  final String urlPostagem;
  final String descricao;
  int? curtidas;
  int? comentarios;
  Post({
    required this.urlImage,
    required this.nome,
    required this.urlPostagem,
    required this.descricao,
    required this.curtidas,
    required this.comentarios,
  });

  Map<String, dynamic> toMap() {
    return {
      'urlImage': urlImage,
      'nome': nome,
      'urlPostagem': urlPostagem,
      'descricao': descricao,
      'curtidas': curtidas,
      'comentarios': comentarios,
    };
  }

  factory Post.fromMap(Map<String, dynamic> map) {
    return Post(
      urlImage: map['urlImage'] ?? '',
      nome: map['nome'] ?? '',
      urlPostagem: map['urlPostagem'] ?? '',
      descricao: map['descricao'] ?? '',
      curtidas: map['curtidas']?.toInt(),
      comentarios: map['comentarios']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory Post.fromJson(String source) => Post.fromMap(json.decode(source));
}
