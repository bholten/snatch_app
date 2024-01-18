-module(snatch_app_example_listener_sup).
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
          modules => [snatch_app_example_listener]}
    ],
    {ok, {{one_for_one, 5, 10}, ChildSpec}}.
