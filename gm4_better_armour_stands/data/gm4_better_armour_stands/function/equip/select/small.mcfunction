# @s = armor_stand to be modified
# at @s
# run from equip/select

# head
summon minecraft:area_effect_cloud ~ ~.45 ~ {Radius:.08f,Tags:["gm4_bas_head"],Duration:0,WaitTime:2,custom_particle:{type:"minecraft:item",item:"minecraft:armor_stand"}}

# arms
summon minecraft:area_effect_cloud ^.18 ^ ^ {Radius:.09f,Tags:["gm4_bas_left_arm"],Duration:0,WaitTime:2,custom_particle:{type:"minecraft:item",item:"minecraft:armor_stand"}}
summon minecraft:area_effect_cloud ^-.18 ^ ^ {Radius:.09f,Tags:["gm4_bas_right_arm"],Duration:0,WaitTime:2,custom_particle:{type:"minecraft:item",item:"minecraft:armor_stand"}}
