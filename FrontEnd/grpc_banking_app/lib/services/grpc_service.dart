import 'package:grpc/grpc.dart';
import 'dart:io';
import '../src/generated/compte.pbgrpc.dart';

class GrpcService {
  static final GrpcService _instance = GrpcService._internal();
  late CompteServiceClient stub;
  late ClientChannel channel;

  factory GrpcService() {
    return _instance;
  }

  GrpcService._internal() {
    try {
      print('Initialisation du service gRPC...');
      const host = '10.0.2.2';
      const port = 9090;
      print('Tentative de connexion à $host:$port');
      
      channel = ClientChannel(
        host,
        port: port,
        options: const ChannelOptions(
          credentials: ChannelCredentials.insecure(),
          connectionTimeout: Duration(seconds: 10),
          idleTimeout: Duration(minutes: 1),
        ),
      );
      print('Canal créé avec succès');
      stub = CompteServiceClient(channel);
      print('Client gRPC initialisé');
    } catch (e) {
      print('Erreur lors de l\'initialisation du service gRPC: $e');
      rethrow;
    }
  }

  Future<void> dispose() async {
    await channel.shutdown();
  }

  Future<List<Compte>> getAllComptes() async {
    try {
      print('🌐 Démarrage getAllComptes');
      final response = await stub.allComptes(
        GetAllComptesRequest(),
        options: CallOptions(timeout: Duration(seconds: 10)),
      );
      print('✅ getAllComptes - Status: OK');
      print('📦 Nombre de comptes: ${response.comptes.length}');
      return response.comptes;
    } catch (e) {
      print('❌ getAllComptes - Erreur: $e');
      rethrow;
    }
  }

  Future<Compte> saveCompte(CompteRequest compte) async {
    try {
      print('🌐 Démarrage saveCompte');
      final response = await stub.saveCompte(
        SaveCompteRequest()..compte = compte,
        options: CallOptions(timeout: Duration(seconds: 10)),
      );
      print('✅ saveCompte - Status: OK');
      print('📦 Compte sauvegardé avec ID: ${response.compte.id}');
      return response.compte;
    } catch (e) {
      print('❌ saveCompte - Erreur: $e');
      rethrow;
    }
  }

  Future<bool> deleteCompte(String id) async {
    final response = await stub.deleteCompte(DeleteCompteRequest()..id = id);
    return response.success;
  }
} 