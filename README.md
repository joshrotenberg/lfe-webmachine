# lfe-webmachine

Basic direct port of the simple app created by the
[webmachine](https://github.com/basho/webmachine) new_webmachine.sh
script from Erlang to LFE. Current expections:

 * need to implement the lfewm_sup:upgrade function
 * has to implement lfewm_resource:ping manually

Otherwise it seems to work correctly.

Build it like you would anything else:

``` bash
$ make
$ ./start.sh
```

