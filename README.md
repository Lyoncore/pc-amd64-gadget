# 64bit PC Gadget Snap

This repository contains the official Ubuntu Core gadget snap for 64bit
Personal Computers using Intel or AMD processors. 

## Gadget Snaps

Gadget snaps are a special type of snaps that contain device specific support
code and data. You can read more about them in the snapd wiki
https://github.com/snapcore/snapd/wiki/Gadget-snap

## Reporting Issues

Please report all issues on the Launchpad project page
https://bugs.launchpad.net/snap-pc/+filebug

We use Launchpad to track issues as this allows us to coordinate multiple
projects better than what is available with Github issues.

## Building

To build the gadget snap locally please use `snapcraft`.

## Building ubuntu core image with recovery

To build the Ubuntu core image with recovery partititon, please preparee model assertion.
Install/refresh the ubuntu-image in the beta(1.1+snap3).
```
Install:
$ snap install ubutnu-image --beta

Refresh:
$ snap refresh ubuntu-image --beta
```

Building the image with ubuntu-image by following command:
```
$ ubuntu-image --extra-snaps pc_16.04-0.9_amd64.snap -w workdir <path to model assertion>/pc.model --hooks-directory workdir/unpack/gadget/ubuntu-image-hooks/
```

Note: Currently, the recovery process requires to get user confirmation to prevent damage user data.
The user confirmation still output to serial console only. Please attach serial console and enter [y] enter in when you see the prompt:
```
Factory Restore will delete all user data, are you sure? [y/N]
```

## Launchpad Mirror and Automatic Builds.

All commits from the master branch of https://github.com/snapcore/pc-amd64
are automatically mirrored by Launchpad to the https://launchpad.net/snap-pc
project.

The master branch is automatically built from the launchpad mirror and
published into the snap store to the edge channel.

You can find build history and other controls here:
https://code.launchpad.net/~canonical-foundations/+snap/pc-amd64
