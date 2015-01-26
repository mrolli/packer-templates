# Packer Templates

Packer templates for building base VM boxes. Curently the following operating systems
are supported:

* CentOS-6.6 (Santiago) x86\_64
* CentOS-7.0-1406 (Maipo) x86\_64
* Ubuntu Server 12.04 (precise) x86\_64
* Ubuntu Server 14.04 (trusty) x86\_64

## Usage

### Installing Packer

Download the latest packer from <http://www.packer.io/downloads.html>
and unzip the appropriate directory.

If you are an OS X user consider installing packer using [Homebrew](http://brew.sh/):

    $ brew tap homebrew/binary
    $ brew install packer

### Running Packer

    $ git clone https://github.com/mirolli/packer-templates
    $ cd packer-templates/<box-definition-dir>/
    $ packer build <template_name>.json

If you want to build only virtualbox or vmware.

    $ packer build -only=virtualbox-iso <template_name>.json
    $ packer build -only=vmware-iso <template_name>.json

Parallel builds can be run on 0.6.0 or latest packer version.

    $ packer build -parallel=true <template_name>.json

### Template Variations

Each OS template is available in three different flavors:

* `<os>.json`: Standard base box with vagrant user, guest additions
* `<os>-puppet.json`: Standard base box like above and with puppet already installed

Pick those you need. If you need another flavor, please open up a PR.

### Supported versions

These templates was tested using a packer 0.7.5.

## Credits

These packer templates were built by considering different sources of inspiraiton. Therefore credits to whom it belongs:

* Mitchell Hashimoto (mitchellh)
* Patrick Debois (jedi4ever)
* 時雨堂(shiguredo)

## Changelog

See `git shortlog` for the list of changes.

