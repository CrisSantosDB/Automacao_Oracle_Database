#!/bin/bash

####################################################################################################
# Script Name    : ConfiguraçãoInstaçãoBanco19cRPM.sh                                              #
# Description    : Após instalação e update do S.O executar o scrip, pois ele vai configurar o S.O #
#                  e fazer todas a instalação do Oracle Database 19c                               #                                                                                                                                                                                                #
# Author         : Cristina dos Santos                                                             #
# Email          : chrisreviloutbreak@gmail.com                                                    #
# Execute        : ./ConfiguraçãoInstaçãoBanco19cRPM3.sh Sua_senha_oracle                          #
####################################################################################################

# Função para exibir mensagens de erro e sair
erro() {
    echo "Erro: $1" >&2
    exit 1
}


# Verifica se a senha foi passada como argumento
if [ -z "$1" ]; then
    erro "Por favor, forneça a nova senha para o usuário oracle como argumento."
fi

new_password="$1"

# Configurar o hosts
echo "Configurando /etc/hosts..."
cat >> /etc/hosts <<EOF
192.168.3.100   oel8-19c         ol8-19c.localdomain
EOF

# Desabilitar o Selinux
echo "Desabilitando SELinux..."
sed -i 's/SELINUX=enforcing/SELINUX=disabled/' /etc/selinux/config || erro "Falha ao desabilitar SELinux."
setenforce permissive || erro "Falha ao definir SELinux como permissivo."

# Habilitando portas
echo "Habilitando portas no firewall..."
firewall-cmd --zone=public --add-port=1521/tcp || erro "Falha ao adicionar porta ao firewall."
firewall-cmd --reload || erro "Falha ao recarregar o firewall."

# Instalação do Pre install
echo "Instalando oracle-database-preinstall-19c..."
dnf install -y oracle-database-preinstall-19c || erro "Falha ao instalar oracle-database-preinstall-19c."

# Instalação do SGBD Oracle Database
echo "Instalando Oracle Database 19c..."
yum -y localinstall oracle-database-ee-19c-1.0-1.x86_64.rpm || erro "Falha ao instalar Oracle Database 19c."

# Muda senha do usuário Oracle
echo "Alterando senha do usuário oracle..."
echo "oracle:$new_password" | chpasswd || erro "Falha ao alterar a senha do usuário oracle."

echo "Configuração e instalação concluídas com sucesso."

# Criação do Database e Listener
echo "Configurando Database e Listener..."
(echo "crisle1830"; echo "crisle1830";) | /etc/init.d/oracledb_ORCLCDB-19c configure || erro "Falha ao configurar o Database e o Listener."

echo "Configuração e instalação concluídas com sucesso."


