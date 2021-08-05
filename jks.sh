
keytool -genkeypair -alias merlion -keyalg RSA -keypass admin@123 -keystore merlion.jks -storepass admin@123 -keystore merlion.jks -subj "/C=CN/ST=merlion/L=HuNan/O=NetEase/OU=CA merlion"

keytool -list -v -keystore merlion.jks

keytool -list -rfc --keystore merlion.jks | openssl x509 -inform merlion.pem -pubkey


keytool -genkey -alias merlion -keyalg RSA -storepass admin@123 -keysize 1024 -keystore merlion.jks -validity 3655
