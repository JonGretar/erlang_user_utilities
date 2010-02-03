-module (user_default).
-export ([sync/0,make/0,git/1,reload/0,reload_then/1]).

%% Reload code
reload() ->
	LibExclude = base_lib_path(),
	Modules = [M || {M, P} <- code:all_loaded(), is_list(P) andalso string:str(P, LibExclude) =:= 0],
	[shell_default:l(M) || M <- Modules].

%% Reload code then exec F
reload_then(F) ->
	reload(),
	F().

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

base_lib_path() ->
	KernAppPath = code:where_is_file("kernel.app"),
	string:substr(KernAppPath, 1, string:str(KernAppPath,"kernel") - 1).
