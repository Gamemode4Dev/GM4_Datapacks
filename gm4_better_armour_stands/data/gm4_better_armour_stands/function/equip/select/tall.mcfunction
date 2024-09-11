# @s = armor_stand to be modified
# at @s
# run from equip/select

# head
summon minecraft:area_effect_cloud ~ ~.5 ~ {Radius:.1f,Tags:["gm4_bas_head"],Particle:{type:"minecraft:item",item:"minecraft:armor_stand"}}

# arms
summon minecraft:area_effect_cloud ^.3 ^ ^ {Radius:.15f,Tags:["gm4_bas_left_arm"],Particle:{type:"minecraft:item",item:"minecraft:armor_stand"}}
summon minecraft:area_effect_cloud ^-.3 ^ ^ {Radius:.15f,Tags:["gm4_bas_right_arm"],Particle:{type:"minecraft:item",item:"minecraft:armor_stand"}}
