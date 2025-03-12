# Patches for T2SDE Linux

My unofficial patches for T2SDE Linux.

Directory `package/` contains overlays for Host (stage "9") builds.

Scripts `fix_*` in this directory workaround broken mirror downloads.

# Building ISO

Work in progress:

```shell
t2 config -cfg isomin # select Base wayland template
t2 build-target -cfg isomin
# will fail on 0-kmod that scdoc not found, workaround:
t2 build-target -cfg isomin -job 0-scdoc
# now should pass:
t2 build-target -cfg isomin -job 0-kmod
# resume ISO build with:
t2 build-target -cfg isomin
```

