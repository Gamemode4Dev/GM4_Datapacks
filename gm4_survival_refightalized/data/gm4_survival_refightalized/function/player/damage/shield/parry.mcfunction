# shield parry
# @s = damaged player
# at @s
# run from player/damage/shield/blocked_damage

tag @s add gm4_sr_attack_parried

# advancements
advancement grant @s only gm4:survival_refightalized_parry
execute store result score $lethal_damage gm4_sr_data run attribute @s minecraft:armor get 10
scoreboard players operation $lethal_damage gm4_sr_data += @s gm4_sr_stat.current_health
scoreboard players operation $lethal_damage gm4_sr_data += @s gm4_sr_stat.current_absorption
execute if score @s gm4_sr_stat.damage_resisted >= $lethal_damage gm4_sr_data run advancement grant @s only gm4:survival_refightalized_parry_lethal_damage

# reset spam detection
scoreboard players set @s gm4_sr_shield.spam_detection 0

# stop attacker for a bit
tag @s add gm4_sr_parrier
execute on attacker run function gm4_survival_refightalized:player/damage/shield/parry_effect
tag @s remove gm4_sr_parrier

# dev damage log
tellraw @s[tag=gm4_sr_dev.damage_log] {"text":"Parry","color":"dark_gray"}

# cleanup
scoreboard players reset @s gm4_sr_stat.damage_resisted
scoreboard players reset @s gm4_sr_stat.damage_blocked
advancement revoke @s only gm4_survival_refightalized:damaged
