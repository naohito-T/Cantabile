# cmd

やっとわかった。
多分だが、やることの責務ごとにentry pointを分ける。
web, job, cliから何かやるなどに分ける。

そしてpkgが各entrypointから使いたいいわばutils
internalは各entrypointのひとつからしか参照されない。

