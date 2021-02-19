# @s = player holding a soul in a lantern in mainhand whose linked player is nearby
# at @s
# from player/items/process_mainhand_soul

# summon soul fragment
summon area_effect_cloud ~ ~.2 ~ {Radius:0,Age:-2147483648,Duration:2147483647,CustomName:'"gm4_soul_fragment"',Tags:["gm4_soul_fragment","gm4_new_soul_fragment"],Particle:"block air"}
scoreboard players operation @e[type=minecraft:area_effect_cloud,tag=gm4_new_soul_fragment,limit=1,sort=nearest,distance=...3] gm4_sf_id = @s gm4_sf_m_id
tag @e[type=area_effect_cloud,tag=gm4_new_soul_fragment] remove gm4_new_soul_fragment

scoreboard players reset @s gm4_sf_m_timer

playsound minecraft:block.chorus_flower.grow player @a[distance=..16] ~ ~ ~ .9 1.5
particle minecraft:soul ~ ~1.5 ~ .2 0 .2 .03 5 normal

execute if predicate gm4_soul_fragments:count_one/in_mainhand run replaceitem entity @s weapon.mainhand minecraft:soul_lantern
#execute if predicate gm4_soul_fragments:count_one/in_mainhand run item entity @s weapon.mainhand replace minecraft:soul_lantern
execute unless predicate gm4_soul_fragments:count_one/in_mainhand run function gm4_soul_fragments:player/items/process_mainhand_stack
