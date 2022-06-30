FAZENDO DOWNLOAD DO INSTALADOR & INICIANDO A PRIMEIRA INSTALAÇÃO (USAR SOMENTE PARA PRIMEIRA INSTALAÇÃO):

```bash
sudo apt install -y git && git clone https://github.com/tectonnybarros/install_pressticket-phpmyadmin.git install_pressticket && sudo chmod -R 777 ./install_pressticket && cd ./install_pressticket && sudo ./install_primaria
```

ACESSANDO DIRETORIO DO INSTALADOR & INICIANDO INSTALAÇÕES ADICIONAIS (USAR ESTE COMANDO PARA SEGUNDA OU MAIS INSTALAÇÃO:
```bash
cd && cd ./install_pressticket && sudo ./install_instancia
```

19/06/2022

Instalação usando docker mariadb

O instalador já instala junto o phpmyadmin

Para isso escolher a porta phpmyadmin na instalação

Acessar via http://IP:porta/phpmyadmin

Instalações ilimitadas no mesmo servidor;

