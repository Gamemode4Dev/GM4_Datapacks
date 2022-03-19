# run from weapon/check_modifier
# @s = player wielding the weapon
# at @s

# get item level
execute store result score $level gm4_ce_data run data get storage gm4_combat_evolved:temp tag.gm4_combat_evolved.level

# find targets
execute anchored eyes positioned ^ ^ ^2 as @e[distance=..2.4,team=!gm4_invalid,type=!armor_stand,tag=!gm4_cd_delay_active,nbt={HurtTime:10s}] at @s run function gm4_combat_evolved:weapon/modifiers/delay/prime
