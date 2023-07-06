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


/** This is an auto generated class representing the Adresse type in your schema. */
class Adresse {
  final String? _rue;
  final String? _cPostal;
  final String? _numero;
  final String? _ville;

  String? get rue {
    return _rue;
  }
  
  String? get cPostal {
    return _cPostal;
  }
  
  String? get numero {
    return _numero;
  }
  
  String? get ville {
    return _ville;
  }
  
  const Adresse._internal({rue, cPostal, numero, ville}): _rue = rue, _cPostal = cPostal, _numero = numero, _ville = ville;
  
  factory Adresse({String? rue, String? cPostal, String? numero, String? ville}) {
    return Adresse._internal(
      rue: rue,
      cPostal: cPostal,
      numero: numero,
      ville: ville);
  }
  
  bool equals(Object other) {
    return this == other;
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Adresse &&
      _rue == other._rue &&
      _cPostal == other._cPostal &&
      _numero == other._numero &&
      _ville == other._ville;
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("Adresse {");
    buffer.write("rue=" + "$_rue" + ", ");
    buffer.write("cPostal=" + "$_cPostal" + ", ");
    buffer.write("numero=" + "$_numero" + ", ");
    buffer.write("ville=" + "$_ville");
    buffer.write("}");
    
    return buffer.toString();
  }
  
  Adresse copyWith({String? rue, String? cPostal, String? numero, String? ville}) {
    return Adresse._internal(
      rue: rue ?? this.rue,
      cPostal: cPostal ?? this.cPostal,
      numero: numero ?? this.numero,
      ville: ville ?? this.ville);
  }
  
  Adresse copyWithModelFieldValues({
    ModelFieldValue<String?>? rue,
    ModelFieldValue<String?>? cPostal,
    ModelFieldValue<String?>? numero,
    ModelFieldValue<String?>? ville
  }) {
    return Adresse._internal(
      rue: rue == null ? this.rue : rue.value,
      cPostal: cPostal == null ? this.cPostal : cPostal.value,
      numero: numero == null ? this.numero : numero.value,
      ville: ville == null ? this.ville : ville.value
    );
  }
  
  Adresse.fromJson(Map<String, dynamic> json)  
    : _rue = json['rue'],
      _cPostal = json['cPostal'],
      _numero = json['numero'],
      _ville = json['ville'];
  
  Map<String, dynamic> toJson() => {
    'rue': _rue, 'cPostal': _cPostal, 'numero': _numero, 'ville': _ville
  };
  
  Map<String, Object?> toMap() => {
    'rue': _rue,
    'cPostal': _cPostal,
    'numero': _numero,
    'ville': _ville
  };

  static var schema = amplify_core.Model.defineSchema(define: (amplify_core.ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "Adresse";
    modelSchemaDefinition.pluralName = "Adresses";
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.customTypeField(
      fieldName: 'rue',
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.customTypeField(
      fieldName: 'cPostal',
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.customTypeField(
      fieldName: 'numero',
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.customTypeField(
      fieldName: 'ville',
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
  });
}