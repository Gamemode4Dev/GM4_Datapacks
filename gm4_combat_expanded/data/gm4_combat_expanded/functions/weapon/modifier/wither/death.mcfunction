# custom death message for player that died from wither self-damage
# @s = player that died 
# at unspecified
# run from weapon/modifier/wither/activate

# display custom death message if death messages are on
execute store result score $death_messages gm4_ce_data run gamerule showDeathMessages
gamerule showDeathMessages false
execute if score $death_messages gm4_ce_data matches 1 at @s run tellraw @a {"translate":"death.gm4.combat_expanded.wither","fallback":"%s could not control the power","with":[{"selector":"@s"}]}
kill @s
execute if score $death_messages gm4_ce_data matches 1 run gamerule showDeathMessages true
