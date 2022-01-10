# @s = armor_stand to be modified
# at @s
# run from pose/select

# head
summon minecraft:area_effect_cloud ~ ~.75 ~ {Radius:.08f,Tags:["gm4_bas_head"]}

# arms
execute positioned ~ ~.3 ~ run summon minecraft:area_effect_cloud ^.2 ^ ^ {Radius:.1f,Tags:["gm4_bas_left_arm"]}
execute positioned ~ ~.3 ~ run summon minecraft:area_effect_cloud ^-.2 ^ ^ {Radius:.1f,Tags:["gm4_bas_right_arm"]}
