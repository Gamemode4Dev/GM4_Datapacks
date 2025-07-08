# @s = armor_stand to be modified
# at @s
# run from pose/select and default/part

# base
summon minecraft:area_effect_cloud ~ ~-.25 ~ {Radius:.2f,Tags:["gm4_bas_base"],Duration:0,WaitTime:2,custom_particle:{type:"minecraft:item",item:"minecraft:armor_stand"}}

# head
summon minecraft:area_effect_cloud ~ ~.75 ~ {Radius:.08f,Tags:["gm4_bas_head"],Duration:0,WaitTime:2,custom_particle:{type:"minecraft:item",item:"minecraft:armor_stand"}}

# body
summon minecraft:area_effect_cloud ~ ~.25 ~ {Radius:.09f,Tags:["gm4_bas_body"],Duration:0,WaitTime:2,custom_particle:{type:"minecraft:item",item:"minecraft:armor_stand"}}

# arms
execute positioned ~ ~.3 ~ run summon minecraft:area_effect_cloud ^.18 ^ ^ {Radius:.09f,Tags:["gm4_bas_left_arm"],Duration:0,WaitTime:2,custom_particle:{type:"minecraft:item",item:"minecraft:armor_stand"}}
execute positioned ~ ~.3 ~ run summon minecraft:area_effect_cloud ^-.18 ^ ^ {Radius:.09f,Tags:["gm4_bas_right_arm"],Duration:0,WaitTime:2,custom_particle:{type:"minecraft:item",item:"minecraft:armor_stand"}}

# legs
summon minecraft:area_effect_cloud ^.1 ^ ^ {Radius:.1f,Tags:["gm4_bas_left_leg"],Duration:0,WaitTime:2,custom_particle:{type:"minecraft:item",item:"minecraft:armor_stand"}}
summon minecraft:area_effect_cloud ^-.1 ^ ^ {Radius:.1f,Tags:["gm4_bas_right_leg"],Duration:0,WaitTime:2,custom_particle:{type:"minecraft:item",item:"minecraft:armor_stand"}}
