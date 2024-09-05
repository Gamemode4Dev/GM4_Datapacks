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
summon cod ~ ~1 ~ {Health:1f,Tags:["gm4_lc_cod_new"]}
data modify entity @e[type=cod,limit=1,tag=gm4_lc_cod_new] {} merge from storage gm4_live_catch:temp/output Target

# remove 
tag @e[type=cod] remove gm4_lc_cod_new

# kill item
kill @s
