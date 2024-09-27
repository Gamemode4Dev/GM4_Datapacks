# stop regen when player gets damaged
# @s = damaged player
# at @s
# run from tick

# prep scores
function gm4_survival_refightalized:player/health/calculate_hp
scoreboard players set $damage_armor gm4_sr_data 0
scoreboard players set $damage_absorption gm4_sr_data 0
scoreboard players set $damage_health gm4_sr_data 0
scoreboard players set $damage_total gm4_sr_data 0

# disable shield if damage was blocked, don't run the rest of this function
execute if entity @s[advancements={gm4_survival_refightalized:damaged={blocked_by_shield=true}}] run return run function gm4_survival_refightalized:player/health/damaged/shield_blocked

# cave spider poison reduction
execute if entity @s[advancements={gm4_survival_refightalized:damaged={cave_spider=true}}] run function gm4_survival_refightalized:player/health/damaged/cave_spider_poison_reduction

# dev damage log
tellraw @s[tag=gm4_sr_dev] {"text":"-- Damage Log --"}
tellraw @s[tag=gm4_sr_dev,advancements={gm4_survival_refightalized:damaged={combat_damage=false}}] {"text":"Non-Combat Damage","color":"dark_gray","italic":true}
execute unless score @s gm4_sr_damage_resisted matches 1.. run tellraw @s[tag=gm4_sr_dev] [{"text":"No Armor - Damage (x10): ","color":"gray"},{"score":{"name":"@s","objective":"gm4_sr_damage_taken"},"color":"white"}]

# calculate damage if player has armor
execute if score @s gm4_sr_damage_resisted matches 1.. run function gm4_survival_refightalized:player/health/damaged/calculate_reduction

# set combat regeneration timers, allow to be altered by function call
scoreboard players operation $set gm4_sr_armor_reduction_timer = $armor_recharge_timer gm4_sr_config
scoreboard players operation $set gm4_sr_combat_regen_timer = $combat_regen_timer gm4_sr_config

# function call
# called after damage is calculated but before it is applied (unless there was no armor, then it is applied before)
function #gm4_survival_refightalized:damage_taken

# divide the damage taken between armor, absorption and health
execute if score @s gm4_sr_damage_resisted matches 1.. run function gm4_survival_refightalized:player/health/damaged/calculate_damage

# apply armor recharge timer, halved if damage was non-combat, 0 if damage did not apply to armor
execute if entity @s[advancements={gm4_survival_refightalized:damaged={combat_damage=false}}] run scoreboard players operation $set gm4_sr_armor_reduction_timer /= #2 gm4_sr_data
execute if score $damage_armor gm4_sr_data matches 1.. run scoreboard players operation @s gm4_sr_armor_reduction_timer > $set gm4_sr_armor_reduction_timer
# apply durability damage to armor unless it was armor piercing damage
execute if entity @s[advancements={gm4_survival_refightalized:damaged={armor_piercing=false,armor_piercing_mob=false}}] run function gm4_survival_refightalized:player/armor_durability/check

# apply health regeneration timer, max 50 if damage was non-combat, 0 if damage did not apply to health
execute if entity @s[advancements={gm4_survival_refightalized:damaged={combat_damage=false}}] run scoreboard players operation $set gm4_sr_combat_regen_timer < #50 gm4_sr_data
execute if score $damage_health gm4_sr_data matches 1.. run scoreboard players operation @s gm4_sr_combat_regen_timer > $set gm4_sr_combat_regen_timer
# out-of-combat damage regenerates rapidly (every 1.6 seconds)
scoreboard players operation @s gm4_sr_damage_taken += @s gm4_sr_damage_absorbed
scoreboard players add @s gm4_sr_damage_taken 5
scoreboard players operation @s gm4_sr_damage_taken /= #10 gm4_sr_data
scoreboard players operation @s gm4_sr_damage_taken += $damage_health gm4_sr_data
scoreboard players operation @s[advancements={gm4_survival_refightalized:damaged={combat_damage=false}}] gm4_sr_fast_regen_health += @s gm4_sr_damage_taken
scoreboard players reset @s gm4_sr_damage_taken
scoreboard players reset @s gm4_sr_damage_absorbed
scoreboard players set @s gm4_sr_fast_regen_timer 2

# cleanup
scoreboard players reset @s gm4_sr_damage_resisted
advancement revoke @s only gm4_survival_refightalized:damaged
data remove storage gm4_survival_refightalized:temp active_effects
data remove storage gm4_survival_refightalized:temp set
