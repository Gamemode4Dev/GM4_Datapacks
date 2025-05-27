# armor is reduced to 0
# @s = damaged player
# at @s
# run from player/damage/calculate_damage

playsound minecraft:entity.armor_stand.break player @a[distance=..8] ~ ~ ~ 0.66 0 0.5
function gm4_survival_refightalized:player/resistance/remove
function #gm4_survival_refightalized:armor_break

# set damage taken to the amount of armor remaining so it gets removed
scoreboard players operation $damage_armor gm4_sr_data = $player_armor gm4_sr_data
