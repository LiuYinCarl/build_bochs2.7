# How To Compiler Bochs 2.7 in Ubunut

the Bochs 2.7 source code is from https://sourceforge.net/projects/bochs/files/bochs/2.7/

## step 0: edit the `./bx_debug/debug.h` file

I had do this in the repo, so you don't need to edit it anymore.

```bash
bochs-2.7$ git diff ./bx_debug/debug.h
diff --git a/bx_debug/debug.h b/bx_debug/debug.h
index 4e86f85..0b92299 100644
--- a/bx_debug/debug.h
+++ b/bx_debug/debug.h
@@ -22,8 +22,8 @@
#define BX_DEBUG_H

// if including from C parser, need basic types etc
-#include "config.h"
-#include "osdep.h"
+#include "../config.h"
+#include "../osdep.h"

#define BX_DBG_NO_HANDLE 1000

@@ -31,7 +31,7 @@ Bit32u crc32(const Bit8u *buf, int len);

#if BX_DEBUGGER

-#include "cpu/decoder/decoder.h"
+#include "../cpu/decoder/decoder.h"

 // some strict C declarations needed by the parser/lexer
 #ifdef __cplusplus
```

## step 1: install dependend libs

```bash
bash ./my_apt_install.sh
```

## step 2: generate configure file

```bash
bash ./my_build.sh
```

## step 3: fix error include

```bash
bash ./my_fix_cc_error.sh
```

## step 4: make bochs

```bash
make
```
