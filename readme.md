# Mark Miyashita
<http://markmiyashita.com>

# Using Jekyll

The site is built using <a href="https://github.com/mojombo/jekyll">Jekyll</a>. a static blog generator that was built by <a href="https://github.com/mojombo">mojombo</a>. It works seamlessly with <a href="http://pages.github.com/">Github Pages</a> which allows you to deploy your website just by pushing to a branch on your repo. After the initial set up time, adding content to the blog is a breeze.

# Structure

### _config.yml

Contains general configuration for Jekyll and also the information that is formatted on my resume, projects page, and also where I define variables for other parts of the site. My work is listed as an array which I can iterate over and it allows me to keep my information all in one spot. If you have any suggestions about how I should structure it, please let me know!

### /_posts



### /blog, /contact, /cs61a, /hkn, /new, /projects, /resume, /web_dev

These are the subdirectories that contain the index.html files that represent going to http://markmiyashita/<directory>. They utilize the layouts that are established in _layouts and work with content stored in _posts.

### /_layouts



### /_includes



### /public



### CNAME

The CNAME file allows me to easily point my repo to my own personal domain. After setting up my DNS settings to point to Github, I don't have to worry about hosting or anything like that.

### sitemap.xml



### atom.xml



### robots.txt



### LICENSE



### Gemfile

A basic Ruby Gemfile that contains the necessary gems that are needed to setup Jekyll. Simply run:

    bundle install

And the Jekyll gem with all of its dependencies will be installed.

### 404.html

A basic 404 page that shows up when the end-user visits a page that can't be found.

### .gitignore

A very basic .gitignore file that makes sure not to include Mac OS X's .DS_Store files as well as the _site directory that is created when the site is compiled using Jekyll.
