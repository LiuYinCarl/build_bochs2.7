# 在 Ubuntu 下编译 Bochs 2.7

Bochs 2.7 源代码来自于 https://sourceforge.net/projects/bochs/files/bochs/2.7/

## step 1: 安装依赖库

```bash
bash ./apt_install.sh
```

## step 2: 生存配置文件、编译、测试

```bash
bash ./build.sh
```

## 一些错误的解决办法

### error1:  Bochs is not compiled with lowlevel sound support

只要把 bochsrc 配置文件中的声音配置(在配置文件中搜索 sound 即可)关闭即可。

### error2: cpu directive malformed

这是因为当前编译的 Bochs 不支持当前配置文件中设置的 CPU, 使用 `bochs -help cpu`
查看 Bochs 当前支持的 CPU，换一个当前支持的 CPU 到配置文件中或者使用适当的
参数重新编译 Bochs。

## term mode

如果想要在终端下无 GUI 使用 Bochs, 可以在编译时使用 `--with-term` 编译参数

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

# Bochs 的输出会被输出到 /dev/pts/2 中(不一定所有时候都是 2)
Bochs connected to screen "/dev/pts/2"
# ....

# 新开一个终端，查看 /dev/pts/2
$ cat /dev/pts/2
```
