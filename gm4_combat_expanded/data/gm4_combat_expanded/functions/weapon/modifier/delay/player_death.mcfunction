# custom death message from players that die from delayed damage
# @s = player that died
# at @s
# run from weapon/modifier/delay/explode_player

# display custom death message if death messages are on
execute store result score $death_messages gm4_ce_data run gamerule showDeathMessages
gamerule showDeathMessages false
execute if score $death_messages gm4_ce_data matches 1 at @s run tellraw @a {"translate":"death.gm4.combat_expanded.delay","fallback":"%s discovered the danger of resonance","with":[{"selector":"@s"}]}
kill @s
execute if score $death_messages gm4_ce_data matches 1 run gamerule showDeathMessages true
