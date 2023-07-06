/*
* Copyright 2021 Amazon.com, Inc. or its affiliates. All Rights Reserved.
*
* Licensed under the Apache License, Version 2.0 (the "License").
* You may not use this file except in compliance with the License.
* A copy of the License is located at
*
*  http://aws.amazon.com/apache2.0
*
* or in the "license" file accompanying this file. This file is distributed
* on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either
* express or implied. See the License for the specific language governing
* permissions and limitations under the License.
*/

// NOTE: This file is generated and may not follow lint rules defined in your app
// Generated files can be excluded from analysis in analysis_options.yaml
// For more info, see: https://dart.dev/guides/language/analysis-options#excluding-code-from-analysis

// ignore_for_file: public_member_api_docs, annotate_overrides, dead_code, dead_codepublic_member_api_docs, depend_on_referenced_packages, file_names, library_private_types_in_public_api, no_leading_underscores_for_library_prefixes, no_leading_underscores_for_local_identifiers, non_constant_identifier_names, null_check_on_nullable_type_parameter, prefer_adjacent_string_concatenation, prefer_const_constructors, prefer_if_null_operators, prefer_interpolation_to_compose_strings, slash_for_doc_comments, sort_child_properties_last, unnecessary_const, unnecessary_constructor_name, unnecessary_late, unnecessary_new, unnecessary_null_aware_assignments, unnecessary_nullable_for_final_variable_declarations, unnecessary_string_interpolations, use_build_context_synchronously

import 'ModelProvider.dart';
import 'package:amplify_core/amplify_core.dart' as amplify_core;


/** This is an auto generated class representing the Mission type in your schema. */
class Mission extends amplify_core.Model {
  static const classType = const _MissionModelType();
  final String id;
  final String? _nom;
  final String? _description;
  final Adresse? _adresse;
  final int? _nb_point;
  final int? _id_m;
  final String? _date_debut;
  final String? _date_fin;
  final amplify_core.TemporalDateTime? _createdAt;
  final amplify_core.TemporalDateTime? _updatedAt;

  @override
  getInstanceType() => classType;
  
  @Deprecated('[getId] is being deprecated in favor of custom primary key feature. Use getter [modelIdentifier] to get model identifier.')
  @override
  String getId() => id;
  
  MissionModelIdentifier get modelIdentifier {
      return MissionModelIdentifier(
        id: id
      );
  }
  
  String? get nom {
    return _nom;
  }
  
  String? get description {
    return _description;
  }
  
  Adresse? get adresse {
    return _adresse;
  }
  
