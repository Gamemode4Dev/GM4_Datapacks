# @s = armor_stand to be modified
# at @s
# run from pose/select, equip/select, default/part

# base
summon minecraft:area_effect_cloud ~ ~-.4 ~ {Radius:.375f,Tags:["gm4_bas_base"]}

# head
summon minecraft:area_effect_cloud ~ ~1.5 ~ {Radius:.1f,Tags:["gm4_bas_head"]}

# body
summon minecraft:area_effect_cloud ~ ~1 ~ {Radius:.15f,Tags:["gm4_bas_body"]}

# arms
execute positioned ~ ~1 ~ run summon minecraft:area_effect_cloud ^.3 ^ ^ {Radius:.15f,Tags:["gm4_bas_left_arm"]}
execute positioned ~ ~1 ~ run summon minecraft:area_effect_cloud ^-.3 ^ ^ {Radius:.15f,Tags:["gm4_bas_right_arm"]}

# legs
execute positioned ~ ~.4 ~ run summon minecraft:area_effect_cloud ^.15 ^ ^ {Radius:.15f,Tags:["gm4_bas_left_leg"]}
execute positioned ~ ~.4 ~ run summon minecraft:area_effect_cloud ^-.15 ^ ^ {Radius:.15f,Tags:["gm4_bas_right_leg"]}
