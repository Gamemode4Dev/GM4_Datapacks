# update unburden armor
# @s = player wearing unburden armour
# at @s
# run from armor/check_modifier/type/unburden/check

# mark for change
scoreboard players set $change gm4_ce_data 1

# update the stored armor to not have to do this update until armor value changes
execute store result storage gm4_combat_expanded:temp tag.gm4_combat_expanded.stored_armor int 1 run scoreboard players get @s gm4_ce_armor

# calculate level of bonus movement speed and attack speed
execute store result score $level gm4_ce_data run data get storage gm4_combat_expanded:temp tag.gm4_combat_expanded.level 10
scoreboard players add $level gm4_ce_data 30
scoreboard players set $missing_armor gm4_ce_data 20
scoreboard players operation $missing_armor gm4_ce_data -= @s gm4_ce_armor
scoreboard players operation $level gm4_ce_data *= $missing_armor gm4_ce_data
execute store result storage gm4_combat_expanded:temp tag.AttributeModifiers[{Name:gm4_combat_expanded}].Amount float 0.001 run scoreboard players get $level gm4_ce_data
execute store result storage gm4_combat_expanded:temp tag.AttributeModifiers[{Name:gm4_combat_expanded_2}].Amount float 0.001 run scoreboard players get $level gm4_ce_data
