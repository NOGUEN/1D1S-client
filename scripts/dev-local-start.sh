#!/bin/bash

# `pnpm dev` bootstrap:
# 1) hosts 등록
# 2) 로컬 HTTPS 인증서 생성
# 3) local alias 서버 실행 + 브라우저 오픈

set -euo pipefail

DOMAIN="${LOCAL_ALIAS_HOST:-local.1day1streak.com}"
PROTOCOL="${LOCAL_ALIAS_PROTOCOL:-https}"

export LOCAL_ALIAS_HOST="$DOMAIN"
export LOCAL_ALIAS_PROTOCOL="$PROTOCOL"
export LOCAL_SSL_KEY_PATH="${LOCAL_SSL_KEY_PATH:-_wildcard.1day1streak.com-key.pem}"
export LOCAL_SSL_CERT_PATH="${LOCAL_SSL_CERT_PATH:-_wildcard.1day1streak.com.pem}"

bash ./scripts/init-local-dns.sh "$DOMAIN"

if [ "$PROTOCOL" = "https" ]; then
  bash ./scripts/init-local-cert.sh "$DOMAIN"
fi

exec node dev-server.js
