//
//  Generated code. Do not modify.
//  source: compte.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use typeCompteDescriptor instead')
const TypeCompte$json = {
  '1': 'TypeCompte',
  '2': [
    {'1': 'COURANT', '2': 0},
    {'1': 'EPARGNE', '2': 1},
  ],
};

/// Descriptor for `TypeCompte`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List typeCompteDescriptor = $convert.base64Decode(
    'CgpUeXBlQ29tcHRlEgsKB0NPVVJBTlQQABILCgdFUEFSR05FEAE=');

@$core.Deprecated('Use compteDescriptor instead')
const Compte$json = {
  '1': 'Compte',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
    {'1': 'solde', '3': 2, '4': 1, '5': 2, '10': 'solde'},
    {'1': 'dateCreation', '3': 3, '4': 1, '5': 9, '10': 'dateCreation'},
    {'1': 'type', '3': 4, '4': 1, '5': 14, '6': '.ma.projet.grpc.stubs.TypeCompte', '10': 'type'},
  ],
};

/// Descriptor for `Compte`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List compteDescriptor = $convert.base64Decode(
    'CgZDb21wdGUSDgoCaWQYASABKAlSAmlkEhQKBXNvbGRlGAIgASgCUgVzb2xkZRIiCgxkYXRlQ3'
    'JlYXRpb24YAyABKAlSDGRhdGVDcmVhdGlvbhI0CgR0eXBlGAQgASgOMiAubWEucHJvamV0Lmdy'
    'cGMuc3R1YnMuVHlwZUNvbXB0ZVIEdHlwZQ==');

@$core.Deprecated('Use compteRequestDescriptor instead')
const CompteRequest$json = {
  '1': 'CompteRequest',
  '2': [
    {'1': 'solde', '3': 1, '4': 1, '5': 2, '10': 'solde'},
    {'1': 'dateCreation', '3': 2, '4': 1, '5': 9, '10': 'dateCreation'},
    {'1': 'type', '3': 3, '4': 1, '5': 14, '6': '.ma.projet.grpc.stubs.TypeCompte', '10': 'type'},
  ],
};

/// Descriptor for `CompteRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List compteRequestDescriptor = $convert.base64Decode(
    'Cg1Db21wdGVSZXF1ZXN0EhQKBXNvbGRlGAEgASgCUgVzb2xkZRIiCgxkYXRlQ3JlYXRpb24YAi'
    'ABKAlSDGRhdGVDcmVhdGlvbhI0CgR0eXBlGAMgASgOMiAubWEucHJvamV0LmdycGMuc3R1YnMu'
    'VHlwZUNvbXB0ZVIEdHlwZQ==');

@$core.Deprecated('Use soldeStatsDescriptor instead')
const SoldeStats$json = {
  '1': 'SoldeStats',
  '2': [
    {'1': 'count', '3': 1, '4': 1, '5': 5, '10': 'count'},
    {'1': 'sum', '3': 2, '4': 1, '5': 2, '10': 'sum'},
    {'1': 'average', '3': 3, '4': 1, '5': 2, '10': 'average'},
  ],
};

/// Descriptor for `SoldeStats`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List soldeStatsDescriptor = $convert.base64Decode(
    'CgpTb2xkZVN0YXRzEhQKBWNvdW50GAEgASgFUgVjb3VudBIQCgNzdW0YAiABKAJSA3N1bRIYCg'
    'dhdmVyYWdlGAMgASgCUgdhdmVyYWdl');

@$core.Deprecated('Use getAllComptesRequestDescriptor instead')
const GetAllComptesRequest$json = {
  '1': 'GetAllComptesRequest',
};

/// Descriptor for `GetAllComptesRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getAllComptesRequestDescriptor = $convert.base64Decode(
    'ChRHZXRBbGxDb21wdGVzUmVxdWVzdA==');

@$core.Deprecated('Use getAllComptesResponseDescriptor instead')
const GetAllComptesResponse$json = {
  '1': 'GetAllComptesResponse',
  '2': [
    {'1': 'comptes', '3': 1, '4': 3, '5': 11, '6': '.ma.projet.grpc.stubs.Compte', '10': 'comptes'},
  ],
};

/// Descriptor for `GetAllComptesResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getAllComptesResponseDescriptor = $convert.base64Decode(
    'ChVHZXRBbGxDb21wdGVzUmVzcG9uc2USNgoHY29tcHRlcxgBIAMoCzIcLm1hLnByb2pldC5ncn'
    'BjLnN0dWJzLkNvbXB0ZVIHY29tcHRlcw==');

@$core.Deprecated('Use getCompteByIdRequestDescriptor instead')
const GetCompteByIdRequest$json = {
  '1': 'GetCompteByIdRequest',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
  ],
};

/// Descriptor for `GetCompteByIdRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getCompteByIdRequestDescriptor = $convert.base64Decode(
    'ChRHZXRDb21wdGVCeUlkUmVxdWVzdBIOCgJpZBgBIAEoCVICaWQ=');

@$core.Deprecated('Use getCompteByIdResponseDescriptor instead')
const GetCompteByIdResponse$json = {
  '1': 'GetCompteByIdResponse',
  '2': [
    {'1': 'compte', '3': 1, '4': 1, '5': 11, '6': '.ma.projet.grpc.stubs.Compte', '10': 'compte'},
  ],
};

