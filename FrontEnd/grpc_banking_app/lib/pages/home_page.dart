import 'package:flutter/material.dart';
import '../services/grpc_service.dart';
import '../models/compte_model.dart';
import '../src/generated/compte.pb.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GrpcService _grpcService = GrpcService();
  List<CompteModel> _comptes = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadComptes();
  }

  Future<void> _loadComptes() async {
    try {
      setState(() => _isLoading = true);
      print('Chargement des comptes...');
      final comptes = await _grpcService.getAllComptes();
      print('Comptes reçus: ${comptes.length}');
      comptes.forEach((compte) {
        print('Compte: ID=${compte.id}, Solde=${compte.solde}, Type=${compte.type}');
      });
      setState(() {
        _comptes = comptes.map((c) => CompteModel.fromGrpc(c)).toList();
        _isLoading = false;
      });
    } catch (e) {
      print('Erreur de chargement: $e');
      setState(() => _isLoading = false);
      _showError('Erreur lors du chargement: ${e.toString()}');
    }
  }

  Future<void> _addCompte() async {
    final result = await showDialog<Map<String, dynamic>>(
      context: context,
      builder: (context) => AddCompteDialog(),
    );

    if (result != null) {
      try {
        final request = CompteRequest()
          ..solde = result['solde']
          ..type = result['type'];
        
        await _grpcService.saveCompte(request);
        _loadComptes();
      } catch (e) {
        _showError('Erreur lors de l\'ajout: ${e.toString()}');
      }
    }
  }

  Future<void> _deleteCompte(String id) async {
    try {
      final success = await _grpcService.deleteCompte(id);
      if (success) {
        _loadComptes();
      } else {
        _showError('Échec de la suppression');
      }
    } catch (e) {
      _showError('Erreur lors de la suppression: ${e.toString()}');
    }
  }

  void _showError(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mes Comptes Bancaires'),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: _loadComptes,
          ),
        ],
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: _comptes.length,
              itemBuilder: (context, index) {
                final compte = _comptes[index];
                return Card(
                  margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  child: ListTile(
                    title: Text('Compte ${compte.type.name}'),
                    subtitle: Text('Créé le ${compte.dateCreation}'),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          '${compte.solde.toStringAsFixed(2)} €',
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        const SizedBox(width: 8),
                        IconButton(
                          icon: const Icon(Icons.delete, color: Colors.red),
                          onPressed: () => _confirmDelete(compte),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addCompte,
        child: const Icon(Icons.add),
      ),
    );
  }

  Future<void> _confirmDelete(CompteModel compte) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Confirmation'),
        content: Text('Voulez-vous vraiment supprimer ce compte ${compte.type.name} ?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: const Text('Annuler'),
          ),
          TextButton(
            onPressed: () => Navigator.of(context).pop(true),
            style: TextButton.styleFrom(foregroundColor: Colors.red),
            child: const Text('Supprimer'),
          ),
        ],
      ),
    );

    if (confirmed == true) {
      try {
        final success = await _grpcService.deleteCompte(compte.id);
        if (success) {
          _loadComptes();
          if (mounted) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Compte supprimé avec succès')),
            );
          }
        } else {
          _showError('Échec de la suppression');
        }
      } catch (e) {
        _showError('Erreur lors de la suppression: ${e.toString()}');
      }
    }
  }

  @override
  void dispose() {
    _grpcService.dispose();
    super.dispose();
  }
}

class AddCompteDialog extends StatefulWidget {
  @override
  _AddCompteDialogState createState() => _AddCompteDialogState();
}

class _AddCompteDialogState extends State<AddCompteDialog> {
  final _formKey = GlobalKey<FormState>();
  final _soldeController = TextEditingController();
  TypeCompte _selectedType = TypeCompte.COURANT;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Nouveau compte'),
      content: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextFormField(
              controller: _soldeController,
              decoration: const InputDecoration(labelText: 'Solde initial'),
              keyboardType: TextInputType.number,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Veuillez entrer un montant';
                }
                if (double.tryParse(value) == null) {
                  return 'Veuillez entrer un nombre valide';
                }
                return null;
              },
            ),
            const SizedBox(height: 16),
            DropdownButtonFormField<TypeCompte>(
              value: _selectedType,
              decoration: const InputDecoration(labelText: 'Type de compte'),
              items: TypeCompte.values.map((type) {
                return DropdownMenuItem(
                  value: type,
                  child: Text(type.name),
                );
              }).toList(),
              onChanged: (value) {
                setState(() => _selectedType = value!);
              },
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('Annuler'),
        ),
        ElevatedButton(
          onPressed: () {
            if (_formKey.currentState!.validate()) {
              Navigator.pop(context, {
                'solde': double.parse(_soldeController.text),
                'type': _selectedType,
              });
            }
          },
          child: const Text('Créer'),
        ),
      ],
    );
  }

  @override
  void dispose() {
    _soldeController.dispose();
    super.dispose();
  }
} 