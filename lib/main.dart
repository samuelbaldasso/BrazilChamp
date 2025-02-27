import 'package:flutter/material.dart';
import 'screens/splash_screen.dart';
import 'screens/statistics_screen.dart';
import 'widgets/team_logo.dart';

void main() {
  runApp(const BrazilianChampionshipApp());
}

class BrazilianChampionshipApp extends StatelessWidget {
  const BrazilianChampionshipApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Campeonato Brasileiro',
      theme: ThemeData(
        primarySwatch: Colors.green,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        useMaterial3: true,
      ),
      home: const SplashScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class ChampionshipHistoryScreen extends StatelessWidget {
  const ChampionshipHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Histórico do Brasileirão'),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              'Campeões do Campeonato Brasileiro',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          _buildChampionshipEra(
            context,
            title: 'Era Pontos Corridos (2003-2023)',
            champions: [
              const Champion(year: 2023, team: 'Palmeiras'),
              const Champion(year: 2022, team: 'Palmeiras'),
              const Champion(year: 2021, team: 'Atlético Mineiro'),
              // ... rest of the champions
            ],
          ),
          // ... rest of the eras
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const StatisticsScreen(),
            ),
          );
        },
        tooltip: 'Estatísticas',
        child: const Icon(Icons.bar_chart),
      ),
    );
  }

  Widget _buildChampionshipEra(
    BuildContext context, {
    required String title,
    required List<Champion> champions,
  }) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: ExpansionTile(
        title: Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        children: [
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: champions.length,
            itemBuilder: (context, index) {
              final champion = champions[index];
              return ListTile(
                leading: TeamLogo(
                  teamName: champion.team,
                  size: 40,
                ),
                title: Text(champion.team),
                trailing: Text(
                  champion.year.toString(),
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          ChampionDetailScreen(champion: champion),
                    ),
                  );
                },
              );
            },
          ),
        ],
      ),
    );
  }
}

class ChampionDetailScreen extends StatelessWidget {
  final Champion champion;

  const ChampionDetailScreen({
    super.key,
    required this.champion,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${champion.team} - ${champion.year}'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 16),
            TeamLogo(
              teamName: champion.team,
              size: 120,
            ),
            const SizedBox(height: 24),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildInfoRow('Campeão', champion.team),
                    _buildInfoRow('Ano', champion.year.toString()),
                    _buildInfoRow('Técnico', 'Dados não disponíveis'),
                    _buildInfoRow('Artilheiro', 'Dados não disponíveis'),
                    _buildInfoRow('Pontos', 'Dados não disponíveis'),
                    _buildInfoRow('Vitórias', 'Dados não disponíveis'),
                    _buildInfoRow('Empates', 'Dados não disponíveis'),
                    _buildInfoRow('Derrotas', 'Dados não disponíveis'),
                    _buildInfoRow('Gols marcados', 'Dados não disponíveis'),
                    _buildInfoRow('Gols sofridos', 'Dados não disponíveis'),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),
            const Text(
              'Jogos Memoráveis',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            const Card(
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Center(
                  child: Text(
                    'Informações sobre jogos memoráveis seriam exibidas aqui',
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          Text(
            value,
            style: const TextStyle(
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}

class Champion {
  final int year;
  final String team;

  const Champion({
    required this.year,
    required this.team,
  });
}
