## Versão Ubuntu 
+ Passo a passo
Ao executar o comando abaixo, vai aparecer um menu para instalar ou atualizar.
Para instalar digite 1 e enter
Vai solicitar os seguintes dados
- Senha mysql
- Nome da empresa (em minúsculo), esse nome é para diferenciar as instalações, tanto do Press Ticket, como dos recursos isolados via Docker.
- Número máximo de conexões WhatsApp que essa instalação poderá usar
- Número máximo de atendentes para essa instalação
- Domínio do frontend, geralmente app.seusite.com.br
- Domínio do backend, geralmente api.seusite.com.br
- Porta do frontend, geralmente para a primeira instalação 3000, e a seguintes instalações que tiverem, 3001, 3002...
- Porta do backend, geralmente para a primeira instalação 4000, e a seguintes instalações que tiverem, 4001, 4002...
- Porta do phpmyadmin, geralmente para a primeira instalação 8000, e a seguintes instalações que tiverem, 8001, 8002...
O acesso ao phpmyadmin é feito por IP do servidor, ex. http://111.111.111.111:8000/phpmyadmin
- Porta do MYSQL, geralmente para a primeira instalação 3306, e a seguintes instalações que tiverem, 3307, 3308...

Seguindo todos os passos acima e não deixando faltar nenhuma da informações solicitadas, é só aguardar o instalador terminar a instalação.

Ao terminar a instalação é só logar com os dados padrão, caso não saiba veja na página do projeto [Press Ticket aqui](https://github.com/rtenorioh/Press-Ticket).

## INSTALAÇÃO 
FAZENDO DOWNLOAD DO INSTALADOR & INICIANDO A PRIMEIRA INSTALAÇÃO (USAR SOMENTE PARA PRIMEIRA INSTALAÇÃO):

```bash
sudo apt install -y git && git clone https://github.com/tonnybarros/install_pressticket-phpmyadmin.git instalador && sudo chmod -R 777 ./instalador && cd ./instalador && sudo ./install_primaria
```

ACESSANDO DIRETORIO DO INSTALADOR & INICIANDO INSTALAÇÕES ADICIONAIS (USAR ESTE COMANDO PARA SEGUNDA OU MAIS INSTALAÇÃO:
```bash
cd && cd ./instalador && sudo ./install_instancia
```
## Recursos 
- Multi instalador ilimitado [Press Ticket](https://github.com/rtenorioh/Press-Ticket)
- Recursos isolados para cada instalação
- Instala Docker Mariadb (isolados)
- Instala Docker Phpmyadmin (isolados)
- instala nginx
- Configura os domínios com certificados de segurança
- Atualiza press ticket para última versão.

## Versão Debian
- [Press-Ticket-Installer](https://github.com/robsonwr/Press-Ticket-Installer)

## Instalação manual
- [Press Ticket](https://github.com/rtenorioh/Press-Ticket)
