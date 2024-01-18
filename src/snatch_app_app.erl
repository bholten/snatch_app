%%%-------------------------------------------------------------------
%% @doc snatch_app public API
%% @end
%%%-------------------------------------------------------------------

-module(snatch_app_app).

-behaviour(application).

-export([start/2, stop/1]).

start(_StartType, _StartArgs) ->
    snatch_app_sup:start_link().

stop(_State) ->
    ok.

%% internal functions
