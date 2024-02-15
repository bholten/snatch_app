-module(snatch_app_sup).
-behaviour(supervisor).

-export([start_link/2]).
-export([init/1]).

start_link(Queue1, Queue2) ->
    supervisor:start_link({local, ?MODULE}, ?MODULE, [Queue1, Queue2]).

init([Queue1, Queue2]) ->
    ChildSpec = [
        #{id => snatch_app_example_listener,
          start => {snatch_app_example_listener, start_link, []},
          restart => permanent,
          shutdown => 5000,
          type => worker,
          modules => [snatch_app_example_listener]},
        #{id => claws_aws_sqs_1,
          start => {claws_aws_sqs, start_link, [Queue1]},
          restart => permanent,
          shutdown => 5000,
          type => worker,
          modules => [claws_aws_sqs]},
          #{id => claws_aws_sqs_2,
          start => {claws_aws_sqs, start_link, [Queue2]},
          restart => permanent,
          shutdown => 5000,
          type => worker,
          modules => [claws_aws_sqs]}
    ],
    {ok, {{one_for_one, 5, 10}, ChildSpec}}.

