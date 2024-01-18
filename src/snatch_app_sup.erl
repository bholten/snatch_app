-module(snatch_app_sup).
-behaviour(supervisor).

-export([start_link/0]).
-export([init/1]).

start_link() ->
    supervisor:start_link({local, ?MODULE}, ?MODULE, []).

init([]) ->
    ChildSpec = [
        #{id => snatch_app_example_listener_sup,
          start => {snatch_app_example_listener_sup, start_link, []},
          restart => permanent,
          shutdown => 5000,
          type => worker,
          modules => [snatch_app_example_listener_sup]},
        #{id => snatch_app_sqs_sup,
          start => {snatch_app_sqs_sup, start_link, []},
          restart => permanent,
          shutdown => 5000,
          type => worker}
    ],
    {ok, {{one_for_one, 5, 10}, ChildSpec}}.

