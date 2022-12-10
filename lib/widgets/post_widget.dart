// ignore_for_file: must_be_immutable, sized_box_for_whitespace

import 'package:flutter/material.dart';

class PostWidget extends StatefulWidget {
  final String urlImage;
  final String nome;
  final String urlPostagem;
  final String descricao;
  int? curtidas;
  int? comentarios;

  PostWidget({
    Key? key,
    required this.urlImage,
    required this.nome,
    required this.urlPostagem,
    required this.descricao,
    required this.curtidas,
    required this.comentarios,
  }) : super(key: key);

  @override
  State<PostWidget> createState() => _PostWidgetState();
}

class _PostWidgetState extends State<PostWidget> {
  final Color _iconColor = Colors.white;
  bool _curtir = false;
  bool _salvar = false;
  bool _expandir = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: [
          ListTile(
            title: Text(
              widget.nome,
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
            leading: CircleAvatar(
              radius: 20,
              backgroundImage: NetworkImage(widget.urlImage),
            ),
            trailing: Icon(Icons.more_horiz, color: _iconColor),
          ),
          Container(
            height: 350,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(widget.urlPostagem),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Row(
            children: [
              IconButton(
                onPressed: () {
                  setState(() {
                    if (widget.curtidas == null) {
                      widget.curtidas == 0;
                    }
                    var curtidas = widget.curtidas!;
                    _curtir = !_curtir;
                    if (_curtir) {
                      widget.curtidas = ++curtidas;
                    } else {
                      widget.curtidas = --curtidas;
                    }
                  });
                },
                icon: Icon(
                  _curtir ? Icons.favorite_rounded : Icons.favorite_border,
                  color: _curtir ? Colors.red : Colors.white,
                  size: 30,
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.mode_comment_outlined,
                  color: _iconColor,
                  size: 30,
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.near_me_outlined,
                  color: _iconColor,
                  size: 30,
                ),
              ),
              Spacer(),
              IconButton(
                onPressed: () {
                  setState(() {
                    _salvar = !_salvar;
                  });
                },
                icon: Icon(
                  _salvar ? Icons.bookmark : Icons.bookmark_border_outlined,
                  color: Colors.white,
                  size: 30,
                ),
              ),
            ],
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.only(left: 8.0, bottom: 8),
              child: Text(
                '${widget.curtidas} curtidas',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.only(left: 8.0, bottom: 8),
              child: InkWell(
                onTap: () {
                  setState(() {
                    _expandir = !_expandir;
                  });
                },
                child: RichText(
                  overflow:
                      _expandir ? TextOverflow.visible : TextOverflow.ellipsis,
                  text: TextSpan(
                    style: TextStyle(color: Colors.white),
                    children: <InlineSpan>[
                      TextSpan(
                          text: widget.nome,
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      WidgetSpan(
                        child: const SizedBox(
                          width: 4,
                        ),
                      ),
                      TextSpan(
                        text: widget.descricao,
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.only(left: 8.0, bottom: 8),
              child: InkWell(
                onTap: () {},
                child: Text(
                  'Ver todos os ${widget.comentarios} comentários',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.grey,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
