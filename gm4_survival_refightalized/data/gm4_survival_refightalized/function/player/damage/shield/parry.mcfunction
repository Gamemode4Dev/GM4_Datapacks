
function gm4_survival_refightalized:player/damage/shield/remove_using

playsound minecraft:item.shield.block player @a ~ ~ ~ 1 1.5
stopsound @s player minecraft:entity.player.hurt

# advancements
advancement grant @s only gm4:survival_refightalized_parry
scoreboard players operation $lethal_damage gm4_sr_data = @s gm4_sr_stat.armor
scoreboard players operation $lethal_damage gm4_sr_data += @s gm4_sr_stat.current_health
scoreboard players operation $lethal_damage gm4_sr_data *= #10 gm4_sr_data
execute if score @s gm4_sr_stat.damage_resisted >= $lethal_damage gm4_sr_data run advancement grant @s only gm4:survival_refightalized_parry_lethal_damage

# stop attacker for a bit
execute on attacker run function gm4_survival_refightalized:player/damage/shield/parry_effect

# dev damage log
tellraw @s[tag=gm4_sr_dev] {"text":"Parry","color":"dark_gray"}

# cleanup
scoreboard players reset @s gm4_sr_stat.damage_resisted
