# @s = armor_stand to be modified
# at @s
# run from equip/select

# head
summon minecraft:area_effect_cloud ~ ~.45 ~ {Radius:.08f,Tags:["gm4_bas_head"],Particle:{type:"minecraft:item",item:"minecraft:armor_stand"}}

# arms
summon minecraft:area_effect_cloud ^.18 ^ ^ {Radius:.09f,Tags:["gm4_bas_left_arm"],Particle:{type:"minecraft:item",item:"minecraft:armor_stand"}}
summon minecraft:area_effect_cloud ^-.18 ^ ^ {Radius:.09f,Tags:["gm4_bas_right_arm"],Particle:{type:"minecraft:item",item:"minecraft:armor_stand"}}
