# @s = soul fragment with a linked player nearby
# from soul_fragment/process

# target linked players and individual soul lanterns for seeking (if near a player), prioritizing the player

execute as @a[gamemode=!creative,gamemode=!spectator,scores={gm4_sf_fragments=1..},distance=..16,limit=1] if score @s gm4_sf_id = #current gm4_sf_id unless score @s gm4_sf_rspwn matches 1 run tag @s add gm4_sf_target
execute unless entity @a[tag=gm4_sf_target,distance=..17] as @e[type=item,nbt={Item:{Count:1b,id:"minecraft:soul_lantern"},OnGround:1b},nbt=!{Item:{tag:{gm4_soul_fragments:{}}}},distance=..5] at @s if entity @a[distance=..2] run tag @s add gm4_sf_target

# move towards target
execute if entity @e[type=#gm4_soul_fragments:interact,tag=gm4_sf_target,distance=..16,limit=1] run function gm4_soul_fragments:soul_fragment/seek_target

# remove target tags
execute as @a[tag=gm4_sf_target,distance=..16,limit=1] if score @s gm4_sf_id = #current gm4_sf_id run tag @s remove gm4_sf_target
tag @e[type=item,tag=gm4_sf_target,distance=..5] remove gm4_sf_target
