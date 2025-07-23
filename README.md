# 🚀 Automação Oracle Database

Este repositório contém dois scripts que desenvolvi para facilitar tarefas comuns no gerenciamento e instalação de bancos de dados Oracle em ambientes Linux. Ambos os scripts foram testados e validados em laboratório, com foco em **automação**, **segurança** e **praticidade**.

---

## 🛠️ Script: `ConfiguracaoInstalacaoBanco19cRPM3`

Automatiza a instalação do **Oracle Database 19c** em sistemas Linux.

### ✅ Funcionalidades:
- Configuração do arquivo `/etc/hosts`
- Desativação do SELinux
- Liberação de portas no firewall
- Instalação do pacote `oracle-database-preinstall-19c`
- Alteração da senha do usuário `oracle`
- Criação automática do banco de dados e do listener

### ℹ️ Sobre:
Desenvolvi este script após várias instalações manuais do Oracle 19c. A automação tornou o processo mais rápido e confiável.  
Incluí verificações para detectar erros e cancelar a execução caso algo saia do esperado, garantindo maior segurança.

> ⚠️ **Recomenda-se** ter conhecimento prévio sobre a instalação do Oracle Database antes de utilizar este script.

---

## 📈 Script: `Oracle_FRA_Space_Monitor`

Monitora o uso da **Fast Recovery Area (FRA)** e envia alertas por e-mail ao atingir um limite configurado.

### ✅ Funcionalidades:
- Verificação automática do espaço utilizado na FRA
- Envio de e-mail quando a utilização atingir a porcentagem definida
- Pode ser agendado via `crontab` para execução periódica

### ℹ️ Sobre:
Este script me ajudou a explorar a automação de monitoramento em ambientes Oracle.  
Você pode personalizar o limite de uso e adaptar o script conforme as necessidades do seu ambiente.

---

## ⚙️ Personalização

Ambos os scripts estão disponíveis para **testes em laboratório**.  
Sinta-se à vontade para:
- Ajustar configurações de ambiente
- Alterar usuários, caminhos e parâmetros
- Adicionar melhorias e contribuir com sugestões

---


