# Patches for T2SDE Linux

My unofficial patches for T2SDE Linux.

Directory `package/` contains overlays for Host (stage "9") builds.

Scripts `fix_*` in this directory workaround broken mirror downloads.

# Building ISO

Work in progress:

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

