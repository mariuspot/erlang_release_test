%%%-------------------------------------------------------------------
%% @doc monkey public API
%% @end
%%%-------------------------------------------------------------------

-module(monkey_app).

-behaviour(application).

%% Application callbacks
-export([start/2, stop/1]).

%%====================================================================
%% API
%%====================================================================

start(_StartType, _StartArgs) ->
    erlang:display(["START MONKEY NEW"]),
    monkey_sup:start_link().

%%--------------------------------------------------------------------
stop(_State) ->
    ok.

%%====================================================================
%% Internal functions
%%====================================================================
