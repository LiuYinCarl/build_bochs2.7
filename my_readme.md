# How To Compiler Bochs 2.7 in Ubunut

the Bochs 2.7 source code is from https://sourceforge.net/projects/bochs/files/bochs/2.7/

## step 1: install dependend libs

```bash
bash ./apt_install.sh
```

## step 2: generate configure file

```bash
bash ./build.sh
```

## Useful Tips

### error1:  Bochs is not compiled with lowlevel sound support

just comment the sound config in `.bochsrc`

### error2: cpu directive malformed

this is because bochs not support your CPU in you bochsrc configuration,
you can run `bochs -help cpu` to see the supported cpus and select one
to replace your configuration.

## Example

`my_bochsrc` is a example config file for a X64 CPU. After make bochs, you
can run `my_run.sh` to test it.

## term mode

if you want to use bochs without any gui(just use terminal), you can
rebuild bochs with option `--with-term` if you did not before.

```bash
$ bochs
# .....
1. Restore factory default configuration
2. Read options from...
3. Edit options
4. Save options to...
5. Restore the Bochs state from...
6. Begin simulation
7. Quit now

Please choose one: [6]
00000000000i[      ] installing term module as the Bochs GUI

Bochs connected to screen "/dev/pts/2"
# ....

# open another terminal
$ cat /dev/pts/2
```
