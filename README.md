# Packer Templates

    I am not using the Packer/Vagrant workflow anymore, so this repository is
    deprecated. Latest useful change was in 2021. The latest commmit only saves
    latest unfinished work that is at least three years old.

Packer templates for building base VM boxes. Curently the following operating systems
are supported:

* CentOS-7
* CentOS-8
* Ubuntu Server 20.04 x86\_64


## Usage

### Installing Packer

Download the latest packer from <http://www.packer.io/downloads.html>
and unzip the appropriate directory.

If you are an macOS user consider installing packer using [Homebrew](http://brew.sh/):

    $ brew tap homebrew/binary
    $ brew install packer
    $ brew install packer-completion [optional for bash autocompletion]

### Running Packer

    $ git clone https://github.com/mirolli/packer-templates
    $ cd packer-templates/<box-definition-dir>/
    $ packer build <template_name>.json

### Supported versions

These templates was tested using a packer 1.6.2

## Credits

These packer templates were built by considering different sources of inspiraiton. Therefore credits to whom it belongs:

* Mitchell Hashimoto (mitchellh)
* Patrick Debois (jedi4ever)
* 時雨堂(shiguredo)
* Jeff Geerling (geerlingguy)

## Changelog

See `git shortlog` for the list of changes.

