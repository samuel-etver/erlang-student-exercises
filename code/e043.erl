% e043

-module(e043).
-export([start/0,
         stop/0]).
-export([get_parents/0,
        print_parents/1,
        print_one_parent/1]).
-export([testAll/0]).
-include_lib("stdlib/include/qlc.hrl").

-record(parent, {name, child}).


-define(PARENTS, 
    [#parent {name="John", child="Ann"},
     #parent {name="Bill", child="James"},
     #parent {name="Harold", child="Lilo"},
     #parent {name="Joanne", child="Thomas"},
     #parent {name="Lucas", child="Brenda"},
     #parent {name="Laura", child="Carol"},
     #parent {name="Emily", child="Ann"},
     #parent {name="Mary", child="Thomas"},
     #parent {name="Jessica", child="Brenda"}   
]).


start() ->    
    mnesia:create_schema([node()]),
    mnesia:start(),
    mnesia:create_table(parent, [{attributes, record_info(fields, parent)}]),
    F = fun() ->
        lists:foreach(fun mnesia:write/1, ?PARENTS)
    end,
    mnesia:transaction(F).


stop() ->
    mnesia:stop(),
    del_all_files("Mnesia.nonode@nohost").


get_parents() ->
    do(qlc:q([X || X <- mnesia:table(parent)])).


do(Q) ->
    F = fun() -> 
        qlc:e(Q) 
    end,
    {atomic, Val} = mnesia:transaction(F),
    Val.


del_all_files(Dir) ->
    {ok, Files} = file:list_dir(Dir),
    lists:foreach(fun(F) ->
        ok = file:delete(Dir ++ "/" ++ F)
    end, Files),
    file:del_dir(Dir).


print_parents([]) ->
    ok;
print_parents([Head | Tail]) ->
    print_one_parent(Head),
    print_parents(Tail).


print_one_parent(R) ->
    io:fwrite("~s is parent of ~s.~n", [R#parent.name, R#parent.child]).


test() ->     
    Parents = get_parents(),    
    print_parents(Parents).


testAll() ->
    start(),
    test(),
    stop().
