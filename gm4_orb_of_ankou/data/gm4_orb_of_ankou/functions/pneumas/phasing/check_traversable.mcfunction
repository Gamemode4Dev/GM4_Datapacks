# @s = sneaking player with phasing pneuma
#located 2 blocks in front of the player's feet
# run from pneumas/sneak/check

execute at @s[y_rotation=-45..44,scores={gm4_oa_snk_num=3..},tag=!gm4_oa_phased] unless block ~ ~ ~1 #gm4:no_collision if block ~ ~ ~2 #gm4:no_collision positioned ~ ~ ~2 run function gm4_orb_of_ankou:pneumas/phasing/tp
execute at @s[y_rotation=45..134,scores={gm4_oa_snk_num=3..},tag=!gm4_oa_phased] unless block ~-1 ~ ~ #gm4:no_collision if block ~-2 ~ ~ #gm4:no_collision positioned ~-2 ~ ~ run function gm4_orb_of_ankou:pneumas/phasing/tp
execute at @s[y_rotation=135..224,scores={gm4_oa_snk_num=3..},tag=!gm4_oa_phased] unless block ~ ~ ~-1 #gm4:no_collision if block ~ ~ ~-2 #gm4:no_collision positioned ~ ~ ~-2 run function gm4_orb_of_ankou:pneumas/phasing/tp
execute at @s[y_rotation=225..314,scores={gm4_oa_snk_num=3..},tag=!gm4_oa_phased] unless block ~1 ~ ~ #gm4:no_collision if block ~2 ~ ~ #gm4:no_collision positioned ~2 ~ ~ run function gm4_orb_of_ankou:pneumas/phasing/tp

execute at @s[y_rotation=-45..44,scores={gm4_oa_snk_num=3..},tag=!gm4_oa_phased] unless block ~ ~1 ~1 #gm4:no_collision if block ~ ~ ~2 #gm4:no_collision positioned ~ ~ ~2 run function gm4_orb_of_ankou:pneumas/phasing/tp
execute at @s[y_rotation=45..134,scores={gm4_oa_snk_num=3..},tag=!gm4_oa_phased] unless block ~-1 ~1 ~ #gm4:no_collision if block ~-2 ~ ~ #gm4:no_collision positioned ~-2 ~ ~ run function gm4_orb_of_ankou:pneumas/phasing/tp
execute at @s[y_rotation=135..224,scores={gm4_oa_snk_num=3..},tag=!gm4_oa_phased] unless block ~ ~1 ~-1 #gm4:no_collision if block ~ ~ ~-2 #gm4:no_collision positioned ~ ~ ~-2 run function gm4_orb_of_ankou:pneumas/phasing/tp
execute at @s[y_rotation=225..314,scores={gm4_oa_snk_num=3..},tag=!gm4_oa_phased] unless block ~1 ~1 ~ #gm4:no_collision if block ~2 ~ ~ #gm4:no_collision positioned ~2 ~ ~ run function gm4_orb_of_ankou:pneumas/phasing/tp

tag @s remove gm4_oa_phased
