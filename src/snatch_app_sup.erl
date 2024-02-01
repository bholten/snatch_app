-module(snatch_app_sup).
-behaviour(supervisor).

-export([start_link/0]).
-export([init/1]).

start_link() ->
    supervisor:start_link({local, ?MODULE}, ?MODULE, []).

init([]) ->
    ChildSpec = [
        #{id => snatch_app_example_listener,
          start => {snatch_app_example_listener, start_link, []},
          restart => permanent,
          shutdown => 5000,
          type => worker,
          modules => [snatch_app_example_listener]},
        #{id => claws_aws_sqs_1,
          start => {claws_aws_sqs, start_link, [["000000000000/LocalSQSQueue1"]]},
          restart => permanent,
          shutdown => 5000,
          type => worker,
          modules => [claws_aws_sqs]}
    ],
    {ok, {{one_for_one, 5, 10}, ChildSpec}}.

