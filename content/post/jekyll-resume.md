---
category: "project"
layout: "post"
description: "A digital resume using Jekyll and Google Web Starter Kit"
title: "Jekyll Resume Project"
date: "2014-09-25"
---

Paper resumes suck. Today I am publishing a project that creates a resume website using [Jekyll](http://jekyllrb.com) and [Google Web Starter Kit](https://github.com/google/web-starter-kit). See a <a href="https://jekyll-resume.philipithomas.com" class="highlight">demo of the project</a> and <a href="https://github.com/philipithomas/jekyll-resume/" class="highlight">fork it on Github</a>.


<a href="https://github.com/philipithomas/jekyll-resume/"><img src="/images/jekyll-resume.jpg" alt="jekyll resume"/></a>


## Background

While in college searching for post-graduation job, I built myself a [digital resume in PHP that became popular](https://github.com/philipithomas/cv-philipithomas). It [looked cool](https://php-cv.herokuapp.com/), but was poorly executed. Every time somebody visited the website, it was re-rendered.

Since then I try to build most websites (including [this one](https://github.com/philipithomas/www.philipithomas.com)) in [Jekyll](http://jekyllrb.com), a static-site generator written in Ruby. It has just enough features to be useful, but the generated sites are static. This makes hosting and scaling easy.

There is a lot of [Bootstrap](http://getbootstrap.com/) code floating around, so I decided to try something a little different for the framework - Google's [Web Starter Kit](https://github.com/google/web-starter-kit).


## Core Logic

The resume has sections defined by the [`_data/sections.yml`](https://github.com/philipithomas/jekyll-resume/blob/master/_data/sections.yml) file. Adding or modifying sections is controlled through this YAML file. The *name* attribute controls the title of the section. The *ID* is a globally-unique identifier for the section that is used as a CSS ID for the menu scrolling logic. In addition, this specifies the name of the YML file in [`_data`](https://github.com/philipithomas/jekyll-resume/blob/master/_data/) from which the section pulls its data. The *layout* specifies which layout in [`_includes/resume/`](https://github.com/philipithomas/jekyll-resume/tree/master/_includes/resume/) to use for the section - it is loosely a "macro."

## Next Steps

If you have changes to this repo, please [open an issue or a pull request](https://github.com/philipithomas/jekyll-resume), and [follow me on twitter](https://twitter.com/philipithomas) to stay up-to-date with my latest projects.

