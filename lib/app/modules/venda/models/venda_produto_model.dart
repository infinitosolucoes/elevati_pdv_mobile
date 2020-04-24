// To parse this JSON data, do
//
//     final vendaProduto = vendaProdutoFromJson(jsonString);

import 'dart:convert';

import 'package:elevatipdvmobile/app/shared/db/db_entity.dart';

class VendaProduto extends DbEntity{
   int vendaId;
   int produtoId;
   String descricao;
   double quantidade;
   double precoUnitario;
   double valorTotal;

  VendaProduto({
    this.vendaId,
    this.produtoId,
    this.descricao,
    this.quantidade,
    this.precoUnitario,
    this.valorTotal,
  });

  VendaProduto copyWith({
    int vendaId,
    int produtoId,
    String descricao,
    double quantidade,
    double precoUnitario,
    double valorTotal,
  }) =>
      VendaProduto(
        vendaId: vendaId ?? this.vendaId,
        produtoId: produtoId ?? this.produtoId,
        descricao: descricao ?? this.descricao,
        quantidade: quantidade ?? this.quantidade,
        precoUnitario: precoUnitario ?? this.precoUnitario,
        valorTotal: valorTotal ?? this.valorTotal,
      );

  factory VendaProduto.fromJson(String str) => VendaProduto.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory VendaProduto.fromMap(Map<String, dynamic> json) => VendaProduto(
    vendaId: json["vendaId"],
    produtoId: json["produtoId"],
    descricao: json["descricao"],
    quantidade: json["quantidade"].toDouble(),
    precoUnitario: json["precoUnitario"].toDouble(),
    valorTotal: json["valorTotal"].toDouble(),
  );

  Map<String, dynamic> toMap() => {
    "vendaId": vendaId,
    "produtoId": produtoId,
    "descricao": descricao,
    "quantidade": quantidade,
    "precoUnitario": precoUnitario,
    "valorTotal": valorTotal,
  };
}
