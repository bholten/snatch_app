%%%-------------------------------------------------------------------
%% @doc snatch_app public API
%% @end
%%%-------------------------------------------------------------------

-module(snatch_app_app).

-behaviour(application).

-export([start/2, stop/1]).

start(_StartType, _StartArgs) ->
    lager:info("Starting app"),
    {ok, Queue1, Queue2} = get_config(),
    snatch_app_sup:start_link(Queue1, Queue2).

stop(_State) ->
    ok.

%% internal functions
get_config() ->
    {ok, Queue1} = application:get_env(snatch_app, sqs_queue_1),
    {ok, Queue2} = application:get_env(snatch_app, sqs_queue_2),
    {ok, Queue1, Queue2}.
