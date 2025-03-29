# Brasileirão - História e Estatísticas

Um aplicativo Flutter que apresenta a rica história do Campeonato Brasileiro de Futebol, desde 1959 até os dias atuais.

## Funcionalidades

- 📅 Histórico completo de campeões desde 1959
- 📊 Estatísticas detalhadas e curiosidades
- 🏆 Informações sobre cada título conquistado
- 📈 Gráfico de distribuição de títulos por década
- 🎨 Interface moderna e intuitiva com Material Design 3
- 🔄 Animações suaves e transições elegantes

## Estrutura do Projeto

```
lib/
├── models/
│   ├── champion.dart
│   └── championship_data.dart
├── screens/
│   ├── championship_history_screen.dart
│   ├── splash_screen.dart
│   └── statistics_screen.dart
├── widgets/
│   ├── decade_distribution_chart.dart
│   └── team_logo.dart
└── main.dart
```

## Requisitos

- Flutter SDK 3.0.0 ou superior
- Dart SDK 2.17.0 ou superior

## Instalação

1. Clone o repositório:
```bash
git clone https://github.com/samuelbaldasso/BrazilChamp.git
```

2. Navegue até o diretório do projeto:
```bash
cd BrazilChamp
```

3. Instale as dependências:
```bash
flutter pub get
```

4. Execute o aplicativo:
```bash
flutter run
```

## Recursos Utilizados

- [Flutter](https://flutter.dev/) - Framework UI multiplataforma
- [fl_chart](https://pub.dev/packages/fl_chart) - Biblioteca para visualização de dados
- Material Design 3 - Sistema de design moderno do Google

## Contribuição

Contribuições são bem-vindas! Por favor, sinta-se à vontade para enviar pull requests ou abrir issues para melhorias.

## Licença

Este projeto está licenciado sob a Licença MIT - veja o arquivo [LICENSE](LICENSE) para detalhes.

## Agradecimentos

- Confederação Brasileira de Futebol (CBF) pelos dados históricos
- Comunidade Flutter pelo suporte e recursos
- Todos os clubes e torcedores que fazem parte desta história
