# custom death message from overload death
# @s = player that died
# run from armor/active/overload/activate

# display custom death message if death messages are on
execute store result score $death_messages gm4_ce_data run gamerule showDeathMessages
gamerule showDeathMessages false
execute if score $death_messages gm4_ce_data matches 1 at @s run tellraw @a [{"text":"","color":"white"},{"selector":"@s","color":"white"},{"text":" could not contain the power","color":"white"}]
kill @s
execute if score $death_messages gm4_ce_data matches 1 run gamerule showDeathMessages true
