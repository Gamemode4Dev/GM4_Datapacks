# @s = player who's died / soul tracker from angry soul fragment from a soul in a totem / soul in a totem on the ground near their linked player
# at @s
# from player/died or main or totem/release_fragment


# play visuals/sounds if called by totem or player
execute if entity @s[type=!minecraft:area_effect_cloud] run particle minecraft:soul ~ ~1.2 ~ .2 0 .2 .03 5 normal
execute if entity @s[type=!minecraft:area_effect_cloud] run playsound minecraft:block.chorus_flower.death player @a[distance=..16] ~ ~ ~ .9 2

# summon soul fragment
summon area_effect_cloud ~ ~.2 ~ {Radius:0,Age:-2147483648,CustomName:'"gm4_soul_fragment"',Tags:["gm4_soul_fragment","gm4_new_soul_fragment"],Particle:"block air"}
scoreboard players operation @e[type=minecraft:area_effect_cloud,tag=gm4_new_soul_fragment,distance=..1,limit=1] gm4_sf_id = @s gm4_sf_id
tag @e[type=area_effect_cloud,tag=gm4_soul_fragment] remove gm4_new_soul_fragment

# revert to regular totem if called by soul in a totem
execute if entity @s[type=item] run data remove entity @s Item.tag.CustomModelData
execute if entity @s[type=item] run data remove entity @s Item.tag.display
execute if entity @s[type=item] run data remove entity @s Item.tag.Enchantments
execute if entity @s[type=item] run data remove entity @s Item.tag.gm4_soul_fragments

# kill @s if called by gm4_sf_soul_tracker
execute if entity @s[type=area_effect_cloud] run kill @s

