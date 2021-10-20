#! /bin/bash


mkcert -install

declare -a arr=("cms.main"
                "cms.develop"
                "cdn.rvtheme.com.main"
                "cdn.rvtheme.com.develop"
                "license3.rvglobalsoft.com.main"
                "license3.rvglobalsoft.com.develop"
                "netway.co.th.main"
                "netway.co.th.develop"
                "billing.netway.co.th.main"
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
  Successful
==================================================
"""
