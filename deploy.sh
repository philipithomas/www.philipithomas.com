#!/bin/bash
set -e
# Script for building the site and deploying it to S3

#Add s3cmd config file
#echo "[default]\naccess_key = ${AWS_ACCESS_KEY_ID}\nsecret_key = ${AWS_SECRET_ACCESS_KEY}" > $HOME/.s3cfg

echo "[default]\naccess_key = HEY\nsecret_key = BRO" > $HOME/.s3cfg
cat $HOME/.s3cfg


# Install hugo
hugo_version="0.14"
file="hugo_${hugo_version}_linux_amd64"
tarball="${file}.tar.gz"
binary="https://github.com/spf13/hugo/releases/download/v${hugo_version}/${tarball}"
wget $binary
tar xfz $tarball

# Build the site
# Hugo is a binary in an eponymous folder
./$file/$file

# override cache
if  [ "$TRAVIS_PULL_REQUEST" = "false" ] \
    && [ "$TRAVIS_REPO_SLUG" = "philipithomas/www.philipithomas.com" ] \
    && [ "$TRAVIS_SECURE_ENV_VARS" = "true" ]
then

    if [ "$TRAVIS_BRANCH" = "master" ]
    then
        # Push to the prod domain
        bucket="www.philipithomas.com"
    else
        # Push to staging domain. 
        bucket="stage.philipithomas.com"

        # Don't let search engines see the stage
        rm public/robots.txt
        echo "User-agent: * \nDisallow: /" > public/robots.txt

    fi

    # Sync the built hugo files

    s3cmd --version

    s3cmd \
        --acl-public \
        --delete-removed \
        --no-progress \
        sync public/* s3://$bucket/
fi

# Clear the Cloudflare cache
curl https://www.cloudflare.com/api_json.html \
    -d 'a=fpurge_ts' \
    -d "tkn=$cloudflare_token" \
    -d "email=$cloudflare_email" \
    -d "z=$cloudflare_zone" \
    -d 'v=1'
