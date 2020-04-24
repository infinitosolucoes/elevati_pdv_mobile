// To parse this JSON data, do
//
//     final produtoGrupo = produtoGrupoFromJson(jsonString);

import 'dart:convert';

import 'package:elevatipdvmobile/app/shared/db/db_entity.dart';

class ProdutoGrupo extends DbEntity{
  final int produtoGrupoId;
  final int produtoGrupoPaiId;
  final String grupo;
  final int isAtivo;

  ProdutoGrupo({
    this.produtoGrupoId,
    this.produtoGrupoPaiId,
    this.grupo,
    this.isAtivo,
  });

  ProdutoGrupo copyWith({
    int produtoGrupoId,
    int produtoGrupoPaiId,
    String grupo,
    int isAtivo,
  }) =>
      ProdutoGrupo(
        produtoGrupoId: produtoGrupoId ?? this.produtoGrupoId,
        produtoGrupoPaiId: produtoGrupoPaiId ?? this.produtoGrupoPaiId,
        grupo: grupo ?? this.grupo,
        isAtivo: isAtivo ?? this.isAtivo,
      );

  factory ProdutoGrupo.fromJson(String str) => ProdutoGrupo.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ProdutoGrupo.fromMap(Map<String, dynamic> json) => ProdutoGrupo(
    produtoGrupoId: json["produtoGrupoId"],
    produtoGrupoPaiId: json["produtoGrupoPaiId"],
    grupo: json["grupo"],
    isAtivo: json["isAtivo"],
  );

  Map<String, dynamic> toMap() => {
    "produtoGrupoId": produtoGrupoId,
    "produtoGrupoPaiId": produtoGrupoPaiId,
    "grupo": grupo,
    "isAtivo": isAtivo,
  };
}
