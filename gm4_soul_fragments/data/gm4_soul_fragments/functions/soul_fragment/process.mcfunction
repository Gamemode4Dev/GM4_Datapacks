# @s = abandoned soul fragment with item or player nearby
# at @s
# from soul_fragment/process_check

# set scoreboard ID
scoreboard players operation #current gm4_sf_id = @s gm4_sf_id

# die if nearby linked player is at full hearts
execute if score @p[gamemode=!creative,gamemode=!spectator,distance=..22,scores={gm4_sf_fragments=0}] gm4_sf_id = #current gm4_sf_id run stopsound @a[distance=..22] neutral minecraft:block.beacon.ambient
execute if score @p[gamemode=!creative,gamemode=!spectator,distance=..22,scores={gm4_sf_fragments=0}] gm4_sf_id = #current gm4_sf_id run kill @s

# visuals

# check if there are soul revealing blocks nearby
execute store result score @s gm4_sf_reveal run clone ~-3 ~-2 ~-3 ~3 ~2 ~3 ~-3 ~-2 ~-3 filtered #gm4_soul_fragments:soul_revealing force	

# emit particles and hum if revealed
execute as @s[scores={gm4_sf_reveal=1..}] run function gm4_soul_fragments:soul_fragment/appear

# targetting 

# target linked players and totems of undying for seeking, prioritizing the player
execute as @a[gamemode=!creative,gamemode=!spectator,scores={gm4_sf_fragments=1..},distance=..16,limit=1] if score @s gm4_sf_id = #current gm4_sf_id unless score @s gm4_sf_rspwn matches 1 run tag @s add gm4_sf_target
execute unless entity @e[type=#gm4_soul_fragments:soul_target,tag=gm4_sf_target,distance=..17] run tag @e[type=item,nbt=!{Item:{tag:{gm4_soul_fragments:{}}}},nbt={Item:{id:"minecraft:totem_of_undying",Count:1b},OnGround:1b},limit=1,sort=nearest,distance=..5] add gm4_sf_target

# move towards target
execute if entity @e[type=#gm4_soul_fragments:soul_target,tag=gm4_sf_target,distance=..16,limit=1] run function gm4_soul_fragments:soul_fragment/seek_target

# remove target tags
execute as @a[tag=gm4_sf_target,distance=..16,limit=1] if score @s gm4_sf_id = #current gm4_sf_id run tag @s remove gm4_sf_target
tag @e[type=item,tag=gm4_sf_target,distance=..5] remove gm4_sf_target
