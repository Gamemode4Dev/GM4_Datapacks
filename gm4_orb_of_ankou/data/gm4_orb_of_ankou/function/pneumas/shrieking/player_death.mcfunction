# @s = player who died from a sonic boom
# run from pneumas/shrieking/boom_player

execute store result score $show_death_messages gm4_pneuma_data run gamerule show_death_messages
gamerule show_death_messages false
tellraw @a {"translate":"death.attack.sonic_boom","with":[{"selector":"@s"}]}
kill @s
execute if score $show_death_messages gm4_pneuma_data matches 1 run gamerule show_death_messages true
scoreboard players reset $show_death_messages gm4_pneuma_data
