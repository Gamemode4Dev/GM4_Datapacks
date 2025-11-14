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

# summon fish / store data
execute store result score $salmon_size gm4_live_catch.data run random value 1..1000
execute if score $salmon_size gm4_live_catch.data matches 1..316 run summon salmon ~ ~1 ~ {Health:1f,Tags:["gm4_lc_salmon_new"],type:"small"}
execute if score $salmon_size gm4_live_catch.data matches 317..842 run summon salmon ~ ~1 ~ {Health:1f,Tags:["gm4_lc_salmon_new"],type:"medium"}
execute if score $salmon_size gm4_live_catch.data matches 843..1000 run summon salmon ~ ~1 ~ {Health:1f,Tags:["gm4_lc_salmon_new"],type:"large"}
data modify entity @e[type=salmon,limit=1,tag=gm4_lc_salmon_new] {} merge from storage gm4_live_catch:temp/output Target

# remove 
tag @e[type=salmon] remove gm4_lc_salmon_new

# kill item
kill @s
