## First clone

~~~
cd ~/gitworks
git clone https://github.com/netway-devops/laradock-multisite.git

mkdir -p ~/gitworks/space/rvsitebuilder
cd ~/gitworks/space/rvsitebuilder
git clone -b master --recurse-submodules https://github.com/netway-devops/rvsitebuilder-space master
cd ..
cd master
git submodule foreach "git checkout master"

cd ~/gitworks/laradock-multisite
./local-ssl-certs-gen.sh

vscode open folder ~/gitworks/space/rvsitebuilder/master

vscode open workspace file rvsitebuilder.code-workspace

cd /var/www/rvsitebuildercms/rvsitebuilder.master
cp .env.master .env

composer update
composer app-install-dev
~~~

## devops note

~~~
First build structure

cd ~/gitwork/space/rvsitebuilder/develop
git submodule add -b develop https://gitlab.rvglobalsoft.netway.pro/rvglobalsoft/rvsitebuildercms rvsitebuildercms

git submodule add -b develop  https://gitlab.rvglobalsoft.netway.pro/rvglobalsoft/cdn.git cdn


Optional Docker Compose
cd ~/gitworks/laradock-multisite
docker-compose up --build -d traefik whoami apache2 php-fpm mysql workspace phpmyadmin
docker-compose -f docker-compose.yml exec --user laradock workspace bash

docker-compose -f docker-compose.yml logs -f apache2
docker-compose down
~~~
