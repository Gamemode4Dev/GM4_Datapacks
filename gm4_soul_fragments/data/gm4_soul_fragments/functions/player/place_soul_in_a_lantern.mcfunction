# @s = player who's placed a soul in a lantern
# at player's location
# from advancement place_soul_in_a_lantern

# set score m ID to lantern's (mainhand first, offhand if failed)
execute store result score @s gm4_sf_m_id run data get entity @s SelectedItem.tag.gm4_soul_fragments.id
execute if entity @s[scores={gm4_sf_m_id=0}] store result score @s gm4_sf_m_id run data get entity @s Inventory[{Slot:-106b}].tag.gm4_soul_fragments.id

# raycast
summon area_effect_cloud ~ ~ ~ {Tags:["gm4_sf_ray","gm4_sf_new_ray"]}
execute anchored eyes positioned ^ ^ ^ anchored feet run tp @e[tag=gm4_sf_ray,limit=1,sort=nearest] ^ ^ ^ ~ ~
scoreboard players operation @e[type=minecraft:area_effect_cloud,tag=gm4_sf_new_ray] gm4_sf_id = @s gm4_sf_m_id
execute as @e[tag=gm4_sf_new_ray,limit=1,sort=nearest] run tag @s remove gm4_sf_new_ray
execute as @e[tag=gm4_sf_ray,limit=1,sort=nearest] run function gm4_soul_fragments:player/ray/hit_block

scoreboard players reset @s gm4_sf_m_id

advancement revoke @s only gm4_soul_fragments:place_soul_in_a_lantern
