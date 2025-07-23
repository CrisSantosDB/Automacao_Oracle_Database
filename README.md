Automação Oracle Database
Este repositório contém dois scripts que desenvolvi para facilitar tarefas comuns no gerenciamento e instalação de bancos de dados Oracle em ambientes Linux. Ambos os scripts foram testados e validados em laboratório, com foco em automação, segurança e praticidade.

🛠️ Script: ConfiguracaoInstalacaoBanco19cRPM3
Este script automatiza o processo de instalação do Oracle Database 19c em sistemas Linux.

Funcionalidades:
Configuração do arquivo /etc/hosts

Desativação do SELinux

Liberação de portas no firewall

Instalação do pacote oracle-database-preinstall-19c

Alteração da senha do usuário oracle

Criação automática do banco de dados e do listener

Sobre o Projeto:
Decidi criar esse script após realizar diversas instalações manuais do Oracle 19c e notar a repetição das tarefas. Automatizar esse processo trouxe mais agilidade e confiabilidade à instalação.

O script possui verificações para interromper a execução em caso de falhas, garantindo que erros sejam tratados com segurança.

Importante: É recomendado ter conhecimento prévio sobre o processo de instalação do Oracle Database antes de utilizar este script.

📈 Script: Oracle_FRA_Space_Monitor
Este script monitora o uso da Fast Recovery Area (FRA) e envia alertas por e-mail quando o uso atinge uma porcentagem definida.

Funcionalidades:
Consulta automatizada ao espaço utilizado na FRA

Envio de alerta por e-mail quando o limite de uso for atingido

Compatível com agendamento via crontab

Sobre o Projeto:
Este script surgiu da necessidade de monitorar proativamente o uso da FRA. Foi uma ótima oportunidade para aprofundar meus conhecimentos em Shell Script e automação com Oracle.

Você pode personalizar o limite de uso da FRA conforme sua necessidade.

🔧 Personalização
Ambos os scripts estão disponíveis para testes em laboratório. Sinta-se à vontade para:

Ajustar configurações de ambiente (usuário, caminhos, alertas)

Modificar parâmetros conforme suas necessidades específicas

Compartilhar melhorias ou sugestões
