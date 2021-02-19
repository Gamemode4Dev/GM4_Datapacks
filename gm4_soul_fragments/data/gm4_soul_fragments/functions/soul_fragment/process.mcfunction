# @s = soul fragment with item or player in the vicinity
# at @s
# from soul_fragment/process_check

# set scoreboard ID
scoreboard players operation #current gm4_sf_id = @s gm4_sf_id

# die if nearby linked player is at full hearts
execute if score @p[gamemode=!creative,gamemode=!spectator,distance=..17,scores={gm4_sf_fragments=0}] gm4_sf_id = #current gm4_sf_id run function gm4_soul_fragments:soul_fragment/kill

# target linked players, players holding a soul lantern or individual soul lanterns for seeking (if next to a player), prioritizing in that order
execute as @a[gamemode=!creative,gamemode=!spectator,scores={gm4_sf_fragments=1..},distance=..16,limit=1] if score @s gm4_sf_id = #current gm4_sf_id unless score @s gm4_sf_rspwn matches 1 run tag @s add gm4_sf_target
execute as @a[tag=gm4_sf_target] run tag @s add gm4_sf_linked
execute unless entity @a[tag=gm4_sf_target,distance=..17] as @a[gamemode=!spectator,distance=..6.5,limit=1] if predicate gm4_soul_fragments:soul_lantern/in_mainhand unless predicate gm4_soul_fragments:soul_in_a_lantern/in_mainhand run tag @s add gm4_sf_target
execute unless entity @a[tag=gm4_sf_target,distance=..17] as @a[gamemode=!spectator,distance=..6.5,limit=1] if predicate gm4_soul_fragments:soul_lantern/in_offhand unless predicate gm4_soul_fragments:soul_in_a_lantern/in_offhand run tag @s add gm4_sf_target
execute unless entity @a[tag=gm4_sf_target,distance=..17] as @e[type=item,nbt={Item:{Count:1b,id:"minecraft:soul_lantern"},OnGround:1b},nbt=!{Item:{tag:{gm4_soul_fragments:{}}}},distance=..5] at @s if entity @a[gamemode=!spectator,gamemode=!creative,distance=..3] run tag @s add gm4_sf_target

# if no target is found, target nearby players next to a placed lantern (fake target)
execute unless entity @a[tag=gm4_sf_target,distance=..17] as @a[gamemode=!creative,gamemode=!spectator,distance=..6] at @s run function gm4_soul_fragments:soul_fragment/set_fake_target

# move towards target
execute if entity @e[type=#gm4_soul_fragments:interact,tag=gm4_sf_target,distance=..16,limit=1] run function gm4_soul_fragments:soul_fragment/seek_target

# visuals
# emit particles and hum if revealed
execute as @s[scores={gm4_sf_fire=1..}] run function gm4_soul_fragments:soul_fragment/appear

# remove target tags
execute as @a[tag=gm4_sf_target,distance=..16] run tag @s remove gm4_sf_f_target
execute as @a[tag=gm4_sf_linked,distance=..16] run tag @s remove gm4_sf_linked
execute as @e[type=#gm4_soul_fragments:interact,tag=gm4_sf_target,distance=..16] run tag @s remove gm4_sf_target
