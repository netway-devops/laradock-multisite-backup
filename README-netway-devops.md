## Awesome People

~~~
cd ~/gitworks
git clone https://github.com/netway-devops/laradock-multisite.git

mkdir -p ~/gitworks/space/rvsitebuilder
cd ~/gitworks/space/rvsitebuilder
git clone -b develop https://github.com/netway-devops/rvsitebuilder-space develop

cd develop
git submodule foreach "git checkout develop"

cd ~/gitworks/laradock-multisite
./local-ssl-certs-gen.sh
docker-compose up --build -d apache2 php-fpm mysql workspace phpmyadmin
docker-compose -f docker-compose.yml exec --user laradock workspace bash

cd /var/www/rvsitebuildercms/rvsitebuilder.develop
cp .env.dev .env

composer install
composer app-install-dev
~~~

devops note

~~~
cd ~/gitwork/space/rvsitebuilder/develop
git submodule add -b develop https://gitlab.rvglobalsoft.netway.pro/rvglobalsoft/rvsitebuildercms rvsitebuildercms

git submodule add -b develop  https://gitlab.rvglobalsoft.netway.pro/rvglobalsoft/cdn.git cdn
~~~
