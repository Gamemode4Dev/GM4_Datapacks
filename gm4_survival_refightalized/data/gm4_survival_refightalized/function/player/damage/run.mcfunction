# run when player gets damaged
# @s = damaged player
# at @s
# run from tick

# dev damage log
tellraw @s[tag=gm4_sr_dev.damage_log] {"text":"-- Damage Log --"}

# prep scores
function gm4_survival_refightalized:player/health/calculate_hp
scoreboard players set $damage_armor gm4_sr_data 0
scoreboard players set $damage_absorption gm4_sr_data 0
scoreboard players set $damage_health gm4_sr_data 0
scoreboard players set $damage_total gm4_sr_data 0

### TEMP - paper fix - damage resist score gets multiplied by 51.2, so we need to revert that or the player instantly dies
### this currently breaks if a player takes a multiple of 51.2 damage, but that should be rare enough
scoreboard players set #512 gm4_sr_data 512
execute if score $on_paper gm4_sr_data matches 1 run tellraw @s[tag=gm4_sr_dev.damage_log] {"text":"Paper Bug - divided damage by 51.2","color":"red","italic":true}
execute if score $on_paper gm4_sr_data matches 1 run scoreboard players operation @s gm4_sr_stat.damage_resisted *= #10 gm4_sr_data
execute if score $on_paper gm4_sr_data matches 1 run scoreboard players operation @s gm4_sr_stat.damage_resisted /= #512 gm4_sr_data

# disable shield if damage was blocked, don't run the rest of this function
execute unless score @s[scores={gm4_sr_shield.timer=1..2,gm4_sr_shield.use_ticks=1..},advancements={gm4_survival_refightalized:damaged={bypasses_shield=false}}] gm4_sr_stat.damage_taken matches 1.. unless score @s gm4_sr_stat.damage_absorbed matches 1.. run return run function gm4_survival_refightalized:player/damage/shield/blocked_damage

# cave spider / witch poison reduction
execute if entity @s[advancements={gm4_survival_refightalized:damaged={cave_spider=true}}] run function gm4_survival_refightalized:player/damage/cave_spider_poison_reduction
execute if entity @s[advancements={gm4_survival_refightalized:damaged={witch=true}}] run function gm4_survival_refightalized:player/damage/witch_poison_reduction

# dev damage log
tellraw @s[tag=gm4_sr_dev.damage_log,advancements={gm4_survival_refightalized:damaged={combat_damage=false}}] {"text":"Non-Combat Damage","color":"dark_gray","italic":true}

# calculate damage if player has armor
execute if score @s gm4_sr_stat.armor matches 1.. run function gm4_survival_refightalized:player/damage/calculate_reduction
execute unless score @s gm4_sr_stat.armor matches 1.. run tellraw @s[tag=gm4_sr_dev.damage_log] [{"text":"No Armor - Damage (x10): ","color":"gray"},{"score":{"name":"@s","objective":"gm4_sr_stat.damage_taken"},"color":"white"}]

# set combat regeneration timers, allow to be altered by function call
scoreboard players operation $set gm4_sr_armor.reduction_timer = $armor_recharge_timer gm4_sr_config
scoreboard players operation $set gm4_sr_health.regeneration_timer = $combat_regen_timer gm4_sr_config

# function call
# called after damage is calculated but before it is applied (unless there was no armor, then it is applied by the game)
function #gm4_survival_refightalized:damage_taken

# divide the damage taken between armor, absorption and health
execute if score $damage_total gm4_sr_data matches 1.. run function gm4_survival_refightalized:player/damage/calculate_damage

# apply armor recharge timer, /5 if damage was non-combat, 0 if damage did not apply to armor
execute if entity @s[advancements={gm4_survival_refightalized:damaged={combat_damage=false}}] run scoreboard players operation $set gm4_sr_armor.reduction_timer /= #5 gm4_sr_data
execute if score $damage_armor gm4_sr_data matches 1.. run scoreboard players operation @s gm4_sr_armor.reduction_timer > $set gm4_sr_armor.reduction_timer
# apply durability damage to armor unless it was armor piercing damage
execute if entity @s[advancements={gm4_survival_refightalized:damaged={armor_piercing=false,armor_piercing_mob=false}}] run function gm4_survival_refightalized:player/armor/durability/check

# apply health regeneration timer, use rapid_regen if damage was non-combat, 0 if damage did not apply to health
execute if entity @s[advancements={gm4_survival_refightalized:damaged={combat_damage=false}}] run scoreboard players operation $set gm4_sr_health.regeneration_timer = $rapid_regen_timer gm4_sr_config
execute if score $damage_health gm4_sr_data matches 1.. run scoreboard players operation @s gm4_sr_health.regeneration_timer > $set gm4_sr_health.regeneration_timer
scoreboard players operation @s[scores={gm4_sr_stat.damage_taken=1..}] gm4_sr_health.regeneration_timer > $set gm4_sr_health.regeneration_timer

# cleanup
scoreboard players reset @s gm4_sr_stat.damage_taken
scoreboard players reset @s gm4_sr_stat.damage_absorbed
scoreboard players reset @s gm4_sr_stat.damage_resisted
scoreboard players reset @s gm4_sr_stat.damage_blocked
advancement revoke @s only gm4_survival_refightalized:damaged
data remove storage gm4_survival_refightalized:temp active_effects
data remove storage gm4_survival_refightalized:temp set
