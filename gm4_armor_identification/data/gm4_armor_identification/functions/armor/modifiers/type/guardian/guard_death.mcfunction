# run from armor/active/guardian/damage_calc
# @s = player that died while guarding


# display custom death message if death messages are on
execute store result score $death_messages gm4_ai_data run gamerule showDeathMessages
gamerule showDeathMessages false
execute if score $death_messages gm4_ai_data matches 1 at @s run tellraw @a [{"selector":"@s","color":"white"},{"text":" gave their life for ","color":"white"},{"selector":"@p[gamemode=!spectator,gamemode=!creative,distance=0.01..]","color":"white"}]
kill @s
execute if score $death_messages gm4_ai_data matches 1 run gamerule showDeathMessages true
