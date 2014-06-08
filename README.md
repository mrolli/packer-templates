# Packer Templates

Packer templates for building base VM boxes.

## Usage

### Installing Packer

Download the latest packer from <http://www.packer.io/downloads.html>
and unzip the appropriate directory.

If you are an OS X user consider installing packer using Homebrew:

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

* `<os>-bare.json`: Simple minimal installation without vagrant user and guest additions
* `<os>.json`: Standard vagrant base box with vagrant user, guest additions
* `<os>-puppet.json`: Standard vagrant base box like above and with puppet already installed

Pick those you need. If you need another flavor, please open up a PR.

### Supported versions

This templates was tested using a packer 0.6.0.

## Credits

These packer templates were built by considering different sources of inspiraiton. Therefore credits to whom it belongs:

* Mitchell Hashimoto (mitchellh)
* Patrick Debois (jedi4ever)
* 時雨堂(shiguredo)

## Changelog

See `git shortlog` for the list of changes.
