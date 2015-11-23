#!/bin/bash
set -e
# Script for building the site and deploying it to S3

# Install S3CMD. Need latest version, which we can't get through Travis containers (`sudo: false` mode)
wget -O- -q http://s3tools.org/repo/deb-all/stable/s3tools.key | sudo apt-key add -
sudo wget -O/etc/apt/sources.list.d/s3tools.list http://s3tools.org/repo/deb-all/stable/s3tools.list
sudo apt-get update && sudo apt-get install s3cmd

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
        --access_key="$AWS_ACCESS_KEY_ID" \
        --secret_key="$AWS_SECRET_ACCESS_KEY" \
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
