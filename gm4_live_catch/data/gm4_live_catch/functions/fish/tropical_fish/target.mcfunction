# Executes as the fish item a tick after the player catches it
# @s = player that caught a fish
# at @s
# run from gm4_live_catch:fish/FISH_TYPE/catch


# summon fish at item
execute at @a[tag=gm4_lc_fished_tropical_fish] as @e[type=item,limit=1,sort=furthest,nbt={Item:{id:"minecraft:tropical_fish",Count:1b},OnGround:0b,Age:0s}] unless data entity @s Item.tag at @s run function gm4_live_catch:fish/tropical_fish/summon

# remove fisher tag
tag @a remove gm4_lc_fished_tropical_fish
