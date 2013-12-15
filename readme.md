# Mark Miyashita
<http://markmiyashita.com>

# Using Jekyll

The site is built using <a href="https://github.com/mojombo/jekyll">Jekyll</a>. a static blog generator that was built by <a href="https://github.com/mojombo">mojombo</a>. It works seamlessly with <a href="http://pages.github.com/">Github Pages</a> which allows you to deploy your website just by pushing to a branch on your repo. After the initial set up time, adding content to the blog is a breeze.

# Structure

### _config.yml

Contains general configuration for Jekyll and also the information that is formatted on my resume, projects page, and also where I define variables for other parts of the site. My work is listed as an array which I can iterate over and it allows me to keep my information all in one spot. If you have any suggestions about how I should structure it, please let me know!

### /_posts

Contains all of the posts that I have written. The directory is split into sections for my blog, cs61a, and my web_dev subdirectories. Posts are written in markdown and the file names are in the form:

    yyyy-mm-dd-title-of-post.md

### /downloads

Contains files that may be downloaded by users such as my resume.

### /_layouts

Contains the skeleton template files that form the basic outline of a post, a blog post, a note, etc. This maintains a website that eliminates as much repetition as possible. It also allows me to make a single change to a template that affects several posts or several subdirectories at a time (and consistently).

### /_includes

Directory that contains the files that can be used in various parts of the website. For example, the header is in its own file to be included in the template later on. That way I can edit the header by itself. It creates a modular website that is easily to edit and maintain. Files can be included using the following syntax:

    {% include header.html %}

### /public

Contains the /js, /css, /img directories that contain the respective javascript, stylesheet, and image files.

### CNAME

The CNAME file allows me to easily point my repo to my own personal domain. After setting up my DNS settings to point to Github, I don't have to worry about hosting or anything like that.

### sitemap.xml

Sitemap used for search engines to find the pages on the site. 

### atom.xml

Creates an atom feed for people to subscribe to my posts.

### robots.txt

Allows search engines to crawl the site.

### LICENSE

Standard MIT License.

### Gemfile

A basic Ruby Gemfile that contains the necessary gems that are needed to setup Jekyll. Simply run:

    bundle install

And the Jekyll gem with all of its dependencies will be installed.

### 404.html

A basic 404 page that shows up when the end-user visits a page that can't be found.

### .gitignore

A very basic .gitignore file that makes sure not to include Mac OS X's .DS_Store files as well as the _site directory that is created when the site is compiled using Jekyll.
