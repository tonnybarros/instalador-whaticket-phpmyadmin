#!/bin/bash
#
# functions for setting up app backend
#######################################
# creates REDIS db using docker
# Arguments:
#   None
#######################################
backend_redis_create() {
  print_banner
  printf "${WHITE} 💻 Criando Redis...${GRAY_LIGHT}"
  printf "\n\n"

  sleep 2

  sudo su - root <<EOF
  usermod -aG docker owenzap
  docker run -e TZ="America/Sao_Paulo" --name redis-whaticket -p 6379:6379 -d --restart=always redis:latest redis-server --appendonly yes --requirepass "${mysql_root_password}"
EOF

  sleep 2
}

#######################################
# creates mysql db using docker
# Arguments:
#   None
#######################################
backend_mysql_create() {
  print_banner
  printf "${WHITE} 💻 Criando banco de dados...${GRAY_LIGHT}"
  printf "\n\n"

  sleep 2

  sudo su - root <<EOF
  usermod -aG docker owenzap
  docker run --name whaticketdb \
           -e POSTGRES_USER=${instancia_add} \
           -e POSTGRES_PASSWORD=${mysql_root_password} \
           -p 5432:5432 \
           -v /data:/var/lib/postgresql/data -d postgres 
EOF

  sleep 2
}
#######################################
# sets environment variable for backend.
# Arguments:
#   None
#######################################
backend_set_env() {
  print_banner
  printf "${WHITE} 💻 Configurando variáveis de ambiente (backend)...${GRAY_LIGHT}"
  printf "\n\n"

  sleep 2

  # ensure idempotency
  backend_url=$(echo "${backend_url/https:\/\/}")
  backend_url=${backend_url%%/*}
  backend_url=https://$backend_url

  # ensure idempotency
  frontend_url=$(echo "${frontend_url/https:\/\/}")
  frontend_url=${frontend_url%%/*}
  frontend_url=https://$frontend_url

sudo su - owenzap << EOF
  cat <<[-]EOF > /home/owenzap/${instancia_add}/backend/.env
NODE_ENV=
BACKEND_URL=${backend_url}
FRONTEND_URL=${frontend_url}
PROXY_PORT=443
PORT=${backend_port}
DB_HOST=localhost
DB_DIALECT=postgres
DB_USER=${instancia_add}
DB_PASS=${mysql_root_password}
DB_NAME=${instancia_add}
JWT_SECRET=${jwt_secret}
JWT_REFRESH_SECRET=${jwt_refresh_secret}
REDIS_URI=redis://:${mysql_root_password}@127.0.0.1:6379
REDIS_OPT_LIMITER_MAX=1
REGIS_OPT_LIMITER_DURATION=3000
USER_LIMIT=3
CONNECTIONS_LIMIT=1
[-]EOF
EOF

  sleep 2
}

#######################################
# installs node.js dependencies
# Arguments:
#   None
#######################################
backend_node_dependencies() {
  print_banner
  printf "${WHITE} 💻 Instalando dependências do backend...${GRAY_LIGHT}"
  printf "\n\n"

  sleep 2

  sudo su - owenzap <<EOF
  cd /home/owenzap/${instancia_add}/backend
  npm install
EOF

  sleep 2
}

#######################################
# compiles backend code
# Arguments:
#   None
#######################################
backend_node_build() {
  print_banner
  printf "${WHITE} 💻 Compilando o código do backend...${GRAY_LIGHT}"
  printf "\n\n"

  sleep 2

  sudo su - owenzap <<EOF
  cd /home/owenzap/${instancia_add}/backend
  npm install
  npm run build
EOF

  sleep 2
}

#######################################
# updates frontend code
# Arguments:
#   None
#######################################
backend_update() {
  print_banner
  printf "${WHITE} 💻 Atualizando o backend...${GRAY_LIGHT}"
  printf "\n\n"

  sleep 2

  sudo su - owenzap <<EOF
  cd /home/owenzap/${instancia_add}
  pm2 stop ${instancia_add}-owenzap-backend
  git pull
  cd /home/owenzap/${instancia_add}/backend
  npm install
  npm update -f
  npm install @types/fs-extra
  rm -rf dist 
  npm run build
  npx sequelize db:migrate
  npx sequelize db:seed
  pm2 start ${instancia_add}-owenzap-backend 
EOF

  sleep 2
}

#######################################
# runs db migrate
# Arguments:
#   None
#######################################
backend_db_migrate() {
  print_banner
  printf "${WHITE} 💻 Executando db:migrate...${GRAY_LIGHT}"
  printf "\n\n"

  sleep 2

  sudo su - owenzap <<EOF
  cd /home/owenzap/${instancia_add}/backend
  npx sequelize db:migrate
EOF

  sleep 2
}

#######################################
# runs db seed
# Arguments:
#   None
#######################################
backend_db_seed() {
  print_banner
  printf "${WHITE} 💻 Executando db:seed...${GRAY_LIGHT}"
  printf "\n\n"

  sleep 2

  sudo su - owenzap <<EOF
  cd /home/owenzap/${instancia_add}/backend
  npx sequelize db:seed:all
EOF

  sleep 2
}

#######################################
# starts backend using pm2 in 
# production mode.
# Arguments:
#   None
#######################################
backend_start_pm2() {
  print_banner
  printf "${WHITE} 💻 Iniciando pm2 (backend)...${GRAY_LIGHT}"
  printf "\n\n"

  sleep 2

  sudo su - owenzap <<EOF
  cd /home/owenzap/${instancia_add}/backend
  pm2 start dist/server.js --name ${instancia_add}-owenzap-backend
EOF

  sleep 2
}

#######################################
# updates frontend code
# Arguments:
#   None
#######################################
backend_nginx_setup() {
  print_banner
  printf "${WHITE} 💻 Configurando nginx (backend)...${GRAY_LIGHT}"
  printf "\n\n"

  sleep 2

  backend_hostname=$(echo "${backend_url/https:\/\/}")

sudo su - root << EOF
cat > /etc/nginx/sites-available/${instancia_add}-backend << 'END'
server {
  server_name $backend_hostname;
  location / {
    proxy_pass http://127.0.0.1:${backend_port};
    proxy_http_version 1.1;
    proxy_set_header Upgrade \$http_upgrade;
    proxy_set_header Connection 'upgrade';
    proxy_set_header Host \$host;
    proxy_set_header X-Real-IP \$remote_addr;
    proxy_set_header X-Forwarded-Proto \$scheme;
    proxy_set_header X-Forwarded-For \$proxy_add_x_forwarded_for;
    proxy_cache_bypass \$http_upgrade;
  }
}
END
ln -s /etc/nginx/sites-available/${instancia_add}-backend /etc/nginx/sites-enabled
EOF

  sleep 2
}
