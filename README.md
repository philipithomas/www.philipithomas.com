# philipithomas.com

[![Build Status](https://travis-ci.org/philipithomas/www.philipithomas.com.svg)](https://travis-ci.org/philipithomas/www.philipithomas.com)

This is the  backend for my website [www.philipithomas.com](https://www.philipithomas.com). It is built using [Hugo](http://gethugo.io).

## Running a Development server


```
# Install Hugo first using Brew or Apt
hugo server --watch
```

## Writing a new post

```
hugo new post/desired-slug.md
```

## Deployment

The website is built and deployed using [Travis-CI](https://travis-ci.org/philipithomas/www.philipithomas.com). Changes to the master branch are deploy to [www.philipithomas.com](https:/www.philipithomas.com). All non-master branches (pushed by me) have their `robots.txt` overridden and are deployed to [stage.philipithomas.com](https://stage.philipithomas.com). 
