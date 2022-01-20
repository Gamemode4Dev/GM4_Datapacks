# @s = armor_stand to be modified
# at @s
# run from pose/select, equip/select, default/part

# base
summon minecraft:area_effect_cloud ~ ~-.25 ~ {Radius:.21f,Tags:["gm4_bas_base"]}

# head
summon minecraft:area_effect_cloud ~ ~.75 ~ {Radius:.08f,Tags:["gm4_bas_part","gm4_bas_head"]}

# body
summon minecraft:area_effect_cloud ~ ~.3 ~ {Radius:.08f,Tags:["gm4_bas_part","gm4_bas_body"]}

# arms
execute positioned ~ ~.3 ~ run summon minecraft:area_effect_cloud ^.2 ^ ^ {Radius:.1f,Tags:["gm4_bas_part","gm4_bas_left_arm"]}
execute positioned ~ ~.3 ~ run summon minecraft:area_effect_cloud ^-.2 ^ ^ {Radius:.1f,Tags:["gm4_bas_part","gm4_bas_right_arm"]}

# legs
execute positioned ~ ~ ~ run summon minecraft:area_effect_cloud ^.1 ^ ^ {Radius:.101f,Tags:["gm4_bas_part","gm4_bas_left_leg"]}
execute positioned ~ ~ ~ run summon minecraft:area_effect_cloud ^-.1 ^ ^ {Radius:.101f,Tags:["gm4_bas_part","gm4_bas_right_leg"]}
