import '../src/generated/compte.pb.dart';

class CompteModel {
  final String id;
  final double solde;
  final String dateCreation;
  final TypeCompte type;

  CompteModel({
    required this.id,
    required this.solde,
    required this.dateCreation,
    required this.type,
  });

  factory CompteModel.fromGrpc(Compte compte) {
    return CompteModel(
      id: compte.id,
      solde: compte.solde,
      dateCreation: compte.dateCreation,
      type: compte.type,
    );
  }

  CompteRequest toGrpcRequest() {
    return CompteRequest()
      ..solde = solde
      ..type = type;
  }
} 