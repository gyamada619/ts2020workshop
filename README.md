# Managing Endpoints As Code - Tech Summit 2020

Howdy! You've located the code examples repository for the Managing Endpoints As Code workshop. Please clone this repository to your local device if you wish to modify these examples as we work through the interactive labs during the workshop.

## GitHub Lab

You may clone this repository to your machine as part of the GitHub lab if you wish. Simply use:

```
git clone https://github.com/gyamada619/ts2020workshop.git
```

**Please note**: Any changes you try to commit to this repository will have to be in a "fork", which can then be merged using a "pull request". These concepts should be covered in the presentation, but please feel free to inquire about them.

## Chocolatey Lab

This repository contains a code for a package called `example-wireguard` which you may wish to refer to during this lab. `example-wireguard` installs [WireGuard](https://www.wireguard.com/), a fast, free, & secure VPN tunnel client. 

During the lab, you will be expected to:

* Install a package from the community repository
* Create your own package which installs `Notepad++` and another package which installs a program of your choice
* Uninstall a package using the `choco` command line tools

## Chef Lab

A very basic example cookbook is inside this repository inside the `cookbooks` directory. This cookbook creates a text file at the root of `C:\` and installs the `example-wireguard` package.

During the Chef lab, you will be expected to:

* Generate a cookbook
* Edit the cookbook and create a few resource blocks
* Test your cookbook using `kitchen`.

Please make sure to ask workshop presenters questions as we move along!
