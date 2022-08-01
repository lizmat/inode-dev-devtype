[![Actions Status](https://github.com/lizmat/inode-dev-devtype/actions/workflows/test.yml/badge.svg)](https://github.com/lizmat/inode-dev-devtype/actions)

NAME
====

inode-dev-devtype - Provide inode / dev / devtype for older Rakudos

SYNOPSIS
========

```raku
use inode-dev-devtype;

my $io = "foo".IO;
say "inode of foo is: &inode($io)";

my $inode = $io.&inode;
```

DESCRIPTION
===========

inode-dev-devtype is a module intended to be used by Rakudo versions before the 2202.07 release. It provides sub versions of the `inode`, `dev` and `devtype` methods that were added to the `IO::Path` class in that release.

AUTHOR
======

Elizabeth Mattijsen <liz@raku.rocks>

Source can be located at: https://github.com/lizmat/inode-dev-devtype . Comments and Pull Requests are welcome.

If you like this module, or what I’m doing more generally, committing to a [small sponsorship](https://github.com/sponsors/lizmat/) would mean a great deal to me!

COPYRIGHT AND LICENSE
=====================

Copyright 2022 Elizabeth Mattijsen

This library is free software; you can redistribute it and/or modify it under the Artistic License 2.0.

