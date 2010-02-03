My fork of Jon Gretar's Erlang User Utilities.  Read [this blog post](http://medevyoujane.com/blog/2010/1/3/erlang-quick-tip-the-user_default-module.html) for background.

    sync()              %   compiles all files in Emakefile and load into current shell
    reload()            %   reload loaded modules
    reload_then(Fun)    %   reload then exec a function
    git(String)         %   run git command


Add the following to ~/.erlang to enable them:

    code:load_abs("/Path/To/erlang_user_utilities/user_default").



