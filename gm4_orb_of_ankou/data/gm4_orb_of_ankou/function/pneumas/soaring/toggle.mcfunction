# @s = player with soaring pneuma that sneaked
# run from pneumas/sneak/check

tag @s[tag=gm4_oa_soaring_active] add gm4_oa_no_soaring
tag @s remove gm4_oa_soaring_active
tag @s[tag=!gm4_oa_no_soaring] add gm4_oa_soaring_active
tag @s remove gm4_oa_no_soaring
playsound minecraft:entity.ender_dragon.flap player @s[tag=gm4_oa_soaring_active] ~ ~ ~ 0.4 1.6
playsound minecraft:entity.player.small_fall player @s[tag=!gm4_oa_soaring_active] ~ ~ ~ 0.4 1.6
attribute @s[tag=gm4_oa_soaring_active] minecraft:fall_damage_multiplier modifier add gm4_orb_of_ankou:soaring_fall_protection -1024 add_value
attribute @s[tag=!gm4_oa_soaring_active] minecraft:gravity modifier remove gm4_orb_of_ankou:soaring_gravity

tag @s add gm4_oa_soaring_toggled
