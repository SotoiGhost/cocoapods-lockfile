# cocoapods-lockfile

The cocoapods-lockfile is a Cocoapods plugin that works with the `install` and `update` commands to generate the **Podfile.lock** file without the need to download the Pods files.

## Installation

    $ gem install cocoapods-lockfile

## Usage

```sh
$ pod install --lockfile-only
# or
$ pod update --lockfile-only
```
