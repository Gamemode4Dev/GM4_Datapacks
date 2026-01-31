# kill the player if they get reduced to 0 health
# @s = player to damage
# at unspecified
# run from player/health/reduce/activate

# check if player is holding item with death_protection component
execute if items entity @s weapon.* *[death_protection] run return run function gm4_survival_refightalized:player/health/reduce/death_protection

tellraw @s[tag=gm4_sr_dev.damage_log] [{"text":"Custom Death Message:","color":"gray"}]

# kill player with custom death message
execute store result score $showDeathMessages gm4_sr_data run gamerule show_death_messages
gamerule show_death_messages false
kill @s
execute if score $showDeathMessages gm4_sr_data matches 1 run tellraw @a ["",{"selector":"@s"},{"translate":"text.gm4.survival_refightalized.death","fallback":" ran out of health"}]
execute if score $showDeathMessages gm4_sr_data matches 1 run gamerule show_death_messages true
