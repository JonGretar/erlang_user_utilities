-module (user_default).
-export ([sync/0,make/0,git/1]).

%% Compiles all files in Emakefile and load into current shell.
sync() ->
	make:all([load]).

%% Run the make command in shell.
make() ->
	run_command(["make", "all"]).

%% Run git command in shell.
git(Command) ->
	CommandList = ["git", Command],
	run_command(CommandList).


%%%% Private Functions

run_command(CommandList) ->
	Result = os:cmd(string:join(CommandList, " ")),
	io:format("~s~n", [Result]).
