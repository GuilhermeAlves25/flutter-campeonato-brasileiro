#  App de Acompanhamento do Brasileirão

Aplicativo desenvolvido como projeto para a disciplina de Pragramação para dispositivos moveis, utilizando Flutter. O app exibe a tabela de classificação do Campeonato Brasileiro, com funcionalidades de busca, detalhes de times e troca de tema.

---

##  Funcionalidades Implementadas

- [X] **Tabela de Classificação:** Exibe a lista completa dos 20 times da Série A.
- [X] **Carregamento Assíncrono:** Os dados são carregados de um arquivo JSON local (`assets/tabela.json`).
- [X] **Gerenciamento de Estado com Provider:** A lógica de dados é separada da UI, com o estado sendo gerenciado pelo Provider.
- [X] **Busca em Tempo Real:** Filtra a lista de times conforme o usuário digita.
- [X] **Indicadores Visuais:** Barras coloridas indicam as zonas de classificação (Libertadores, Sul-Americana, etc.).
- [X] **Tela de Detalhes:** Mostra estatísticas detalhadas e o histórico de títulos de cada clube.
- [X] **Troca de Tema:** Um ícone no AppBar permite alternar entre o modo claro e escuro.
- [X] **Tratamento de Loading e Erro:** A UI exibe um indicador de progresso durante o carregamento e uma mensagem de erro caso os dados não sejam encontrados.

---

##  Como Executar o Projeto

1.  Clone o repositório.
2.  Certifique-se de ter o Flutter instalado e configurado.
3.  Na pasta raiz do projeto, execute o comando `flutter pub get` para instalar as dependências.
4.  Execute `flutter run` para iniciar o aplicativo em um emulador ou dispositivo.

---

##  Tecnologias Utilizadas

- **Linguagem:** Dart
- **Framework:** Flutter
- **Gerenciamento de Estado:** `provider`
- **Fontes:** `google_fonts`

---

##  Telas do Aplicativo

*(Dica: Tire screenshots do seu app nos modos claro e escuro e coloque aqui!)*

**Tela Principal (Modo Escuro)**
![Tela Principal Escuro] https://github.com/GuilhermeAlves25/flutter-campeonato-brasileiro/blob/main/screenshots/modoescuro.png?raw=true

**Tela de Detalhes (Modo Claro)**
![Tela Detalhes Claro] https://github.com/GuilhermeAlves25/flutter-campeonato-brasileiro/blob/main/screenshots/modoclaro.png?raw=true
