# kill player in dead link
# @s = player in link to kill
# at unspecified
# run from armor/modifier/type/link/process/death


# display custom death message if death messages are on
execute store result score $death_messages gm4_ce_data run gamerule showDeathMessages
gamerule showDeathMessages false
execute if score $death_messages gm4_ce_data matches 1 if score $killed_player_count gm4_ce_data matches 0 at @s run tellraw @a {"translate":"death.gm4.combat_expanded.link_0","fallback":"%s followed eachother to their death","with":[{"selector":"@a[tag=gm4_ce_link.process]"}]}
execute if score $death_messages gm4_ce_data matches 1 if score $killed_player_count gm4_ce_data matches 1 at @s run tellraw @a {"translate":"death.gm4.combat_expanded.link_1","fallback":"%s followed %s to their death","with":[{"selector":"@s"},{"selector":"@p[tag=gm4_ce_link.killed]"}]}
execute if score $death_messages gm4_ce_data matches 1 if score $killed_player_count gm4_ce_data matches 2.. at @s run tellraw @a {"translate":"death.gm4.combat_expanded.link_2+","fallback":"%s followed %s and %s to their deaths","with":[{"selector":"@s"},{"selector":"@a[tag=gm4_ce_link.killed,tag=!gm4_ce_link.killed_2]"},{"selector":"@a[tag=gm4_ce_link.killed_2]"}]}
execute if score $killed_player_count gm4_ce_data matches 0 run scoreboard players set $killed_player_count gm4_ce_data -1
kill @s
execute if score $death_messages gm4_ce_data matches 1 run gamerule showDeathMessages true
