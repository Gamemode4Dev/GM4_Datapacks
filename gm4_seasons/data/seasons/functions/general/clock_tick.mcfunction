#run from seasons:check_pulse


#seconds clock
scoreboard players add gm4_szn_clock gm4_szn_timer 1

execute if score gm4_szn_clock gm4_szn_timer matches 20 run function seasons:general/clock_second
execute if score gm4_szn_clock gm4_szn_timer matches 20.. run scoreboard players set gm4_szn_clock gm4_szn_timer 0


#ticks clock
function seasons:general/time
execute if score gm4_szn_detect gm4_szn_season matches 1 run function seasons:spring/tick
execute if score gm4_szn_detect gm4_szn_season matches 2 run function seasons:summer/tick
execute if score gm4_szn_detect gm4_szn_season matches 3 run function seasons:autumn/tick
execute if score gm4_szn_detect gm4_szn_season matches 4 run function seasons:winter/tick
function seasons:blocks/revert
function seasons:general/sleep/check


execute if entity @a[scores={gm4_szn_mine_leaf_o=1..}] run scoreboard players reset @a[scores={gm4_szn_mine_leaf_o=1..}] gm4_szn_mine_leaf_o
execute if entity @a[scores={gm4_szn_mine_leaf_b=1..}] run scoreboard players reset @a[scores={gm4_szn_mine_leaf_b=1..}] gm4_szn_mine_leaf_b
execute if entity @a[scores={gm4_szn_mine_leaf_d=1..}] run scoreboard players reset @a[scores={gm4_szn_mine_leaf_d=1..}] gm4_szn_mine_leaf_d
execute if entity @a[scores={gm4_szn_mine_leaf_j=1..}] run scoreboard players reset @a[scores={gm4_szn_mine_leaf_j=1..}] gm4_szn_mine_leaf_j

execute if entity @a[scores={gm4_szn_mine_wheat=1..}] run scoreboard players reset @a[scores={gm4_szn_mine_wheat=1..}] gm4_szn_mine_wheat