/// Descriptor for `GetCompteByIdResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getCompteByIdResponseDescriptor = $convert.base64Decode(
    'ChVHZXRDb21wdGVCeUlkUmVzcG9uc2USNAoGY29tcHRlGAEgASgLMhwubWEucHJvamV0LmdycG'
    'Muc3R1YnMuQ29tcHRlUgZjb21wdGU=');

@$core.Deprecated('Use getTotalSoldeRequestDescriptor instead')
const GetTotalSoldeRequest$json = {
  '1': 'GetTotalSoldeRequest',
};

/// Descriptor for `GetTotalSoldeRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getTotalSoldeRequestDescriptor = $convert.base64Decode(
    'ChRHZXRUb3RhbFNvbGRlUmVxdWVzdA==');

@$core.Deprecated('Use getTotalSoldeResponseDescriptor instead')
const GetTotalSoldeResponse$json = {
  '1': 'GetTotalSoldeResponse',
  '2': [
    {'1': 'stats', '3': 1, '4': 1, '5': 11, '6': '.ma.projet.grpc.stubs.SoldeStats', '10': 'stats'},
  ],
};

/// Descriptor for `GetTotalSoldeResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getTotalSoldeResponseDescriptor = $convert.base64Decode(
    'ChVHZXRUb3RhbFNvbGRlUmVzcG9uc2USNgoFc3RhdHMYASABKAsyIC5tYS5wcm9qZXQuZ3JwYy'
    '5zdHVicy5Tb2xkZVN0YXRzUgVzdGF0cw==');

@$core.Deprecated('Use saveCompteRequestDescriptor instead')
const SaveCompteRequest$json = {
  '1': 'SaveCompteRequest',
  '2': [
    {'1': 'compte', '3': 1, '4': 1, '5': 11, '6': '.ma.projet.grpc.stubs.CompteRequest', '10': 'compte'},
  ],
};

/// Descriptor for `SaveCompteRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List saveCompteRequestDescriptor = $convert.base64Decode(
    'ChFTYXZlQ29tcHRlUmVxdWVzdBI7CgZjb21wdGUYASABKAsyIy5tYS5wcm9qZXQuZ3JwYy5zdH'
    'Vicy5Db21wdGVSZXF1ZXN0UgZjb21wdGU=');

@$core.Deprecated('Use saveCompteResponseDescriptor instead')
const SaveCompteResponse$json = {
  '1': 'SaveCompteResponse',
  '2': [
    {'1': 'compte', '3': 1, '4': 1, '5': 11, '6': '.ma.projet.grpc.stubs.Compte', '10': 'compte'},
  ],
};

/// Descriptor for `SaveCompteResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List saveCompteResponseDescriptor = $convert.base64Decode(
    'ChJTYXZlQ29tcHRlUmVzcG9uc2USNAoGY29tcHRlGAEgASgLMhwubWEucHJvamV0LmdycGMuc3'
    'R1YnMuQ29tcHRlUgZjb21wdGU=');

@$core.Deprecated('Use getComptesByTypeRequestDescriptor instead')
const GetComptesByTypeRequest$json = {
  '1': 'GetComptesByTypeRequest',
  '2': [
    {'1': 'type', '3': 1, '4': 1, '5': 14, '6': '.ma.projet.grpc.stubs.TypeCompte', '10': 'type'},
  ],
};

/// Descriptor for `GetComptesByTypeRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getComptesByTypeRequestDescriptor = $convert.base64Decode(
    'ChdHZXRDb21wdGVzQnlUeXBlUmVxdWVzdBI0CgR0eXBlGAEgASgOMiAubWEucHJvamV0LmdycG'
    'Muc3R1YnMuVHlwZUNvbXB0ZVIEdHlwZQ==');

@$core.Deprecated('Use getComptesByTypeResponseDescriptor instead')
const GetComptesByTypeResponse$json = {
  '1': 'GetComptesByTypeResponse',
  '2': [
    {'1': 'comptes', '3': 1, '4': 3, '5': 11, '6': '.ma.projet.grpc.stubs.Compte', '10': 'comptes'},
  ],
};

/// Descriptor for `GetComptesByTypeResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getComptesByTypeResponseDescriptor = $convert.base64Decode(
    'ChhHZXRDb21wdGVzQnlUeXBlUmVzcG9uc2USNgoHY29tcHRlcxgBIAMoCzIcLm1hLnByb2pldC'
    '5ncnBjLnN0dWJzLkNvbXB0ZVIHY29tcHRlcw==');

@$core.Deprecated('Use deleteCompteRequestDescriptor instead')
const DeleteCompteRequest$json = {
  '1': 'DeleteCompteRequest',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
  ],
};

/// Descriptor for `DeleteCompteRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List deleteCompteRequestDescriptor = $convert.base64Decode(
    'ChNEZWxldGVDb21wdGVSZXF1ZXN0Eg4KAmlkGAEgASgJUgJpZA==');

@$core.Deprecated('Use deleteCompteResponseDescriptor instead')
const DeleteCompteResponse$json = {
  '1': 'DeleteCompteResponse',
  '2': [
    {'1': 'success', '3': 1, '4': 1, '5': 8, '10': 'success'},
    {'1': 'message', '3': 2, '4': 1, '5': 9, '10': 'message'},
  ],
};

/// Descriptor for `DeleteCompteResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List deleteCompteResponseDescriptor = $convert.base64Decode(
    'ChREZWxldGVDb21wdGVSZXNwb25zZRIYCgdzdWNjZXNzGAEgASgIUgdzdWNjZXNzEhgKB21lc3'
    'NhZ2UYAiABKAlSB21lc3NhZ2U=');

