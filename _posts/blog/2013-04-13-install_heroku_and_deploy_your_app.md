---
layout: post
title: "Install Heroku and Deploy Your App"
tags: [heroku, deploy]
categories: [blog]
author_name: Mark Miyashita
author_url: http://markmiyashita.com
google_plus: 101180624276428786239
date: 2013-04-13 01:39:00 -7

published: true
---

- [Introduction](#intro)
- [Installation](#install)
- [Deploying Your App](#deploy)
  - [Ruby on Rails](#rails)
  - [Node.js](#node)
  - [Django](#django)

<div id="intro">
  <h2>Introduction</h2>
  
  <p>
    So, you've finished adding the final touches to your app and now you want to put in on the Internet for everyone else to use. How do I do that?!
  </p>

  <p>
    Well, there are several options available to you at this point, most of them are free. The most popular free option is to use Heroku and I'm going to be walking through the steps to set up Heroku on your computer and deploy your first app.
  </p>

  <p>
    First, let's talk a little about what Heroku is. Heroku is a cloud application platform. In one sentence, Heroku allows you to serve your web applications using their servers and allows other computers to access your site at the specified url. Heroku has mastered the art of simplicity, and setting up an app and deploying has never been easier. Let's dive into the steps necessary to do this.
  </p>

  <p>
    Since Heroku is a service, we're first going to have to sign up for an account. You can do that <a href="https://id.heroku.com/signup/devcenter">here.</a>
  </p>
</div>

<div id="install">
  <h2>Installation</h2>

  <ul>
    <li>
      First, we need to download the <a href="https://toolbelt.heroku.com/">Heroku Toolbelt</a>.
    </li>
  </ul>

  <p>
    The Heroku Toolbelt install a bunch of command line tools that allow you to easily create and edit apps straight from your own computer. It mainly gives us access to the <code>heroku</code> command that allows us to do a lot of different heroku-specific commands. 
  </p>

  <ul>
    <li>
      Next, let's log in to our Heroku accounts using the command line. Run the following command:
    </li>
  </ul>

  <pre>
    <code class="prettyprint">
$ heroku login
Enter your Heroku credentials.
Email: example@example.com
Password: 
Could not find an existing public key.
Would you like to generate one? [Yn] 
Generating new SSH public key.
Uploading ssh public key /Users/mark/.ssh/id_rsa.pub
    </code>
  </pre>

  <p>
    If prompted to generate a public key, go ahead and enter "Y" and proceed to do so.
  </p>

  <p>
    That's it for installation! Now we just need to figure out how to deploy our apps using the new command line interface that we just installed. Go on to the next section if you're ready.
  </p>
</div>

<div id="deploy">
  <h2>Deploying Your App</h2>

  <p>
    Heroku can deploy a bunch of apps and you can find different tutorials listed on their website <a href="https://devcenter.heroku.com/articles/quickstart#step-4-deploy-an-application">here.</a> I'm going to outline the three most popular: Ruby on Rails, Node.js, and Django.
  </p>
</div>

<div id="rails">
  <h2>Ruby on Rails</h2>

  <p>
    If you already have an existing Rails app, you don't need to complete this first step.
  </p>

  <p>
    Create a new app:
  </p>

  <pre>
    <code class="prettyprint">
rails my_new_app
cd my_new_app
    </code>
  </pre>

  <p>
    Heroku uses a PostgreSQL database so we're going to have to edit our <code>Gemfile</code> to reflect that. Change this line:
  </p>

  <pre>
    <code class="prettyprint">
gem 'sqlite3'
    </code>
  </pre>

  <p>
    To this:
  </p>

  <pre>
    <code class="prettyprint">
gem 'pg'
    </code>
  </pre>

  <p>
    Make sure everything works locally by running:
  </p>

  <pre>
    <code class="prettyprint">
bundle install
    </code>
  </pre>

  <p>
    If you aren't using Git already, you definitely should be. Git allows you to quickly keep track of changes and to work easily and collaboratively with others. Let's initialize our app to use git.
  </p>

  <pre>
    <code class="prettyprint">
git init
git add .
git commit -m "initial commit"
    </code>
  </pre>

  <p>
    Now let's deploy our app to Heroku. First, let's create a new app using the Heroku Toolbelt that we installed earlier. The argument below, "my-app-name", is the name that we are giving our app. Feel free to choose anything here, it will eventually become the url for your app.
  </p>

  <pre>
    <code class="prettyprint">
$ heroku create my-app-name
Creating my-app-name... done, stack is cedar
http://my-app-name.herokuapp.com/ | git@heroku.com:my-app-name.git
Git remote heroku added
    </code>
  </pre>

  <p>
    What the command did was create a new app with a name that you specified. If we want to give our app a random name, we can run the command: <code>heroku create</code> without an optional name and heroku will create a name for us. Let's push our code to heroku and deploy app.
  </p>

  <pre>
    <code class="prettyprint">
$ git push heroku master
Counting objects: 67, done.
Delta compression using up to 4 threads.
Compressing objects: 100% (52/52), done.
Writing objects: 100% (67/67), 86.33 KiB, done.
Total 67 (delta 5), reused 0 (delta 0)

-----> Heroku receiving push
-----> Rails app detected
-----> Installing dependencies using Bundler version 1.1
       Checking for unresolved dependencies.
       Unresolved dependencies detected.
       Running: bundle install --without development:test --path vendor/bundle --deployment
       Fetching source index for http://rubygems.org/
       Installing rake (0.8.7)
       ...
       Installing rails (3.0.5)
       Your bundle is complete! It was installed into ./vendor/bundle
-----> Rails plugin injection
       Injecting rails_log_stdout
       Injecting rails3_serve_static_assets
-----> Discovering process types
       Procfile declares types -> (none)
       Default types for Rails -> console, rake, web, worker
-----> Compiled slug size is 8.3MB
-----> Launching... done, v5
       http://my-app-name.herokuapp.com deployed to Heroku

To git@heroku.com:my-app-name.git
 * [new branch]      master -> master
    </code>
  </pre>

  <p>
    Now that our app has been pushed to Heroku, we need to initialize our database. Then we can now open our app!
  </p>

  <pre>
    <code class="prettyprint">
heroku run rake db:reset
heroku open
    </code>
  </pre>

  <p>
    Now, whenever we want to push updates to our app, we run the following sequence.
  </p>

  <pre>
    <code class="prettyprint">
git add .
git commit -m "updates for this commit"
git push heroku master
    </code>
  </pre>

  <p>
    And our app will be updated and the changes can be seen immediately at our url.
  </p>

</div>

<div id="node">
  <h2>Node.js</h2>

  <p>
    If you already have an existing Node app, you don't have to complete this first step.
  </p>

  <p>
    Create a new folder and make a new file and add the following contents:
  </p>

  <pre>
    <code class="prettyprint">
mkdir node_app
cd node_app
touch web.js
    </code>
  </pre>

  <p>
    We're going to create a simple web server that uses Express and displays "Hello World!"
  </p>

  <h4>web.js</h4>
  <pre>
    <code class="prettyprint">
var express = require("express");
var app = express();
app.use(express.logger());

app.get('/', function(request, response) {
  response.send('Hello World!');
});

var port = process.env.PORT || 5000;
app.listen(port, function() {
  console.log("Listening on " + port);
});
    </code>
  </pre>

  <p>
    Now let's create another file <code>package.json</code> that will contain information about the dependencies of our app.
  </p>

  <h4>package.json</h4>
  <pre>
    <code class="prettyprint">
{
  "name": "node-example",
  "version": "0.0.1",
  "dependencies": {
    "express": "3.1.x"
  },
  "engines": {
    "node": "0.10.x",
    "npm": "1.2.x"
  }
}
    </code>
  </pre>

  <p>
    Now use the command <code>npm</code> to install our dependencies.
  </p>

  <pre>
    <code class="prettyprint">
npm install
    </code>
  </pre>

  <p>
    Lastly, we're going to make a <code>Procfile</code> that is going to declare what processes we want to run once we deploy.
  </p>

  <pre>
    <code class="prettyprint">
web: node web.js
    </code>
  </pre>

  <p>
    You can now start your app using Foreman with the following command.
  </p>

  <pre>
    <code class="prettyprint">
foreman start
    </code>
  </pre>

  <p>
    If you aren't using Git already, you definitely should be. Git allows you to quickly keep track of changes and to work easily and collaboratively with others. Let's initialize our app to use git.
  </p>

  <pre>
    <code class="prettyprint">
git init
git add .
git commit -m "initial commit"
    </code>
  </pre>

  <p>
    Now let's deploy our app to Heroku. First, let's create a new app using the Heroku Toolbelt that we installed earlier. The argument below, "my-app-name", is the name that we are giving our app. Feel free to choose anything here, it will eventually become the url for your app.
  </p>

  <pre>
    <code class="prettyprint">
$ heroku create my-app-name
Creating my-app-name... done, stack is cedar
http://my-app-name.herokuapp.com/ | git@heroku.com:my-app-name.git
Git remote heroku added
    </code>
  </pre>

  <p>
    What the command did was create a new app with a name that you specified. If we want to give our app a random name, we can run the command: <code>heroku create</code> without an optional name and heroku will create a name for us. Let's push our code to heroku and deploy app.
  </p>

  <pre>
    <code class="prettyprint">
$ git push heroku master
Counting objects: 343, done.
Delta compression using up to 4 threads.
Compressing objects: 100% (224/224), done.
Writing objects: 100% (250/250), 238.01 KiB, done.
Total 250 (delta 63), reused 0 (delta 0)

-----> Node.js app detected
-----> Resolving engine versions
       Using Node.js version: 0.10.3
       Using npm version: 1.2.18
-----> Fetching Node.js binaries
-----> Vendoring node into slug
-----> Installing dependencies with npm
       ....
       Dependencies installed
-----> Building runtime environment
-----> Discovering process types
       Procfile declares types -> web

-----> Compiled slug size: 4.1MB
-----> Launching... done, v9
       http://my-app-name.herokuapp.com deployed to Heroku

To git@heroku.com:my-app-name.git
 * [new branch]      master -> master
    </code>
  </pre>

  <p>
    Once we have finished deploying our app, we can access it by entering in the following command.
  </p>

  <pre>
    <code class="prettyprint">
heroku open
    </code>
  </pre>

</div>

<div id="django">
  <h2>Django</h2>

  <p>
    Django instructions are a little more complex and I believe that the Heroku instructions can explain it better than I can. For now, view the instructions <a href="https://devcenter.heroku.com/articles/django">here.</a> I will update this post in the future.
  </p>

</div>
