
tag @s add gm4_sr_parried

playsound minecraft:item.shield.block player @a ~ ~ ~ 1 1.5
stopsound @s player minecraft:entity.player.hurt

# advancements
advancement grant @s only gm4:survival_refightalized_parry
execute store result score $lethal_damage gm4_sr_data run attribute @s armor get 10
scoreboard players operation $lethal_damage gm4_sr_data += @s gm4_sr_stat.current_health
execute if score @s gm4_sr_stat.damage_resisted >= $lethal_damage gm4_sr_data run advancement grant @s only gm4:survival_refightalized_parry_lethal_damage

# stop attacker for a bit
tag @s add gm4_sr_parrier
execute on attacker run function gm4_survival_refightalized:player/damage/shield/parry_effect
tag @s remove gm4_sr_parrier

# dev damage log
tellraw @s[tag=gm4_sr_dev] {"text":"Parry","color":"dark_gray"}

# cleanup
scoreboard players reset @s gm4_sr_stat.damage_resisted
