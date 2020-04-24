import 'dart:convert';

import 'package:elevatipdvmobile/app/shared/db/db_entity.dart';

class Produto extends DbEntity{
  final int produtoId;
  final int produtoGrupoId;
  final String codBarras;
  final double precoVenda;
  final String produto;
  final int isAtivo;

  Produto({
    this.produtoId,
    this.produtoGrupoId,
    this.codBarras,
    this.precoVenda,
    this.produto,
    this.isAtivo,
  });

  Produto copyWith({
    int produtoId,
    int produtoGrupoId,
    String codBarras,
    double precoVenda,
    String produto,
    int isAtivo,
  }) =>
      Produto(
        produtoId: produtoId ?? this.produtoId,
        produtoGrupoId: produtoGrupoId ?? this.produtoGrupoId,
        codBarras: codBarras ?? this.codBarras,
        precoVenda: precoVenda ?? this.precoVenda,
        produto: produto ?? this.produto,
        isAtivo: isAtivo ?? this.isAtivo,
      );

  factory Produto.fromJson(String str) => Produto.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Produto.fromMap(Map<String, dynamic> json) => Produto(
    produtoId: json["produtoId"],
    produtoGrupoId: json["produtoGrupoId"],
    codBarras: json["codBarras"],
    precoVenda: json["precoVenda"].toDouble(),
    produto: json["produto"],
    isAtivo: json["isAtivo"],
  );

  Map<String, dynamic> toMap() => {
    "produtoId": produtoId,
    "produtoGrupoId": produtoGrupoId,
    "codBarras": codBarras,
    "precoVenda": precoVenda,
    "produto": produto,
    "isAtivo": isAtivo,
  };
}
