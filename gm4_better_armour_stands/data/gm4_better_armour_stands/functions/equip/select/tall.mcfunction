# @s = armor_stand to be modified
# at @s
# run from pose/select

# head
summon minecraft:area_effect_cloud ~ ~1.5 ~ {Radius:.1f,Tags:["gm4_bas_head"]}

# arms
execute positioned ~ ~1 ~ run summon minecraft:area_effect_cloud ^.3 ^ ^ {Radius:.15f,Tags:["gm4_bas_left_arm"]}
execute positioned ~ ~1 ~ run summon minecraft:area_effect_cloud ^-.3 ^ ^ {Radius:.15f,Tags:["gm4_bas_right_arm"]}
