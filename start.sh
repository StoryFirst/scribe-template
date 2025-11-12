#! /bin/bash
bundle install 
npm install 
bundle exec jekyll serve --watch --drafts --host 0.0.0.0 -P 4321
