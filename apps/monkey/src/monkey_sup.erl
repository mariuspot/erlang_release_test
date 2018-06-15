%%%-------------------------------------------------------------------
%% @doc monkey top level supervisor.
%% @end
%%%-------------------------------------------------------------------

-module(monkey_sup).

-behaviour(supervisor).

%% API
-export([start_link/0]).

%% Supervisor callbacks
-export([init/1]).

-define(SERVER, ?MODULE).

%%====================================================================
%% API functions
%%====================================================================

start_link() ->
    supervisor:start_link({local, ?SERVER}, ?MODULE, []).

%%====================================================================
%% Supervisor callbacks
%%====================================================================

%% Child :: {Id,StartFunc,Restart,Shutdown,Type,Modules}
init([]) ->
    erlang:display([?MODULE,"init"]),
    {ok, { {one_for_all, 0, 1}, [{monkey_gen, {monkey_gen, start_link, []}, permanent, 1000, worker, [monkey_gen]}]} }.
	% {ok, { {one_for_all, 0, 1}, [{client_smpp_server,
    %         {client_smpp_server, start_link, ["client_smpp_server", self()]},
    %         permanent, 1000, worker, [client_smpp_server]}]} }.
%%====================================================================
%% Internal functions
%%====================================================================
