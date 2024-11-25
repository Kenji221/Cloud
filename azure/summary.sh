# Deploy from azure deployment service 
 az deployment group create --resource-group test-rg-001 --template-file template.json --parameters parameters.json
# Resource Group
my-rg-001
az group create --name test-rg-001 --location japaneast

# Virtual Network
vnet: THK-vm-001-vnet(10.4.0.0/24)

az network vnet create \
    --name my-vnet-01 \
    --resource-group test-rg-001 \
    --address-prefix 10.1.0.0/16 \
    --subnet-name my-test-subnet-app \
    --subnet-prefixes 10.1.0.0/24 \
    --subnet-name my-test-subnet-db \
    --subnet-prefixes 10.1.1.0/24

#  Virtual network gateway 
apt install strongswan
apt install strongswan-pki
apt install libstrongswan-extra-plugins
apt install libtss2-tcti-tabrmd0

ipsec pki --gen --outform pem > caKey.pem
ipsec pki --self --in caKey.pem --dn "CN=VPN CA" --ca --outform pem > caCert.pem

openssl x509 -in caCert.pem -outform der | base64 -w0 ; echo
MIIC5jCCAc6gAwIBAgIINAUnHFzjo9kwDQYJKoZIhvcNAQELBQAwETEPMA0GA1UEAxMGVlBOIENBMB4XDTIzMDgwNzAzMDQyMFoXDTI2MDgwNjAzMDQyMFowETEPMA0GA1UEAxMGVlBOIENBMIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAt5ThkG3Xv4dXFGPxquDeSwaO19tFXpQR84Osv9gSeS80LrlQspxg6mlHFsbg7Xz2DLKslsYz7aHalTFxLQjNeiRPSQ9p+QxBHtVyh6sfp7tgvx0AXsJ7Xi1vNc1xrvmD3TU7eqTya0TSY6WNL1aWZQJToA/XMFpYD0dQZ4qtIzWfX3vErI/etJYUBx8YTCMAdUJ+pThMZJL9IVGu2rWSh9q0jQxOURJZSN1T+rF/b7pzXd2pLOGGpDFcQ0X+LU8wCugQECaVE6CGCsQFsydXdE7AOV/ihOatzV06ypv8DbQY6KipKzduURtm7iTvUwbfXGunFFJpvi5IQDrBncWlwwIDAQABo0IwQDAPBgNVHRMBAf8EBTADAQH/MA4GA1UdDwEB/wQEAwIBBjAdBgNVHQ4EFgQUIVUe6DsDeWZtTlt3nvxZTTxMvFowDQYJKoZIhvcNAQELBQADggEBAHPPcrRc0+P1IBkGGJqovtc+FJKCH0Vureca7t8aWq//rOlFMjhmJhZc87GIS2LG5YBokZaSB7gx6M5SiK/pJNfdvjde+xidPZYUob+idjhAWLnlwCg40yWOkUZeobHhUdZbvYS4MBlni9FvWPS2wuYht27MQ3LQ59es1jtHMnnhSGd2bvfiK1aOA0vnUBxduej0QcP57Pbh91/lWGI2iIqGmKuUjcfB3ImhGpIWTVxcWdwrSG+TrfBdyczlmy+b0TtUzG5zszwQQv9RfQlExFLeB1cxjN9XjtFm4XRJ/m7nqx/pbF1HzZFJg48l7dhmTJ4MaKq0D5b34Ueo2jF7ap8=

export PASSWORD="password"
export USERNAME="client"

ipsec pki --gen --outform pem > "${USERNAME}Key.pem"
ipsec pki --pub --in "${USERNAME}Key.pem" | ipsec pki --issue --cacert caCert.pem --cakey caKey.pem --dn "CN=${USERNAME}" --san "${USERNAME}" --flag clientAuth --outform pem > "${USERNAME}Cert.pem"

# Virtual Machine
vituralMachineName : 
Username: azureuser
Key-Pair: my-vm-001_key

#login as a managed ID
azlogin --identity




# Azure virtual Machine meta data set 
IMDS Links
==========
http://169.254.169.254/metadata/instance?api-version=2021-12-13
http://169.254.169.254/metadata/scheduledevents?api-version=2020-07-01