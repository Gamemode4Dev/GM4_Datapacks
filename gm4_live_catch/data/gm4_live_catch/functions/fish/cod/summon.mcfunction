# run from gm4_live_catch:fish/FISH_TYPE/target


# store nbt
data modify storage gm4_live_catch:temp target set from entity @s

# summon fish
summon cod ~ ~1 ~ {Air:60,Health:1f,Tags:["gm4_lc_fish_new"]}

# copy motion from item into fish
data modify entity @e[type=cod,limit=1,sort=nearest,tag=gm4_lc_fish_new] Motion set from storage gm4_live_catch:temp target.Motion

# remove 
tag @e[type=cod,tag=gm4_lc_fish_new] remove gm4_lc_fish_new

# kill item
kill @s
