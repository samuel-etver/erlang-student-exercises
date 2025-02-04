% e042

-module(e042).
-export([start/0,
         stop/0]).
-export([get_parents/0,
        print_parents/1,
        print_one_parent/1]).
-export([testAll/0]).


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
-define(FILENAME, "parents.db").
-define(TABNAME, parents).


start() ->    
    dets:open_file(?TABNAME, [{file, ?FILENAME}, {keypos, #parent.name}]),
    dets:insert(?TABNAME, ?PARENTS).


stop() ->
    dets:close(?TABNAME),
    file:delete(?FILENAME).


get_parents() ->
    dets:match_object(?TABNAME, '_').


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
