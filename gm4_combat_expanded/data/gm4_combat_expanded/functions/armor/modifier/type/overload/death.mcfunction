# custom death message from overload death
# @s = player that died
# at world spawn
# run from armor/type/overload/activate

# display custom death message if death messages are on
execute store result score $death_messages gm4_ce_data run gamerule showDeathMessages
gamerule showDeathMessages false
execute if score $death_messages gm4_ce_data matches 1 at @s run tellraw @a {"translate":"%1$s%3427655$s","with":[["",{"selector":"@s"}," could not contain the power"],{"translate":"death.gm4.combat_expanded.overload","with":[{"selector":"@s"}]}]}
kill @s
execute if score $death_messages gm4_ce_data matches 1 run gamerule showDeathMessages true
