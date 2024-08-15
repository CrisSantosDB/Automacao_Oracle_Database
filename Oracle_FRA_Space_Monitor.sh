#!/bin/bash
###################################################################################################################
# Script Name    : Oracle_FRA_Space_Monitor.sh                                                                    #
# Description    : Script para monitorar e alertar sobre o espaço utilizado no Fast Recovery Area (FRA) do Oracle #
# Author         : Cristina dos Santos                                                                            #
# Email          : chrisreviloutbreak@gmail.com                                                                   #
# Execute        : ./Oracle_FRA_Space_Monitor.sh                                                                  #
###################################################################################################################

#Configuração de variáveis de conexão ao Oracle: usuário, senha e instância.

v_user="cris"
v_pass="crisle1830"
v_instance="orcl19c"

#Configuração das variáveis de ambiente para a conexão e execução de comandos no Oracle Database.

export ORACLE_HOME=/u01/app/oracle/product/19.3.0.0/dbhome_1/
export ORACLE_SID=orcl19c
export PATH=$ORACLE_HOME/bin:$PATH
export PATH=/usr/sbin:$PATH

#Definição do arquivo de saída para armazenar os resultados da execução dos comandos SQL.

output_file="saida_teste1.txt"

# Comando para conectar ao Banco de Dados Oracle e executar uma consulta SQL para calcular a porcentagem de espaço utilizado no Fast Recovery Area (FRA).                                                                                Os resultados são redirecionados para o arquivo especificado (saida_teste1.txt).

sqlplus ${v_user}/${v_pass}@${v_instance} << EOF  > ${output_file}
SELECT decode( nvl( space_used, 2),
              0,
              0,
              ceil ( ( space_used / space_limit) * 100) ) PCT_USED
FROM v\$recovery_file_dest;
EXIT;
EOF


#Extração da porcentagem de espaço utilizado no Fast Recovery Area (FRA) do arquivo de saída gerado pela consulta SQL, e exibição do resultado.

percentagem=$(awk '/PCT_USED/ {getline; getline; print $1}' ${output_file})
    echo "Porcentagem de espaço utilizado no FRA: ${percentagem}%"

#Condição para enviar um e-mail de alerta caso a porcentagem de espaço utilizado no Fast Recovery Area (FRA) seja igual ou superior a 70%.                                                                                               O e-mail é enviado via terminal Linux usando o utilitário mailx, informando sobre a necessidade de atenção devido ao espaço crítico no FRA.

if [ ${percentagem} -ge 70 ];then
        echo "Esse email está sendo enviado via terminal Linux" | \
		mailx -s "ATENÇÃO!FRA está com $percentagem%" \
		-S smtp="smtp-mail.outlook.com:587" \
		-S smtp-use-starttls -S smtp-auth=login \
		-S smtp-auth-user="" \
		-S smtp-auth-password="" \
		-S from="" \
		 > /dev/null 2>&1
fi

#Limpeza: remoção do arquivo de saída saida_teste1.txt após o processamento.

rm -rf saida_teste1.txt

# Comando para enviar um e-mail via terminal Linux usando mailx

#mailx -s "Assunto do e-mail" \
#-S smtp="smtp.servidor.com:587" \  # Servidor SMTP e porta
#-S smtp-use-starttls \              # Ativa STARTTLS para segurança
#-S smtp-auth=login \                # Método de autenticação: login
#-S smtp-auth-user="seu_usuario" \   # Nome de usuário SMTP
#-S smtp-auth-password="sua_senha" \ # Senha do usuário SMTP
#-S from="seu_email@dominio.com" \   # E-mail do remetente
#destinatario@dominio.com            # E-mail do destinatário