  int get nb_point {
    try {
      return _nb_point!;
    } catch(e) {
      throw amplify_core.AmplifyCodeGenModelException(
          amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  int get id_m {
    try {
      return _id_m!;
    } catch(e) {
      throw amplify_core.AmplifyCodeGenModelException(
          amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  String get date_debut {
    try {
      return _date_debut!;
    } catch(e) {
      throw amplify_core.AmplifyCodeGenModelException(
          amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  String get date_fin {
    try {
      return _date_fin!;
    } catch(e) {
      throw amplify_core.AmplifyCodeGenModelException(
          amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  amplify_core.TemporalDateTime? get createdAt {
    return _createdAt;
  }
  
  amplify_core.TemporalDateTime? get updatedAt {
    return _updatedAt;
  }
  
  const Mission._internal({required this.id, nom, description, adresse, required nb_point, required id_m, required date_debut, required date_fin, createdAt, updatedAt}): _nom = nom, _description = description, _adresse = adresse, _nb_point = nb_point, _id_m = id_m, _date_debut = date_debut, _date_fin = date_fin, _createdAt = createdAt, _updatedAt = updatedAt;
  
  factory Mission({String? id, String? nom, String? description, Adresse? adresse, required int nb_point, required int id_m, required String date_debut, required String date_fin}) {
    return Mission._internal(
      id: id == null ? amplify_core.UUID.getUUID() : id,
      nom: nom,
      description: description,
      adresse: adresse,
      nb_point: nb_point,
      id_m: id_m,
      date_debut: date_debut,
      date_fin: date_fin);
  }
  
  bool equals(Object other) {
    return this == other;
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Mission &&
      id == other.id &&
      _nom == other._nom &&
      _description == other._description &&
      _adresse == other._adresse &&
      _nb_point == other._nb_point &&
      _id_m == other._id_m &&
      _date_debut == other._date_debut &&
      _date_fin == other._date_fin;
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("Mission {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("nom=" + "$_nom" + ", ");
    buffer.write("description=" + "$_description" + ", ");
    buffer.write("adresse=" + (_adresse != null ? _adresse!.toString() : "null") + ", ");
    buffer.write("nb_point=" + (_nb_point != null ? _nb_point!.toString() : "null") + ", ");
    buffer.write("id_m=" + (_id_m != null ? _id_m!.toString() : "null") + ", ");
    buffer.write("date_debut=" + "$_date_debut" + ", ");
    buffer.write("date_fin=" + "$_date_fin" + ", ");
    buffer.write("createdAt=" + (_createdAt != null ? _createdAt!.format() : "null") + ", ");
    buffer.write("updatedAt=" + (_updatedAt != null ? _updatedAt!.format() : "null"));
    buffer.write("}");
    
    return buffer.toString();
  }
  
  Mission copyWith({String? nom, String? description, Adresse? adresse, int? nb_point, int? id_m, String? date_debut, String? date_fin}) {
    return Mission._internal(
      id: id,
      nom: nom ?? this.nom,
      description: description ?? this.description,
      adresse: adresse ?? this.adresse,
      nb_point: nb_point ?? this.nb_point,
      id_m: id_m ?? this.id_m,
      date_debut: date_debut ?? this.date_debut,
      date_fin: date_fin ?? this.date_fin);
  }
  
  Mission copyWithModelFieldValues({
    ModelFieldValue<String?>? nom,
    ModelFieldValue<String?>? description,
    ModelFieldValue<Adresse?>? adresse,
    ModelFieldValue<int>? nb_point,
    ModelFieldValue<int>? id_m,
    ModelFieldValue<String>? date_debut,
    ModelFieldValue<String>? date_fin
  }) {
    return Mission._internal(
      id: id,
      nom: nom == null ? this.nom : nom.value,
      description: description == null ? this.description : description.value,
      adresse: adresse == null ? this.adresse : adresse.value,
      nb_point: nb_point == null ? this.nb_point : nb_point.value,
      id_m: id_m == null ? this.id_m : id_m.value,
      date_debut: date_debut == null ? this.date_debut : date_debut.value,
      date_fin: date_fin == null ? this.date_fin : date_fin.value
    );
  }
  
  Mission.fromJson(Map<String, dynamic> json)  
    : id = json['id'],
      _nom = json['nom'],
      _description = json['description'],
      _adresse = json['adresse']?['serializedData'] != null
        ? Adresse.fromJson(new Map<String, dynamic>.from(json['adresse']['serializedData']))
        : null,
      _nb_point = (json['nb_point'] as num?)?.toInt(),
      _id_m = (json['id_m'] as num?)?.toInt(),
      _date_debut = json['date_debut'],
      _date_fin = json['date_fin'],
      _createdAt = json['createdAt'] != null ? amplify_core.TemporalDateTime.fromString(json['createdAt']) : null,
      _updatedAt = json['updatedAt'] != null ? amplify_core.TemporalDateTime.fromString(json['updatedAt']) : null;
  
  Map<String, dynamic> toJson() => {
    'id': id, 'nom': _nom, 'description': _description, 'adresse': _adresse?.toJson(), 'nb_point': _nb_point, 'id_m': _id_m, 'date_debut': _date_debut, 'date_fin': _date_fin, 'createdAt': _createdAt?.format(), 'updatedAt': _updatedAt?.format()
  };
  
  Map<String, Object?> toMap() => {
    'id': id,
    'nom': _nom,
    'description': _description,
    'adresse': _adresse,
    'nb_point': _nb_point,
    'id_m': _id_m,
    'date_debut': _date_debut,
    'date_fin': _date_fin,
    'createdAt': _createdAt,
    'updatedAt': _updatedAt
  };

  static final amplify_core.QueryModelIdentifier<MissionModelIdentifier> MODEL_IDENTIFIER = amplify_core.QueryModelIdentifier<MissionModelIdentifier>();
  static final ID = amplify_core.QueryField(fieldName: "id");
  static final NOM = amplify_core.QueryField(fieldName: "nom");
  static final DESCRIPTION = amplify_core.QueryField(fieldName: "description");
  static final ADRESSE = amplify_core.QueryField(fieldName: "adresse");
  static final NB_POINT = amplify_core.QueryField(fieldName: "nb_point");
  static final ID_M = amplify_core.QueryField(fieldName: "id_m");
  static final DATE_DEBUT = amplify_core.QueryField(fieldName: "date_debut");
  static final DATE_FIN = amplify_core.QueryField(fieldName: "date_fin");
  static var schema = amplify_core.Model.defineSchema(define: (amplify_core.ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "Mission";
    modelSchemaDefinition.pluralName = "Missions";
    
    modelSchemaDefinition.authRules = [
      amplify_core.AuthRule(
        authStrategy: amplify_core.AuthStrategy.PUBLIC,
        operations: const [
          amplify_core.ModelOperation.CREATE,
          amplify_core.ModelOperation.UPDATE,
          amplify_core.ModelOperation.DELETE,
          amplify_core.ModelOperation.READ
        ])
    ];
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.id());
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Mission.NOM,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Mission.DESCRIPTION,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.embedded(
      fieldName: 'adresse',
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.embedded, ofCustomTypeName: 'Adresse')
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Mission.NB_POINT,
      isRequired: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.int)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Mission.ID_M,
      isRequired: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.int)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Mission.DATE_DEBUT,
      isRequired: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Mission.DATE_FIN,
      isRequired: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.nonQueryField(
      fieldName: 'createdAt',
      isRequired: false,
      isReadOnly: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.dateTime)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.nonQueryField(
      fieldName: 'updatedAt',
      isRequired: false,
      isReadOnly: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.dateTime)
    ));
  });
}

class _MissionModelType extends amplify_core.ModelType<Mission> {
  const _MissionModelType();
  
  @override
  Mission fromJson(Map<String, dynamic> jsonData) {
    return Mission.fromJson(jsonData);
  }
  
  @override
  String modelName() {
    return 'Mission';
  }
}

/**
 * This is an auto generated class representing the model identifier
 * of [Mission] in your schema.
 */
class MissionModelIdentifier implements amplify_core.ModelIdentifier<Mission> {
  final String id;

  /** Create an instance of MissionModelIdentifier using [id] the primary key. */
  const MissionModelIdentifier({
    required this.id});
  
  @override
  Map<String, dynamic> serializeAsMap() => (<String, dynamic>{
    'id': id
  });
  
  @override
  List<Map<String, dynamic>> serializeAsList() => serializeAsMap()
    .entries
    .map((entry) => (<String, dynamic>{ entry.key: entry.value }))
    .toList();
  
  @override
  String serializeAsString() => serializeAsMap().values.join('#');
  
  @override
  String toString() => 'MissionModelIdentifier(id: $id)';
  
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    
    return other is MissionModelIdentifier &&
      id == other.id;
  }
  
  @override
  int get hashCode =>
    id.hashCode;
}