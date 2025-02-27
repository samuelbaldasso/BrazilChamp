import 'package:flutter/material.dart';

class TeamLogo extends StatelessWidget {
  final String teamName;
  final double size;

  const TeamLogo({
    super.key,
    required this.teamName,
    this.size = 60,
  });

  @override
  Widget build(BuildContext context) {
    final TeamStyle style = _getTeamStyle(teamName);

    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: style.colors,
        ),
        border: Border.all(
          color: style.borderColor,
          width: 2,
        ),
      ),
      child: Center(
        child: Text(
          style.initials,
          style: TextStyle(
            color: style.textColor,
            fontWeight: FontWeight.bold,
            fontSize: size * 0.2,
          ),
        ),
      ),
    );
  }

  TeamStyle _getTeamStyle(String teamName) {
    switch (teamName) {
      case 'Palmeiras':
        return TeamStyle(
          initials: 'PAL',
          colors: [Colors.green[800]!, Colors.green[600]!],
          textColor: Colors.white,
          borderColor: Colors.white,
        );
      case 'Santos':
        return TeamStyle(
          initials: 'SAN',
          colors: [Colors.white, Colors.grey[100]!],
          textColor: Colors.black,
          borderColor: Colors.black,
        );
      case 'Flamengo':
        return TeamStyle(
          initials: 'FLA',
          colors: [Colors.red[900]!, Colors.black],
          textColor: Colors.white,
          borderColor: Colors.red[900]!,
        );
      case 'Corinthians':
        return TeamStyle(
          initials: 'COR',
          colors: [Colors.black, Colors.grey[900]!],
          textColor: Colors.white,
          borderColor: Colors.white,
        );
      case 'São Paulo':
        return TeamStyle(
          initials: 'SAO',
          colors: [Colors.red[900]!, Colors.white, Colors.black],
          textColor: Colors.white,
          borderColor: Colors.red[900]!,
        );
      case 'Cruzeiro':
        return TeamStyle(
          initials: 'CRU',
          colors: [Colors.blue[900]!, Colors.blue[700]!],
          textColor: Colors.white,
          borderColor: Colors.white,
        );
      case 'Fluminense':
        return TeamStyle(
          initials: 'FLU',
          colors: [Colors.green[700]!, Colors.red[700]!],
          textColor: Colors.white,
          borderColor: Colors.white,
        );
      case 'Vasco da Gama':
        return TeamStyle(
          initials: 'VAS',
          colors: [Colors.black, Colors.white],
          textColor: Colors.red[900]!,
          borderColor: Colors.red[900]!,
        );
      case 'Internacional':
        return TeamStyle(
          initials: 'INT',
          colors: [Colors.red[900]!, Colors.red[700]!],
          textColor: Colors.white,
          borderColor: Colors.white,
        );
      case 'Grêmio':
        return TeamStyle(
          initials: 'GRE',
          colors: [Colors.blue[900]!, Colors.black],
          textColor: Colors.white,
          borderColor: Colors.white,
        );
      case 'Atlético Mineiro':
        return TeamStyle(
          initials: 'CAM',
          colors: [Colors.black, Colors.grey[900]!],
          textColor: Colors.white,
          borderColor: Colors.white,
        );
      case 'Bahia':
        return TeamStyle(
          initials: 'BAH',
          colors: [Colors.blue[700]!, Colors.red[700]!],
          textColor: Colors.white,
          borderColor: Colors.white,
        );
      case 'Botafogo':
        return TeamStyle(
          initials: 'BOT',
          colors: [Colors.black, Colors.grey[900]!],
          textColor: Colors.white,
          borderColor: Colors.white,
        );
      case 'Atlético Paranaense':
        return TeamStyle(
          initials: 'CAP',
          colors: [Colors.red[900]!, Colors.black],
          textColor: Colors.white,
          borderColor: Colors.red[900]!,
        );
      case 'Coritiba':
        return TeamStyle(
          initials: 'CFC',
          colors: [Colors.green[800]!, Colors.white],
          textColor: Colors.green[800]!,
          borderColor: Colors.green[800]!,
        );
      case 'Guarani':
        return TeamStyle(
          initials: 'GUA',
          colors: [Colors.green[800]!, Colors.green[600]!],
          textColor: Colors.white,
          borderColor: Colors.white,
        );
      case 'Sport':
        return TeamStyle(
          initials: 'SPT',
          colors: [Colors.red[900]!, Colors.black],
          textColor: Colors.white,
          borderColor: Colors.red[900]!,
        );
      case 'Flamengo/Sport':
        return TeamStyle(
          initials: 'F/S',
          colors: [Colors.red[900]!, Colors.black],
          textColor: Colors.white,
          borderColor: Colors.red[900]!,
        );
      default:
        return TeamStyle(
          initials:
              teamName.substring(0, min(3, teamName.length)).toUpperCase(),
          colors: [Colors.grey[400]!, Colors.grey[300]!],
          textColor: Colors.black,
          borderColor: Colors.grey[400]!,
        );
    }
  }
}

class TeamStyle {
  final String initials;
  final List<Color> colors;
  final Color textColor;
  final Color borderColor;

  const TeamStyle({
    required this.initials,
    required this.colors,
    required this.textColor,
    required this.borderColor,
  });
}

int min(int a, int b) => a < b ? a : b;
