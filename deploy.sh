#!/bin/bash

if [ "$environment" -ne "production" ]; then
  echo "Overriding robots.txt for a $environment environment"
  rm _site/robots.txt
  echo "User-agent: * \nDisallow: /" > _site/robots.txt
fi
bundle exec s3_website push --headless

curl https://www.cloudflare.com/api_json.html \
    -d 'a=fpurge_ts' \
    -d "tkn=$cloudflare_token" \
    -d "email=$cloudflare_email" \
    -d 'z=philipithomas.com' \
    -d 'v=1'
