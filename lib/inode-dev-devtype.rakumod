# We need to be naughty because we have to to provide this functionality
use nqp;

my sub does-not-exist(
  IO::Path:D $io,
  Str:D $trying
--> Failure) is hidden-from-backtrace {
    Failure.new:
      X::IO::DoesNotExist.new:
        :path(nqp::getattr(nqp::decont($io),IO::Path,'$!os-path')),
        :$trying
}

my sub inode(IO::Path:D $io --> Int:D) is export {
    Rakudo::Internals.FILETEST-E($io.absolute)  # sets $!os-path
      ?? nqp::stat(
           nqp::getattr(nqp::decont($io),IO::Path,'$!os-path'),
           nqp::const::STAT_PLATFORM_INODE
         )
      !! does-not-exist($io, "inode")
}

my sub dev(IO::Path:D $io --> Int:D) is export {
    Rakudo::Internals.FILETEST-E($io.absolute)  # sets $!os-path
      ?? nqp::stat(
           nqp::getattr(nqp::decont($io),IO::Path,'$!os-path'),
           nqp::const::STAT_PLATFORM_DEV
         )
      !! does-not-exist($io, "dev")
}

my sub devtype(IO::Path:D $io --> Int:D) is export {
    Rakudo::Internals.FILETEST-E($io.absolute)  # sets $!os-path
      ?? nqp::stat(
           nqp::getattr(nqp::decont($io),IO::Path,'$!os-path'),
           nqp::const::STAT_PLATFORM_DEVTYPE
         )
      !! does-not-exist($io, "devtype")
}

=begin pod

=head1 NAME

inode-dev-devtype - Provide inode / dev / devtype for older Rakudos

=head1 SYNOPSIS

=begin code :lang<raku>

use inode-dev-devtype;

my $io = "foo".IO;
say "inode of foo is: &inode($io)";

my $inode = $io.&inode;

=end code

=head1 DESCRIPTION

inode-dev-devtype is a module intended to be used by Rakudo versions
before the 2202.07 release.  It provides sub versions of the C<inode>,
C<dev> and C<devtype> methods that were added to the C<IO::Path> class
in that release.

=head1 AUTHOR

Elizabeth Mattijsen <liz@raku.rocks>

Source can be located at: https://github.com/lizmat/inode-dev-devtype .
Comments and Pull Requests are welcome.

If you like this module, or what I’m doing more generally, committing to a
L<small sponsorship|https://github.com/sponsors/lizmat/>  would mean a great
deal to me!

=head1 COPYRIGHT AND LICENSE

Copyright 2022 Elizabeth Mattijsen

This library is free software; you can redistribute it and/or modify it under the Artistic License 2.0.

=end pod
