# Summons the fish at the fish item
# @s = item that was fished
# at @s
# run from gm4_live_catch:fish/FISH_TYPE/target


# copy motion into storage
data modify storage gm4_live_catch:temp/input target set from entity @s
execute store result storage gm4_live_catch:temp/output target.Motion[0] double 0.0001 run data get storage gm4_live_catch:temp/input target.Motion[0] 13000
execute store result storage gm4_live_catch:temp/output target.Motion[1] double 0.0001 run data get storage gm4_live_catch:temp/input target.Motion[1] 13000
execute store result storage gm4_live_catch:temp/output target.Motion[2] double 0.0001 run data get storage gm4_live_catch:temp/input target.Motion[2] 13000

# modify storage
data modify storage gm4_live_catch:temp/output target merge value {Health:1f,Tags:["gm4_lc_tropical_fish_new"]}

# summon fish / copy motion from item into fish
summon tropical_fish ~ ~ ~
data modify entity @e[type=tropical_fish,limit=1,distance=0] {} merge from storage gm4_live_catch:temp/output target

# remove 
tag @e[type=tropical_fish] remove gm4_lc_tropical_fish_new

# kill item
kill @s
