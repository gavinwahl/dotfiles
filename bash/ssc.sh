function ssc()
{
  if [ -f private.key ]
  then
    echo 'private.key already exists, not going to overwrite' >&2
    return 1;
  fi
  if [ -f cert.pem ]
  then
    echo 'cert.pem already exists, not going to overwrite' >&2
    return 1;
  fi
  if [ -f server.pem ]
  then
    echo 'server.pem already exists, not going to overwrite' >&2
    return 1;
  fi
  openssl req -new -x509 -newkey rsa:2048 -nodes  -keyout private.key -out cert.pem -days 1095
  cat private.key cert.pem | tee server.pem
}
