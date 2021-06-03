#! /bin/bash


mkcert -install

declare -a arr=("foo.test"
                "mailhog.local"
                "cms.main"
                "cms.develop"
                "cdn.rvtheme.com.main"
                "cdn.rvtheme.com.develop"
                "license3.rvglobalsoft.com.main"
                "license3.rvglobalsoft.com.develop"
                "netway.co.th.main"
                "netway.co.th.develop"
                "billing.netway.co.th.main"
                "billing.netway.co.th.develop"
                "rvglobalsoft.com.develop"
                "rvglobalsoft.com.main"
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

  127.0.0.1 foo.test mailhog.local cms.main cms.develop

  2 Testing by open https://foo.test/ and http://foo.test/. It should open without any errors.
==================================================
"""
