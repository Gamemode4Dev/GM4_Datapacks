# @s = armor_stand to be modified
# at @s
# run from pose/select and default/part

# base
summon minecraft:area_effect_cloud ~ ~-.25 ~ {Radius:.2f,Tags:["gm4_bas_base"],Particle:"item armor_stand"}

# head
summon minecraft:area_effect_cloud ~ ~.75 ~ {Radius:.08f,Tags:["gm4_bas_head"],Particle:"item armor_stand"}

# body
summon minecraft:area_effect_cloud ~ ~.25 ~ {Radius:.09f,Tags:["gm4_bas_body"],Particle:"item armor_stand"}

# arms
execute positioned ~ ~.3 ~ run summon minecraft:area_effect_cloud ^.18 ^ ^ {Radius:.09f,Tags:["gm4_bas_left_arm"],Particle:"item armor_stand"}
execute positioned ~ ~.3 ~ run summon minecraft:area_effect_cloud ^-.18 ^ ^ {Radius:.09f,Tags:["gm4_bas_right_arm"],Particle:"item armor_stand"}

# legs
summon minecraft:area_effect_cloud ^.1 ^ ^ {Radius:.1f,Tags:["gm4_bas_left_leg"],Particle:"item armor_stand"}
summon minecraft:area_effect_cloud ^-.1 ^ ^ {Radius:.1f,Tags:["gm4_bas_right_leg"],Particle:"item armor_stand"}
