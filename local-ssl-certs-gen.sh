#! /bin/bash


mkcert -install

declare -a arr=("foo.test"
                "mailhog.local"
                "rvsitebuilder.master"
                "rvsitebuilder.develop"
                "cms.master"
                "cms.develop"
                "cdn.rvtheme.com.master"
                "cdn.rvtheme.com.develop"
                "license3.rvglobalsoft.com.master"
                "license3.rvglobalsoft.com.develop"
                "netway.co.th.master"
                "netway.co.th.develop"
                "billing.netway.co.th.master"
                "billing.netway.co.th.develop"
                )

for i in "${arr[@]}"
do
   mkcert "$i"
   mv "./${i}.pem" "./apache2/local-ssl-certs/"
   mv "./${i}-key.pem" "./apache2/local-ssl-certs/"
done

echo """
==================================================
  1 Add the following to /etc/hosts file:

  127.0.0.1 foo.test mailhog.local rvsitebuilder.master rvsitebuilder.develop

  2 Testing by open https://foo.test/ and http://foo.test/. It should open without any errors.
==================================================
"""
