import 'package:flutter/material.dart';

import '../controllers/cep_controller.dart';
import '../models/endereco_model.dart';

class CepPage extends StatefulWidget {
  const CepPage({super.key});

  @override
  State<CepPage> createState() => _CepPageState();
}

class _CepPageState extends State<CepPage> {
  final controller = CepController();

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Busca CEP'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: controller.cepTextController,
              keyboardType: TextInputType.number,
              maxLength: 8,
              decoration: const InputDecoration(
                labelText: 'CEP',
                hintText: 'Digite o CEP',
                border: OutlineInputBorder(),
                counterText: '',
              ),
              onSubmitted: (_) => controller.buscaCep(),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: ListenableBuilder(
                listenable: controller,
                builder: (context, _) {
                  final endereco = controller.endereco;
                  if (endereco == null) {
                    return const Center(child: Text('Nenhum endereço'));
                  }
                  return _EnderecoInfo(endereco: endereco);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _EnderecoInfo extends StatelessWidget {
  final EnderecoModel endereco;

  const _EnderecoInfo({required this.endereco});

  @override
  Widget build(BuildContext context) {
    final itens = {
      'CEP': endereco.cep,
      'Logradouro': endereco.logradouro,
      'Complemento': endereco.complemento,
      'Unidade': endereco.unidade,
      'Bairro': endereco.bairro,
      'Localidade': endereco.localidade,
      'UF': endereco.uf,
      'Estado': endereco.estado,
      'Região': endereco.regiao,
      'IBGE': endereco.ibge,
      'GIA': endereco.gia,
      'DDD': endereco.ddd,
      'SIAFI': endereco.siafi,
    };

    return Card(
      child: ListView(
        padding: const EdgeInsets.symmetric(vertical: 8),
        children: itens.entries
            .map(
              (item) => ListTile(
                dense: true,
                title: Text(item.key),
                trailing: Text(item.value.isEmpty ? '-' : item.value),
              ),
            )
            .toList(),
      ),
    );
  }
}
