-module(snatch_app_example_listener).
-export([
    code_change/3,
    init/1,
    handle_call/3,
    handle_cast/2,
    handle_info/2,
    start_link/0,
    terminate/2]).

start_link() ->
    gen_server:start_link({local, ?MODULE}, ?MODULE, [], []).

init(Args) ->
    _Pid = spawn_link(snatch, start_link, [claws_aws_sqs, self()]),
    {ok, Args}.

handle_call(_Request, _From, State) ->
    {reply, ok, State}.

handle_cast(_Msg, State) ->
    {noreply, State}.

handle_info({received, Packet, Via}, State) ->
    io:format("Received packet/via: ~p ~p~n", [Packet, Via]),
    {noreply, State};

handle_info(_Info, State) -> {noreply, State}.

terminate(_Reason, _State) ->
    ok.

code_change(_OldVsn, State, _Extra) ->
    {ok, State}.
