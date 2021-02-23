# @s = player holding a soul in a lantern in mainhand whose linked player is nearby
# at @s
# from player/items/process_mainhand_soul

function gm4_soul_fragments:player/spawn_fragment
scoreboard players operation @e[type=minecraft:area_effect_cloud,tag=gm4_new_soul_fragment,limit=1,sort=nearest,distance=...3] gm4_sf_id = @s gm4_sf_m_id
tag @e[type=area_effect_cloud,tag=gm4_new_soul_fragment] remove gm4_new_soul_fragment

scoreboard players reset @s gm4_sf_m_timer

execute if predicate gm4_soul_fragments:count_one/in_mainhand run replaceitem entity @s weapon.mainhand minecraft:soul_lantern
#execute if predicate gm4_soul_fragments:count_one/in_mainhand run item entity @s weapon.mainhand replace minecraft:soul_lantern
execute unless predicate gm4_soul_fragments:count_one/in_mainhand run function gm4_soul_fragments:player/items/process_mainhand_stack
