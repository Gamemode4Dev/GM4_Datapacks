# @s = player that received health, tagged with gm4_sh_revert_health
# at undefined
# run from delayed_revert

# revert max health
attribute @s minecraft:max_health modifier remove gm4_sweethearts:health_remove_512
attribute @s minecraft:max_health modifier remove gm4_sweethearts:health_remove_256
attribute @s minecraft:max_health modifier remove gm4_sweethearts:health_remove_128
attribute @s minecraft:max_health modifier remove gm4_sweethearts:health_remove_64
attribute @s minecraft:max_health modifier remove gm4_sweethearts:health_remove_32
attribute @s minecraft:max_health modifier remove gm4_sweethearts:health_remove_16
attribute @s minecraft:max_health modifier remove gm4_sweethearts:health_remove_8
attribute @s minecraft:max_health modifier remove gm4_sweethearts:health_remove_4
attribute @s minecraft:max_health modifier remove gm4_sweethearts:health_remove_2
attribute @s minecraft:max_health modifier remove gm4_sweethearts:health_remove_1

attribute @s minecraft:max_health modifier remove gm4_sweethearts:health_add_1

tag @s remove gm4_sh_revert_health
