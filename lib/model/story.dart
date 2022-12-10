import 'dart:convert';

class Story {
  final String urlImage;
  final String nome;
  final bool aoVivo;
  final bool favorito;
  Story({
    required this.urlImage,
    required this.nome,
    required this.aoVivo,
    required this.favorito,
  });

  Map<String, dynamic> toMap() {
    return {
      'urlImage': urlImage,
      'nome': nome,
      'aoVivo': aoVivo,
      'favorito': favorito,
    };
  }

  factory Story.fromMap(Map<String, dynamic> map) {
    return Story(
      urlImage: map['urlImage'] ?? '',
      nome: map['nome'] ?? '',
      aoVivo: map['aoVivo'] ?? false,
      favorito: map['favorito'] ?? false,
    );
  }

  String toJson() => json.encode(toMap());

  factory Story.fromJson(String source) => Story.fromMap(json.decode(source));
}
