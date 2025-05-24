# marches along and places a marker once a newly placed brewing stand is found
# @s = player who has placed a brewing stand
# at location along a ray originating from the player's eyes
# run from gm4_brewing:place_brewing_stand

# check for newly placed brewing stand, return when found
execute positioned ~1 ~ ~ if block ~ ~ ~ brewing_stand align xyz unless entity @e[type=marker,tag=gm4_brewing_stand,dx=0,limit=1] run return run summon marker ~.5 ~.5 ~.5 {Tags:["gm4_brewing_stand"],CustomName:"gm4_brewing_stand"}
execute positioned ~ ~1 ~ if block ~ ~ ~ brewing_stand align xyz unless entity @e[type=marker,tag=gm4_brewing_stand,dx=0,limit=1] run return run summon marker ~.5 ~.5 ~.5 {Tags:["gm4_brewing_stand"],CustomName:"gm4_brewing_stand"}
execute positioned ~ ~ ~1 if block ~ ~ ~ brewing_stand align xyz unless entity @e[type=marker,tag=gm4_brewing_stand,dx=0,limit=1] run return run summon marker ~.5 ~.5 ~.5 {Tags:["gm4_brewing_stand"],CustomName:"gm4_brewing_stand"}
execute positioned ~-1 ~ ~ if block ~ ~ ~ brewing_stand align xyz unless entity @e[type=marker,tag=gm4_brewing_stand,dx=0,limit=1] run return run summon marker ~.5 ~.5 ~.5 {Tags:["gm4_brewing_stand"],CustomName:"gm4_brewing_stand"}
execute positioned ~ ~-1 ~ if block ~ ~ ~ brewing_stand align xyz unless entity @e[type=marker,tag=gm4_brewing_stand,dx=0,limit=1] run return run summon marker ~.5 ~.5 ~.5 {Tags:["gm4_brewing_stand"],CustomName:"gm4_brewing_stand"}
execute positioned ~ ~ ~-1 if block ~ ~ ~ brewing_stand align xyz unless entity @e[type=marker,tag=gm4_brewing_stand,dx=0,limit=1] run return run summon marker ~.5 ~.5 ~.5 {Tags:["gm4_brewing_stand"],CustomName:"gm4_brewing_stand"}

# advance
scoreboard players remove $ray gm4_count 1
execute if score $ray gm4_count matches 0.. positioned ^ ^ ^0.013 run function gm4_brewing:mark_brewing_stand
