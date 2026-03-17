# Petitions Explorer - Projeto de estudo

App desenvolvido em UIKit que consome uma API pública de petições e exibe os dados em uma lista com navegação para detalhes.
Este projeto faz parte do curso *100 Days of Swift*, mas foi adaptado com foco em organização, arquitetura e escalabilidade. Simulando um cenário mais próximo do mercado.

## O que o app faz

* Consome uma API de petitions (JSON)
* Lista petitions em uma `UITableView`
* Exibe detalhes em uma `WKWebView`
* Permite filtrar petitions por palavra-chave
* Mostra créditos da API utilizada

## Arquitetura

O projeto foi estruturado usando **MVVM**, separando responsabilidades e facilitando manutenção e crescimento.

### Decisões importantes

* **MVVM** → lógica de negócio fora da ViewController
* **Feature-based structure** → cada tela isolada e organizada
* **Core desacoplado** → serviços e models reutilizáveis

## Melhorias em relação ao projeto original

Comparado ao projeto do curso, foram feitas algumas adaptações:

* UI totalmente programática (sem Storyboard)
* Separação clara de responsabilidades
* Criação de uma camada de network reutilizável, como já vem sendo estudado em outros projetos
* Uso de ViewModel para gerenciamento de estado
* Estrutura pronta para escalar (feature-based)
* Melhor organização do código e legibilidade

Feito durante a transição de carreira para iOS 🚀
