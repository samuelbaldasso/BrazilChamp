
class ChampionshipData {
  final int year;
  final String team;
  final String coach;
  final String topScorer;
  final int points;
  final int wins;
  final int draws;
  final int losses;
  final int goalsScored;
  final int goalsConceded;
  final List<MemorableMatch> memorableMatches;

  ChampionshipData({
    required this.year,
    required this.team,
    required this.coach,
    required this.topScorer,
    required this.points,
    required this.wins,
    required this.draws,
    required this.losses,
    required this.goalsScored,
    required this.goalsConceded,
    required this.memorableMatches,
  });

  String get imageAsset => 'assets/teams/${_getTeamAssetName()}.png';

  String _getTeamAssetName() {
    final teamMap = {
      'Palmeiras': 'palmeiras',
      'Santos': 'santos',
      'Flamengo': 'flamengo',
      'Corinthians': 'corinthians',
      'São Paulo': 'sao_paulo',
      'Cruzeiro': 'cruzeiro',
      'Fluminense': 'fluminense',
      'Vasco da Gama': 'vasco',
      'Internacional': 'internacional',
      'Grêmio': 'gremio',
      'Atlético Mineiro': 'atletico_mg',
      'Bahia': 'bahia',
      'Botafogo': 'botafogo',
      'Atlético Paranaense': 'atletico_pr',
      'Coritiba': 'coritiba',
      'Guarani': 'guarani',
      'Sport': 'sport',
      'Flamengo/Sport': 'flamengo_sport',
    };
    return teamMap[team] ?? team.toLowerCase().replaceAll(' ', '_');
  }
}

class MemorableMatch {
  final String homeTeam;
  final String awayTeam;
  final int homeScore;
  final int awayScore;
  final String description;
  final String date;

  MemorableMatch({
    required this.homeTeam,
    required this.awayTeam,
    required this.homeScore,
    required this.awayScore,
    required this.description,
    required this.date,
  });
}

// Sample historical data for 2023
final championshipData2023 = ChampionshipData(
  year: 2023,
  team: 'Palmeiras',
  coach: 'Abel Ferreira',
  topScorer: 'Paulinho (20 gols)',
  points: 70,
  wins: 19,
  draws: 13,
  losses: 6,
  goalsScored: 60,
  goalsConceded: 32,
  memorableMatches: [
    MemorableMatch(
      homeTeam: 'Palmeiras',
      awayTeam: 'Cruzeiro',
      homeScore: 1,
      awayScore: 0,
      description: 'Vitória que garantiu o título matemático',
      date: '06/12/2023',
    ),
    MemorableMatch(
      homeTeam: 'Palmeiras',
      awayTeam: 'Fluminense',
      homeScore: 4,
      awayScore: 0,
      description: 'Goleada importante na reta final do campeonato',
      date: '03/12/2023',
    ),
  ],
);

// Function to get decade statistics
Map<String, int> getDecadeStatistics(List<ChampionshipData> championships) {
  final decadeStats = <String, int>{};

  for (final championship in championships) {
    final decade = (championship.year ~/ 10) * 10;
    final decadeKey = '${decade}s';
    decadeStats[decadeKey] = (decadeStats[decadeKey] ?? 0) + 1;
  }

  return decadeStats;
}
