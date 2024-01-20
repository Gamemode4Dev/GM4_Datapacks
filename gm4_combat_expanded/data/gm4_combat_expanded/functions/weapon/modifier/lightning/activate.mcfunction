# find entities hit
# @s = player wielding the weapon
# at @s
# run from weapon/check_modifier

execute anchored eyes positioned ^ ^ ^3 as @e[distance=..5,team=!gm4_ce_team_check,type=!armor_stand,tag=!gm4_cd_delay_active,nbt={HurtTime:10s},tag=!smithed.strict] run function gm4_combat_expanded:weapon/modifier/lightning/add_score
