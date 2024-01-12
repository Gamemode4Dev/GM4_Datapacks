# custom death message from players that die from link armor
# @s = player that died
# at @s
# run from armor/modifier/type/link/process/damage_taken

# display custom death message if death messages are on
execute store result score $death_messages gm4_ce_data run gamerule showDeathMessages
gamerule showDeathMessages false
execute if score $death_messages gm4_ce_data matches 1 at @s run tellraw @a {"translate":"death.gm4.combat_expanded.link","fallback":"%s followed %s to their death","with":[{"selector":"@s"},{"selector":"@p[tag=gm4_ce_target]"}]}
kill @s
execute if score $death_messages gm4_ce_data matches 1 run gamerule showDeathMessages true
