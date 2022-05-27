# ray cast to find note block
# @s = player tuning note block
# at @s anchored eyes positioned ^ ^ ^
# run from play_jukebox

# removes 1 from raycast
scoreboard players remove $ray gm4_count 1

# tests for jukebox
execute if block ~ ~ ~ jukebox{RecordItem:{Count:1b}} align xyz positioned ~0.5 ~0.5 ~0.5 unless entity @e[type=marker,tag=gm4_ar_jukebox,distance=..0.5] unless entity @e[tag=smithed.block,distance=..0.5] run summon marker ~ ~ ~ {CustomName:'"gm4_ar_jukebox"',Tags:["gm4_ar_jukebox"]}

# runs the loop again
execute unless block ~ ~ ~ jukebox if score $ray gm4_count matches 1.. positioned ^ ^ ^0.1 run function gm4_allay_revitalizing:raycast
