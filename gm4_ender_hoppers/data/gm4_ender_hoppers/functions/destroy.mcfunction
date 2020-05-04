# @s = ender_hopper (gm4_ender_hopper or gm4_ender_hoppers_display) armor_stand
# run from process or main

particle explosion ~ ~0.5 ~
summon area_effect_cloud ~ ~ ~ {Passengers:[{id:item,Item:{id:ender_eye,Count:1}},{id:item,Item:{id:iron_block,Count:4}},{id:item,Item:{id:diamond_block,Count:1}},{id:item,Item:{id:ender_pearl,Count:4}}]}
kill @s
