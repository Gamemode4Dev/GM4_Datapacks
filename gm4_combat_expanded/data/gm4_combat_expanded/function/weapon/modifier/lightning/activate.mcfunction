# find entities hit
# @s = player wielding the weapon
# at @s
# run from weapon/check_modifier

tag @s add gm4_ce_self
execute anchored eyes positioned ^ ^ ^3 as @e[distance=..5,tag=!gm4_ce_self,team=!gm4_ce_team_check,type=!armor_stand,nbt={HurtTime:10s},tag=!smithed.strict] run function gm4_combat_expanded:weapon/modifier/lightning/add_score
tag @s remove gm4_ce_self
