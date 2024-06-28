
scoreboard players operation $health_change gm4_ce_data = @s gm4_ce_damage_resisted

data modify storage gm4_combat_expanded:temp player_effects set from entity @s active_effects

# enchantments

# effects



# cleanup
data remove storage gm4_combat_expanded:temp player_effects

# ----
# divide by 10 to get half-hearts
scoreboard players operation $health_change gm4_ce_data /= #10 gm4_ce_data
# can't reduce more armor than the player has
scoreboard players operation $remove_armor gm4_ce_data = $health_change gm4_ce_data
scoreboard players operation $remove_armor gm4_ce_data < @s gm4_ce_armor
# if damage pierces armor apply only to health
execute if score $armor_piercing gm4_ce_data matches 1 run scoreboard players set $remove_armor gm4_ce_data 0
# any leftover damage is applied to the players health
scoreboard players operation $health_change gm4_ce_data -= $remove_armor gm4_ce_data

# apply damage to health
execute if score $health_change gm4_ce_data matches 1.. run function gm4_combat_expanded:player/health/damage/activate

# apply damage to armor if needed
execute unless score $remove_armor gm4_ce_data matches 1.. run return 0
execute store result storage gm4_combat_expanded:temp set.armor_reduction int 1 run scoreboard players operation @s gm4_ce_armor_reduced += $remove_armor gm4_ce_data
attribute @s generic.armor modifier remove gm4_ce_armor_reduced
function gm4_combat_expanded:player/health/eval_armor_reduction with storage gm4_combat_expanded:temp set
data remove storage gm4_combat_expanded:temp set
