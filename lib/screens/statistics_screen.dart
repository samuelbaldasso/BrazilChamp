import 'package:flutter/material.dart';
import '../widgets/decade_distribution_chart.dart';
import '../widgets/team_logo.dart';

class StatisticsScreen extends StatelessWidget {
  const StatisticsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Mapa de equipes e número de títulos
    final Map<String, int> championships = {
      'Palmeiras': 11,
      'Santos': 8,
      'Flamengo': 8,
      'Corinthians': 7,
      'São Paulo': 6,
      'Cruzeiro': 4,
      'Fluminense': 4,
      'Vasco da Gama': 4,
      'Internacional': 3,
      'Grêmio': 2,
      'Atlético Mineiro': 2,
      'Bahia': 2,
      'Botafogo': 1,
      'Atlético Paranaense': 1,
      'Coritiba': 1,
      'Guarani': 1,
      'Sport': 1,
    };

    final Map<String, int> decadeStats = {
      '1950s': 1,
      '1960s': 10,
      '1970s': 10,
      '1980s': 10,
      '1990s': 10,
      '2000s': 10,
      '2010s': 10,
      '2020s': 4,
    };

    final List<MapEntry<String, int>> sortedEntries = championships.entries
        .toList()
      ..sort((a, b) => b.value.compareTo(a.value));

    return Scaffold(
      appBar: AppBar(
        title: const Text('Estatísticas do Brasileirão'),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              color: Theme.of(context).primaryColor,
              padding: const EdgeInsets.all(16.0),
              child: const Column(
                children: [
                  Text(
                    'Panorama Histórico',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Desde 1959 até os dias atuais',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white70,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Maiores Campeões',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 16),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: sortedEntries.length,
                    itemBuilder: (context, index) {
                      final entry = sortedEntries[index];
                      return Card(
                        margin: const EdgeInsets.only(bottom: 8.0),
                        child: ListTile(
                          leading: TeamLogo(
                            teamName: entry.key,
                            size: 40,
                          ),
                          title: Text(
                            entry.key,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          trailing: Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 12.0,
                              vertical: 6.0,
                            ),
                            decoration: BoxDecoration(
                              color: Theme.of(context).primaryColor,
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                            child: Text(
                              '${entry.value} ${entry.value == 1 ? 'título' : 'títulos'}',
                              style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                  const SizedBox(height: 24),
                  const Text(
                    'Distribuição por Décadas',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 16),
                  DecadeDistributionChart(decadeStats: decadeStats),
                  const SizedBox(height: 24),
                  Card(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Curiosidades',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 16),
                          _buildFactCard(
                            'Maior Sequência',
                            'São Paulo (2006-2008)',
                            'Único time a vencer 3 títulos consecutivos no Brasileirão',
                          ),
                          _buildFactCard(
                            'Década de Ouro',
                            'Anos 2020',
                            'Palmeiras conquistou 2 títulos em 4 anos, mantendo sua hegemonia no futebol brasileiro',
                          ),
                          _buildFactCard(
                            'Primeiro Campeão',
                            'Bahia (1959)',
                            'Vencedor da primeira edição da Taça Brasil, derrotando o Santos na final',
                          ),
                          _buildFactCard(
                            'Rei do Brasil',
                            'Palmeiras (11 títulos)',
                            'Maior campeão nacional, com conquistas em diferentes formatos do campeonato',
                          ),
                          _buildFactCard(
                            'Era de Ouro do Santos',
                            '1961-1965',
                            'Pentacampeonato com o lendário time de Pelé',
                          ),
                          _buildFactCard(
                            'Rivalidade Histórica',
                            'Flamengo x Internacional (1987)',
                            'Final polêmica que terminou com o título dividido entre Flamengo e Sport',
                          ),
                          _buildFactCard(
                            'Artilheiro Histórico',
                            'Roberto Dinamite (190 gols)',
                            'Maior artilheiro da história do Campeonato Brasileiro, defendendo o Vasco da Gama',
                          ),
                          _buildFactCard(
                            'Recorde de Pontos',
                            'Flamengo 2019 (90 pontos)',
                            'Maior pontuação em uma única edição dos pontos corridos com 20 times',
                          ),
                          _buildFactCard(
                            'Maior Goleada',
                            'Vasco 9 x 0 Botafogo (2001)',
                            'Placar mais elástico da história dos pontos corridos',
                          ),
                          _buildFactCard(
                            'Invencibilidade',
                            'São Paulo 2008 (19 jogos)',
                            'Maior sequência invicta em uma única edição do campeonato',
                          ),
                          _buildFactCard(
                            'Equilíbrio Regional',
                            'Sudeste e Sul',
                            'As duas regiões concentram 90% dos títulos brasileiros',
                          ),
                          _buildFactCard(
                            'Técnico Mais Vitorioso',
                            'Lula (4 títulos)',
                            'Conquistou o tetracampeonato com o Santos entre 1961 e 1964',
                          ),
                          _buildFactCard(
                            'Estádio das Decisões',
                            'Maracanã',
                            'Palco de 14 conquistas do Campeonato Brasileiro',
                          ),
                          _buildFactCard(
                            'Virada Histórica',
                            'Internacional 2009',
                            'Ultrapassou o São Paulo na última rodada para conquistar o título',
                          ),
                          _buildFactCard(
                            'Jejum Encerrado',
                            'Atlético Mineiro 2021',
                            'Conquistou seu segundo título após 50 anos de espera',
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFactCard(String title, String highlight, String description) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16.0),
      child: InkWell(
        onTap: () {}, // Preparado para futuras interações
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(
                    _getIconForTitle(title),
                    color: Colors.green,
                    size: 24,
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      title,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Text(
                highlight,
                style: const TextStyle(
                  color: Colors.green,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                description,
                style: TextStyle(
                  color: Colors.grey[600],
                  fontSize: 14,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  IconData _getIconForTitle(String title) {
    switch (title) {
      case 'Maior Sequência':
        return Icons.repeat;
      case 'Década de Ouro':
        return Icons.star;
      case 'Primeiro Campeão':
        return Icons.emoji_events;
      case 'Rei do Brasil':
        return Icons.military_tech;
      case 'Era de Ouro do Santos':
        return Icons.workspace_premium;
      case 'Rivalidade Histórica':
        return Icons.sports_soccer;
      case 'Artilheiro Histórico':
        return Icons.sports;
      case 'Recorde de Pontos':
        return Icons.analytics;
      case 'Maior Goleada':
        return Icons.scoreboard;
      case 'Invencibilidade':
        return Icons.shield;
      case 'Equilíbrio Regional':
        return Icons.map;
      case 'Técnico Mais Vitorioso':
        return Icons.person;
      case 'Estádio das Decisões':
        return Icons.stadium;
      case 'Virada Histórica':
        return Icons.change_circle;
      case 'Jejum Encerrado':
        return Icons.timer_off;
      default:
        return Icons.info;
    }
  }
}
