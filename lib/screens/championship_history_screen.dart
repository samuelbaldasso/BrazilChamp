import 'package:flutter/material.dart';
import '../widgets/team_logo.dart';
import '../models/champion.dart';
import 'statistics_screen.dart';

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
              const Champion(year: 2020, team: 'Flamengo'),
              const Champion(year: 2019, team: 'Flamengo'),
              const Champion(year: 2018, team: 'Palmeiras'),
              const Champion(year: 2017, team: 'Corinthians'),
              const Champion(year: 2016, team: 'Palmeiras'),
              const Champion(year: 2015, team: 'Corinthians'),
              const Champion(year: 2014, team: 'Cruzeiro'),
              const Champion(year: 2013, team: 'Cruzeiro'),
              const Champion(year: 2012, team: 'Fluminense'),
              const Champion(year: 2011, team: 'Corinthians'),
              const Champion(year: 2010, team: 'Fluminense'),
              const Champion(year: 2009, team: 'Flamengo'),
              const Champion(year: 2008, team: 'São Paulo'),
              const Champion(year: 2007, team: 'São Paulo'),
              const Champion(year: 2006, team: 'São Paulo'),
              const Champion(year: 2005, team: 'Corinthians'),
              const Champion(year: 2004, team: 'Santos'),
              const Champion(year: 2003, team: 'Cruzeiro'),
            ],
          ),
          _buildChampionshipEra(
            context,
            title: 'Copa dos Campeões/Copa João Havelange (2000-2002)',
            champions: [
              const Champion(year: 2002, team: 'Santos'),
              const Champion(year: 2001, team: 'Atlético Paranaense'),
              const Champion(year: 2000, team: 'Vasco da Gama'),
            ],
          ),
          _buildChampionshipEra(
            context,
            title: 'Campeonato Brasileiro (1971-1999)',
            champions: [
              const Champion(year: 1999, team: 'Corinthians'),
              const Champion(year: 1998, team: 'Corinthians'),
              const Champion(year: 1997, team: 'Vasco da Gama'),
              const Champion(year: 1996, team: 'Grêmio'),
              const Champion(year: 1995, team: 'Botafogo'),
              const Champion(year: 1994, team: 'Palmeiras'),
              const Champion(year: 1993, team: 'Palmeiras'),
              const Champion(year: 1992, team: 'Flamengo'),
              const Champion(year: 1991, team: 'São Paulo'),
              const Champion(year: 1990, team: 'Corinthians'),
              const Champion(year: 1989, team: 'Vasco da Gama'),
              const Champion(year: 1988, team: 'Bahia'),
              const Champion(year: 1987, team: 'Flamengo/Sport'),
              const Champion(year: 1986, team: 'São Paulo'),
              const Champion(year: 1985, team: 'Coritiba'),
              const Champion(year: 1984, team: 'Fluminense'),
              const Champion(year: 1983, team: 'Flamengo'),
              const Champion(year: 1982, team: 'Flamengo'),
              const Champion(year: 1981, team: 'Grêmio'),
              const Champion(year: 1980, team: 'Flamengo'),
              const Champion(year: 1979, team: 'Internacional'),
              const Champion(year: 1978, team: 'Guarani'),
              const Champion(year: 1977, team: 'São Paulo'),
              const Champion(year: 1976, team: 'Internacional'),
              const Champion(year: 1975, team: 'Internacional'),
              const Champion(year: 1974, team: 'Vasco da Gama'),
              const Champion(year: 1973, team: 'Palmeiras'),
              const Champion(year: 1972, team: 'Palmeiras'),
              const Champion(year: 1971, team: 'Atlético Mineiro'),
            ],
          ),
          _buildChampionshipEra(
            context,
            title: 'Taça Brasil/Robertão (1959-1970)',
            champions: [
              const Champion(year: 1970, team: 'Fluminense'),
              const Champion(year: 1969, team: 'Palmeiras'),
              const Champion(year: 1968, team: 'Santos'),
              const Champion(year: 1967, team: 'Palmeiras'),
              const Champion(year: 1966, team: 'Cruzeiro'),
              const Champion(year: 1965, team: 'Santos'),
              const Champion(year: 1964, team: 'Santos'),
              const Champion(year: 1963, team: 'Santos'),
              const Champion(year: 1962, team: 'Santos'),
              const Champion(year: 1961, team: 'Santos'),
              const Champion(year: 1960, team: 'Palmeiras'),
              const Champion(year: 1959, team: 'Bahia'),
            ],
          ),
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
