# Patches for T2SDE Linux

My unofficial patches for T2SDE Linux.

Directory `package/` contains overlays for Host (stage "9") builds.

Scripts `fix_*` in this directory workaround broken mirror downloads.

# Building ISO

> [!WARNING]
> 
> Work in progress:

Tested SVN revision:

```shell
$ cd /usr/src/t2-src
$ svn info | grep '^Last Changed'

Last Changed Author: notag
Last Changed Rev: 74904
Last Changed Date: 2025-03-09 16:58:44 +0100 (Sun, 09 Mar 2025)
```

Running commands:

```shell
t2 config -cfg isomin # select Base wayland template
t2 build-target -cfg isomin
```

Above will fail on `0-kmod` (`0` is stage number, `kmod` is package name) that
`scdoc `not found, workaround:

- patch `config/isomin/packages` file this way (we enable
  `scdoc` as optional package in stage 0):

  ```diff
  diff /tmp/packages  config/isomin/packages
  724c724
  < O -1---5---- 120.000 textproc scdoc 1.11.2 / base/x11 CROSS 0
  ---
  > O 01---5---- 120.000 textproc scdoc 1.11.2 / base/x11 CROSS 0
  ```
- and manually install it and continue build:
  ```shell
  t2 build-target -cfg isomin -job 0-scdoc
  # now should pass:
  t2 build-target -cfg isomin -job 0-kmod
  # resume ISO build with:
  t2 build-target -cfg isomin
  ```

Now another error on `2-udev`:
```
install: target '/usr/src/t2-src/build/isomin-25-svn-generic-x86-64-linux//lib/udev/rules.d/': No such file or directory
```
- trying quick workaround:
  ```shell
  mkdir -p /usr/src/t2-src/build/isomin-25-svn-generic-x86-64-linux/lib/udev/rules.d
  ```
- now retry build:
  ```shell
  t2 build-target -cfg isomin 2-udev
  ```
- OK, resume ISO builds with:
  ```shell
  t2 build-target -cfg isomin
  ```

New fixes required for latest SVN revision:
```shell
$ svn info | grep '^Last Change'
Last Changed Author: rene
Last Changed Rev: 74980
Last Changed Date: 2025-03-12 00:47:03 +0100 (Wed, 12 Mar 2025)

# fix broken net-tools-download
./fix_net_tools.sh

# failed security/libxcrypt due missing perl, workaround:
t2 build-target -cfg isomin 5-perl
# failed glibc due missing python, workaround
t2 build-target -cfg isomin 5-python
```
