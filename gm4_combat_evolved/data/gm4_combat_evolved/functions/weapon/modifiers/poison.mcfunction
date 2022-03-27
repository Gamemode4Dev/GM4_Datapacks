# run from weapon/check_modifier
# @s = player wielding the weapon
# at @s

# get item level
execute store result score $level gm4_ce_data run data get storage gm4_combat_evolved:temp tag.gm4_combat_evolved.level

# poison entities hit
execute if score $level gm4_ce_data matches 1 anchored eyes positioned ^ ^ ^2.5 run effect give @e[distance=..2.4,team=!gm4_invalid,type=!armor_stand,nbt={HurtTime:10s},tag=!smithed.strict] poison 8 0
execute if score $level gm4_ce_data matches 2 anchored eyes positioned ^ ^ ^2.5 run effect give @e[distance=..2.4,team=!gm4_invalid,type=!armor_stand,nbt={HurtTime:10s},tag=!smithed.strict] poison 8 1
execute if score $level gm4_ce_data matches 3 anchored eyes positioned ^ ^ ^2.5 run effect give @e[distance=..2.4,team=!gm4_invalid,type=!armor_stand,nbt={HurtTime:10s},tag=!smithed.strict] poison 30 0
