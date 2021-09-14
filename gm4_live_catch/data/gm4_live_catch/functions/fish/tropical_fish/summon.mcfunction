# run from gm4_live_catch:fish/FISH_TYPE/target


# store nbt
data modify storage gm4_live_catch:temp target set from entity @s

# summon fish
summon tropical_fish ~ ~1 ~ {Air:100,Health:1f,Tags:["gm4_lc_fish_new"]}

# copy motion from item into fish
data modify entity @e[type=tropical_fish,limit=1,sort=nearest,tag=gm4_lc_fish_new] Motion set from storage gm4_live_catch:temp target.Motion

# remove 
tag @e[type=tropical_fish,tag=gm4_lc_fish_new] remove gm4_lc_fish_new

# kill item
kill @s
