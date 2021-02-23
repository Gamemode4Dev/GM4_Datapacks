# @s = soul fragment with player in the vicinity
# at @s
# from soul_fragment/process_check

# set scoreboard ID
scoreboard players operation #current gm4_sf_id = @s gm4_sf_id

# die if nearby linked player is at full hearts
execute if score @p[gamemode=!creative,gamemode=!spectator,distance=..17,scores={gm4_sf_fragments=0}] gm4_sf_id = #current gm4_sf_id run function gm4_soul_fragments:soul_fragment/vanish

# target linked players or players holding a soul lantern
execute as @a[gamemode=!creative,gamemode=!spectator,scores={gm4_sf_fragments=1..},distance=..16,limit=1] if score @s gm4_sf_id = #current gm4_sf_id unless score @s gm4_sf_rspwn matches 1 run tag @s add gm4_sf_target
execute as @a[tag=gm4_sf_target] run tag @s add gm4_sf_linked
execute unless entity @a[tag=gm4_sf_target,distance=..17] as @a[gamemode=!spectator,distance=..6.5,limit=1] if predicate gm4_soul_fragments:soul_lantern/in_mainhand unless predicate gm4_soul_fragments:soul_in_a_lantern/in_mainhand run tag @s add gm4_sf_target
execute unless entity @a[tag=gm4_sf_target,distance=..17] as @a[gamemode=!spectator,distance=..6.5,limit=1] if predicate gm4_soul_fragments:soul_lantern/in_offhand unless predicate gm4_soul_fragments:soul_in_a_lantern/in_offhand run tag @s add gm4_sf_target

# move towards target
execute if entity @a[tag=gm4_sf_target,distance=..16,limit=1] run function gm4_soul_fragments:soul_fragment/seek_target

# emit particles and hum if revealed
execute as @s[scores={gm4_sf_fire=1..}] run function gm4_soul_fragments:soul_fragment/appear

# remove target tags
tag @a remove gm4_sf_linked
tag @a remove gm4_sf_target
