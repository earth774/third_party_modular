// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';

part 'pokemon.g.dart';

@JsonSerializable()
class PokeMonModel {
  String name;
  String url;

  PokeMonModel({
    required this.name,
    required this.url,
  });

  factory PokeMonModel.fromJson(Map<String,dynamic> json) => _$PokeMonModelFromJson(json);

  Map<String, dynamic> toJson() => _$PokeMonModelToJson(this);
}

@JsonSerializable()
class PokemonResponse {
  List<PokeMonModel> results;

  PokemonResponse({
    required this.results,
  });

  factory PokemonResponse.fromJson(Map<String,dynamic> json) => _$PokemonResponseFromJson(json);

  Map<String, dynamic> toJson() => _$PokemonResponseToJson(this);
}
