## First clone

~~~
cd ~/gitworks
git clone https://github.com/netway-devops/laradock-multisite.git

mkdir -p ~/gitworks/space/rvsitebuilder
cd ~/gitworks/space/rvsitebuilder
git clone -b develop --recurse-submodules https://github.com/netway-devops/rvsitebuilder-space develop

cd develop
git submodule foreach "git checkout develop"

open folder ~/gitworks/space/rvsitebuilder/develop

open workspace file rvsitebuilder.code-workspace

cd /var/www/rvsitebuildercms/rvsitebuilder.develop
cp .env.dev .env

composer install
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
