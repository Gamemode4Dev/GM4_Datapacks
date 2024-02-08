# check if armor should activate
# @s = player being checked
# at unspecified
# run from armor/check_modifier/safety

# activate attributes if player is safe
execute unless score $active gm4_ce_data matches 1 unless score @s gm4_ce_natural_regen_damage matches 1.. run function gm4_combat_expanded:armor/modifier/type/focus/safe

# activate attributes if player is unsafe
execute unless score $active gm4_ce_data matches -1 if score @s gm4_ce_natural_regen_damage matches 1.. run function gm4_combat_expanded:armor/modifier/type/focus/unsafe

# grant glowing to nearby mobs if active
execute if score $active gm4_ce_data matches 1 run effect give @e[tag=!smithed.strict,distance=..16] glowing 2 0 true
