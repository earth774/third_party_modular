// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokemon.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PokeMonModel _$PokeMonModelFromJson(Map<String, dynamic> json) => PokeMonModel(
      name: json['name'] as String,
      url: json['url'] as String,
    );

Map<String, dynamic> _$PokeMonModelToJson(PokeMonModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'url': instance.url,
    };

PokemonResponse _$PokemonResponseFromJson(Map<String, dynamic> json) =>
    PokemonResponse(
      results: (json['results'] as List<dynamic>)
          .map((e) => PokeMonModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$PokemonResponseToJson(PokemonResponse instance) =>
    <String, dynamic>{
      'results': instance.results,
    };
