-module(snatch_app_sqs_sup).
-behaviour(supervisor).

-export([start_link/0]).
-export([init/1]).

start_link() ->
    supervisor:start_link({local, ?MODULE}, ?MODULE, []).

init([]) ->
    ListenerPid = whereis(snatch_app_example_listener),
    ChildSpec = [
        #{id => claws_aws_sqs,
          start => {claws_aws_sqs, start_link, ["000000000000/LocalSQSQueue"]},
          restart => permanent,
          shutdown => 5000,
          type => worker,
          modules => [claws_aws_sqs]},
        #{id => snatch_sqs,
          start => {snatch, start_link, [claws_aws_sqs, ListenerPid]},
          restart => permanent,
          shutdown => 5000,
          type => worker,
          modules => [snatch]}
    ],
    {ok, {{one_for_one, 5, 10}, ChildSpec}}.
