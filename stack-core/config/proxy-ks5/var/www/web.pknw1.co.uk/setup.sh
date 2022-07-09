FQDN=$1
echo $FQDN

cp conf/template.conf conf/$FQDN.conf

sed -i "s/FQDN/$FQDN/g" conf/$FQDN.conf
