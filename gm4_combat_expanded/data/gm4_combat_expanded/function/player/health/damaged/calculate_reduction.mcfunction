
scoreboard players operation $damage_health gm4_ce_data = @s gm4_ce_damage_resisted

# | Reduce damage taken based on
# armor toughness (only if player still has armor)
execute store result score $armor_toughness gm4_ce_data run attribute @s generic.armor_toughness get
execute if score $armor_toughness gm4_ce_data matches 1.. if score @s gm4_ce_armor matches 1.. run function gm4_combat_expanded:player/health/damaged/armor_toughness

# enchantments
execute if entity @s[advancements={gm4_combat_expanded:damaged/detect={bypasses_enchantments=false}}] run function gm4_combat_expanded:player/health/damaged/enchantments

# resistance effect (uses highest level besides the one used for this module)
execute store success score $resistance_damage_reduction gm4_ce_data if data entity @s active_effects[{id:"minecraft:resistance"}].hidden_effect.duration
execute if score $resistance_damage_reduction gm4_ce_data matches 1 store result score $resistance_damage_reduction gm4_ce_data run data get entity @s active_effects[{id:"minecraft:resistance"}].hidden_effect.amplifier 20
# if damage reduction from resistance is 100% no need to run the rest of this function
execute unless score $resistance_damage_reduction gm4_ce_data matches 0..99 run return 0
scoreboard players operation $resistance_damage_reduction gm4_ce_data *= $damage_health gm4_ce_data
scoreboard players operation $resistance_damage_reduction gm4_ce_data /= #100 gm4_ce_data
scoreboard players operation $damage_health gm4_ce_data -= $resistance_damage_reduction gm4_ce_data

# | Convert to scores
# add 5 and divide by 10 to round to half-hearts, make sure at least 1 damage is dealt
scoreboard players add $damage_health gm4_ce_data 5
scoreboard players operation $damage_health gm4_ce_data /= #10 gm4_ce_data
scoreboard players operation $damage_health gm4_ce_data > #1 gm4_ce_data
# can't reduce more armor than the player has
scoreboard players operation $damage_armor gm4_ce_data = $damage_health gm4_ce_data
scoreboard players operation $damage_armor gm4_ce_data < @s gm4_ce_armor
# if damage pierces armor apply only to health
execute unless entity @s[advancements={gm4_combat_expanded:damaged/detect={armor_piercing=false,armor_piercing_mob=false}}] run scoreboard players set $damage_armor gm4_ce_data 0
# any leftover damage is applied to the players health
scoreboard players operation $damage_health gm4_ce_data -= $damage_armor gm4_ce_data

# | Damage the player
# armor
attribute @s generic.armor modifier remove gm4_ce_armor_reduced
execute store result storage gm4_combat_expanded:temp set.armor_reduction int 1 run scoreboard players operation @s gm4_ce_armor_reduced += $damage_armor gm4_ce_data
execute if score @s gm4_ce_armor_reduced matches 1.. run function gm4_combat_expanded:player/health/eval_armor_reduction with storage gm4_combat_expanded:temp set
data remove storage gm4_combat_expanded:temp set

# stop running if all damage is dealt
execute unless score $damage_health gm4_ce_data matches 1.. run return 0
# absorption hearts
execute store result score $current_absorption_max gm4_ce_data run attribute @s generic.max_absorption get
execute store result score $current_absorption_hearts gm4_ce_data run data get entity @s AbsorptionAmount

scoreboard players operation $damage_absorption gm4_ce_data = $damage_health gm4_ce_data
scoreboard players operation $damage_absorption gm4_ce_data < $current_absorption_hearts gm4_ce_data
scoreboard players operation $damage_health gm4_ce_data -= $damage_absorption gm4_ce_data

scoreboard players operation $current_absorption_hearts gm4_ce_data -= $damage_absorption gm4_ce_data
execute store result storage gm4_combat_expanded:temp set.absorption_reduction int 1 run scoreboard players operation $current_absorption_max gm4_ce_data -= $current_absorption_hearts gm4_ce_data
execute if score $damage_absorption gm4_ce_data matches 1.. run function gm4_combat_expanded:player/health/damaged/eval_absorption_reduction with storage gm4_combat_expanded:temp set
data remove storage gm4_combat_expanded:temp set

# red hearts
execute if score $damage_health gm4_ce_data matches 1.. run function gm4_combat_expanded:player/health/reduce/activate
