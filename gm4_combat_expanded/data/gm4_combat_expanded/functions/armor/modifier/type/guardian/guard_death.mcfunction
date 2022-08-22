# kill the guardian if they took damage exceeding their health
# @s = player that died while guarding
# at world spawn
# run from armor/type/guardian/damage_calc

# advancement
advancement grant @s only gm4:combat_expanded_guardian

# display custom death message if death messages are on
execute store result score $death_messages gm4_ce_data run gamerule showDeathMessages
gamerule showDeathMessages false
execute if score $death_messages gm4_ce_data matches 1 at @s run tellraw @a {"translate":"%1$s%3427655$s","with":[["",{"selector":"@s"}," gave their life for ",{"selector":"@p[gamemode=!spectator,gamemode=!creative,distance=0.01..]"}],{"translate":"death.gm4.combat_expanded.guarding","with":[{"selector":"@s"},{"selector":"@p[gamemode=!spectator,gamemode=!creative,distance=0.01..]"}]}]}
kill @s
execute if score $death_messages gm4_ce_data matches 1 run gamerule showDeathMessages true
