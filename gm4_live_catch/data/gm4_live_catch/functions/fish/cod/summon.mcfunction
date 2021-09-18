# Summons the fish at the fish item
# @s = item that was fished
# at @s
# run from gm4_live_catch:fish/FISH_TYPE/target


# summon fish
summon cod ~ ~1 ~ {Health:1f,Tags:["gm4_lc_cod_new"]}

# copy motion into storage
data modify storage gm4_live_catch:temp/input target set from entity @s
execute store result storage gm4_live_catch:temp/output target.Motion[0] double 0.0001 run data get storage gm4_live_catch:temp/input target.Motion[0] 13000
execute store result storage gm4_live_catch:temp/output target.Motion[1] double 0.0001 run data get storage gm4_live_catch:temp/input target.Motion[1] 13000
execute store result storage gm4_live_catch:temp/output target.Motion[2] double 0.0001 run data get storage gm4_live_catch:temp/input target.Motion[2] 15000

# copy motion from item into fish
data modify entity @e[type=cod,limit=1,tag=gm4_lc_cod_new] {} merge from storage gm4_live_catch:temp/output target

# remove 
tag @e[type=cod] remove gm4_lc_cod_new

# kill item
kill @s
