# run from gm4_live_catch:fish/FISH_TYPE/summon


# update
data modify entity @s Air set value 60
data modify entity @s Health set value 1f
tag @s add gm4_lc_fish_new

# copy motion from item into fish
data modify entity @s Motion set from storage gm4_live_catch:temp target.Motion
