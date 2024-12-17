# kill the player if they get reduced to 0 health
# @s = player to damage
# at unspecified
# run from player/health/reduced/activate

execute if predicate gm4_survival_refightalized:technical/holding_totem_of_undying run return run function gm4_survival_refightalized:player/health/reduce/totem_of_undying

tellraw @s[tag=gm4_sr_dev] [{"text":"Custom Death Message:","color":"gray"}]

# kill player with custom death message
execute store result score $death_messages gm4_sr_data run gamerule showDeathMessages
gamerule showDeathMessages false
kill @s
tellraw @a ["",{"selector":"@s"},{"translate":"text.gm4.survival_refightalized.death","fallback":" ran out of health"}]
execute if score $death_messages gm4_sr_data matches 1 run gamerule showDeathMessages true
