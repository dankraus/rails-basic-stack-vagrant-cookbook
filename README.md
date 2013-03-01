# Introduction

This Vagrant file and associated cookbooks is to spin up a fresh Ruby on Rails project
in a clean environment using Vagrant and Virtualbox. Copy everything into a new folder,
open a shell and run "vagrant up", and the stack will spin up. It takes about 10-15 
minutes to install and configure.

It's currently configured to run Rails 3.2.9, MySQL, and has NodeJS installed for
the JavaScript runtime.

Please note, this is probably not the cleanest implementation of Chef. I'm just diving
into it and I needed to cobble something together that works.

I based this losely on [rails-cookbook](https://github.com/rudyl313/rails-cookbook) by 
GitHub user [rudyl313](https://github.com/rudyl313). His configuration didn't quite work
for me and I wanted to use a newer version of Rails.

# Install

## Step 0 - Make sure Virtualbox and vagrant are installed:

Install [Virtualbox](https://www.virtualbox.org/wiki/Downloads)
and [vagrant](http://vagrantup.com/)

## Step 1 - Setup the project directory:

`````bash
$ mkdir /path/to/project_name
$ cp Vagrantfile /path/to/project_name/
$ cp -r cookbooks /path/to/project_name/
`````

## Step 2 - Edit the Vagrantfile:

`````bash
$ cd /path/to/project_name
`````

Edit the Vagrantfile, replacing the app name on these two lines:
````ruby
   => vm.name = "My App"
   => :rails => { :app_name => "my_app",
````

## Step 3 - Provision the box:

`````bash
$ vagrant up
````

The first time you use the cookbook it will probably take some extra time to
download the base box.

# Usage

You run code inside the virtual machine (which currently runs Ubuntu 12.04 LTS).
Use "vagrant ssh" to ssh into the VM.

If you're on Windows (like me), try using Putty and ssh into 127.0.0.1 port 2222

Username: vagrant
password: vagrant

You'll want to spin up a development web server inside the VM (you could also
install another web server such as unicorn or puma by installing the gem inside
the VM):

`````bash
$ vagrant ssh
$ cd /vagrant/my_app
$ bundle exec rails s
````

You can edit the code and manage your git repo outside of the VM. The project
directory will automatically sync with the /vagrant directory inside the VM.

Visit [http://vagrantup.com/](http://vagrantup.com/) for more instructions on how to use vagrant.