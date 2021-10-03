# Summons the fish at the fish item
# @s = item that was fished
# at @s
# run from gm4_live_catch:fish/FISH_TYPE/target


# prepare storage
data modify storage gm4_live_catch:temp/input Target set from entity @s
data modify storage gm4_live_catch:temp/output Target set value {Motion:[0d,0d,0d]}

# modify storage
execute store result storage gm4_live_catch:temp/output Target.Motion[0] double 0.0001 run data get storage gm4_live_catch:temp/input Target.Motion[0] 13000
execute store result storage gm4_live_catch:temp/output Target.Motion[1] double 0.0001 run data get storage gm4_live_catch:temp/input Target.Motion[1] 13000
execute store result storage gm4_live_catch:temp/output Target.Motion[2] double 0.0001 run data get storage gm4_live_catch:temp/input Target.Motion[2] 15000
data modify storage gm4_live_catch:temp/output Target merge value {Health:1f,Tags:["gm4_lc_tropical_fish_new"]}

# summon fish / store data
summon tropical_fish ~ ~ ~
data modify entity @e[type=tropical_fish,limit=1,distance=0] {} merge from storage gm4_live_catch:temp/output Target

# remove 
tag @e[type=tropical_fish] remove gm4_lc_tropical_fish_new

# kill item
kill @s
