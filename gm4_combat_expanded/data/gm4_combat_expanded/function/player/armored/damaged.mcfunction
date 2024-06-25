advancement revoke @s only gm4_combat_expanded:damaged/while_armored

scoreboard players operation $armor_reduction gm4_ce_data = @s gm4_ce_damage_resisted

data modify storage gm4_combat_expanded:temp player_effects set from entity @s active_effects

# enchantments

# effects

# can't reduce more armor than the player has
scoreboard players operation $armor_reduction gm4_ce_data /= #10 gm4_ce_data
scoreboard players operation $armor_reduction gm4_ce_data < @s gm4_ce_armor

# apply the damage
execute store result storage gm4_combat_expanded:temp set.armor_reduction int 1 run scoreboard players operation @s gm4_ce_armor_reduced += $armor_reduction gm4_ce_data
attribute @s generic.armor modifier remove gm4_ce_armor_reduced
function gm4_combat_expanded:player/armored/eval_armor_reduction with storage gm4_combat_expanded:temp set
data remove storage gm4_combat_expanded:temp set


# any leftover damage is applied to the players health
scoreboard players operation @s gm4_ce_damage_resisted -= $armor_reduction gm4_ce_data

say reduced armor

scoreboard players reset @s gm4_ce_damage_resisted
