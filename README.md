puppet-erlang
====================

What it does
---------------------

Provides type `erlang` to manage erlang installations within [puppet][1].

Uses [kerl][2] to download, build and install erlang.

How to use it
---------------------

First you make sure you have `puppet-erlang` in puppet's `modulepath`.

Next you have to include `puppet-erlang` in your puppet script:

    include puppet-erlang

Now you can install erlang release as simple as:

    erlang { "r14b04": }

Or you can customize it to your needs:

    erlang {
      "erlang-r14":
        ensure  => present,
        release => "r14b04",
        target  => "/opt/erlang",
        clean   => true;
    }

To run the script with puppet apply you have to specify `modulepath`:

    $ puppet apply --modulepath /path/to/modules site.pp

### Available parameters

 * `release` - erlang release to be built (if the resource name is not a valid release)
 * `target` - target path for installation
 * `clean` - remove the build after installing it (true / false)

TODO
---------------------

 * Link one of the releases to `/usr/local/bin`,
 * Custom name for the build,
 * Multiple targets for more than one installation of the same build,
 * Custom build parameters,
 * Lastest erlang release,
 * Add support for agner.

   [1]: https://github.com/puppetlabs/puppet "Puppet - Server automation framework and application"
   [2]: https://github.com/spawngrid/kerl "Kerl - Easy building and installing of Erlang/OTP instances"
