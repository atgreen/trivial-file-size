# EGCL support

EGCL uses EGCL-POSIX stat metadata instead of opening files. The smoke test covers binary file lengths, absent paths, and directory metadata.

With dependencies discoverable by ASDF, run:

```sh
egcl --no-init --load tests/egcl-smoke.lisp
```

The smoke test selects this checkout before inherited ASDF configuration.
