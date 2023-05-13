# find entities hit with the heal weapon
# @s = player wielding the weapon
# at @s
# run from weapon/check_modifier

# get item level
execute store result score $level gm4_ce_data run data get storage gm4_combat_expanded:temp tag.gm4_combat_expanded.level

# find entities hit
execute anchored eyes positioned ^ ^ ^2.5 as @e[distance=..2.4,team=!gm4_ce_team_check,type=!armor_stand,nbt={HurtTime:10s},tag=!smithed.strict] at @s run function gm4_combat_expanded:weapon/modifier/heal/heal
