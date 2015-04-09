# instant-disposable-chrome

On Docker hub [instant-disposable-chrome](https://registry.hub.docker.com/u/yantis/instant-disposable-chrome/)
on Github [docker-instant-disposable-chrome](https://github.com/yantis/docker-instant-disposable-chrome)

I find myself every once in a while wanting to checkout a website but not from my IP address.
You might want to do the same. Possibly for anonymous reasons (ie: checking out a competitor), 
testing or maybe u want to want a lot more bandwidth that you usually have.

The script will create a brand new base Amazon Linux instance, then install docker, and setup
Google Chrome over SSH using X-forwarding and then load up Chrome with the website of your choosing.
When you close the webpage it will delete the instance. All without any interaction from you.

You may want to modify the script for something other than AWS or just use the container locally 
If you are looking at using it for something else checkout the base image [here](https://github.com/yantis/docker-ssh-hpn-x)

It is setup to work with Amazon's free tier instances.

## Setup
At a minimum you need to set up your private key name and your subnet ID in the "instant-chrome" file.
You are also going to need to have [aws cli](https://github.com/aws/aws-cli) installed.
On Arch Linux this is on the AUR as [aws-cli](https://aur.archlinux.org/packages/aws-cli)

```bash
KEYNAME=yantisec2
SUBNETID=subnet-d260adb7
REGION=us-west-2
```
Then just copy "instant-chrome" over to your /usr/bin directory


## Run

To run it just type it instant-chrome and the website name like:

```bash
instant-chrome www.youtube.com
```
or

```bash
instant-chrome https://www.youtube.com
```

Here is a screenshot of Google Chrome running on an AWS ec2 instance.
![](http://yantis-scripts.s3.amazonaws.com/screenshot_20150409-053305.jpg)


## Warnings

There are security implications associated with X-Forwarding.
It is advisable to read up on it. This is a good [post](https://padraic2112.wordpress.com/2007/07/09/bad-security-201-remote-x-sessions-over-ssh/)

As an example you might actually be less secure by running chrome without a sandbox to not have to run the
container as privileged than simply running as privileged with sandbox mode enabled since the machine
you are connecting from might be more important to secure than the server. If that is the case you can
simply remove the --no-sandbox flag on chrome and add a ---privileged on docker.
(Would love to know your thoughts on this. Maybe I should change the default around?)

Either way you should just assume you are being [hacked all the time](http://www.zdnet.com/article/pwn2own-2015-the-year-every-browser-went-down/)

