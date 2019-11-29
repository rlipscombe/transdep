-module(transdep_sup).
-export([start_link/0]).
-behaviour(supervisor).
-export([init/1]).

start_link() ->
    supervisor:start_link(?MODULE, []).

init([]) ->
    Flags = #{strategy => one_for_one, intensity => 1, period => 5},
    Children = [],
    {ok, {Flags, Children}}.
