import 'package:flutter/material.dart';

class StoriesWidget extends StatelessWidget {
  final String urlImage;
  final String nome;
  final bool aoVivo;
  final bool favorito;

  const StoriesWidget(
      {Key? key,
      required this.urlImage,
      required this.nome,
      required this.aoVivo,
      required this.favorito})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8, left: 8),
      child: Column(
        children: [
          Stack(
            children: [
              Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    // color: Colors.black,
                    gradient: aoVivo || favorito
                        ? LinearGradient(colors: [
                            Colors.purple,
                            Colors.cyan,
                          ], begin: Alignment.topCenter)
                        : LinearGradient(colors: [
                            Colors.red.shade800,
                            Colors.yellow.shade900,
                          ], begin: Alignment.topCenter)),
              ),
              Container(
                width: 80,
                height: 80,
                padding: EdgeInsets.all(3),
                child: CircleAvatar(
                  radius: 80,
                  backgroundColor: Colors.black,
                  child: CircleAvatar(
                    radius: 35,
                    backgroundImage: NetworkImage(urlImage),
                  ),
                ),
              ),
              aoVivo
                  ? Positioned(
                      bottom: 0,
                      left: 15,
                      child: Container(
                        width: 50,
                        height: 15,
                        decoration: BoxDecoration(
                          // border: Border.all(color: Colors.black, width: 2),
                          gradient: LinearGradient(colors: [
                            Colors.pink.shade900,
                            Colors.red,
                          ], begin: Alignment.topCenter),
                          borderRadius: BorderRadius.circular(3),
                        ),
                        alignment: Alignment.center,
                        child: Text(
                          'AO VIVO',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 10,
                              color: Colors.white),
                        ),
                      ),
                    )
                  : Container(
                      color: Colors.transparent,
                    ),
              favorito
                  // ignore: sized_box_for_whitespace
                  ? Container(
                      width: 80,
                      height: 80,
                      child: Align(
                        alignment: Alignment.bottomRight,
                        child: Container(
                          padding: EdgeInsets.all(3),
                          decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [
                                  Colors.red.shade900,
                                  Colors.purple.shade600
                                ],
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                              ),
                              borderRadius: BorderRadius.circular(30),
                              border:
                                  Border.all(color: Colors.white, width: 2)),
                          child: Icon(
                            Icons.favorite_border,
                            color: Colors.white,
                            size: 14,
                          ),
                        ),
                      ),
                    )
                  : Container(
                      color: Colors.transparent,
                    ),
            ],
          ),
          const SizedBox(
            height: 5,
          ),
          Container(
            width: 80,
            alignment: Alignment.center,
            child: Text(
              nome,
              overflow: TextOverflow.ellipsis,
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}
