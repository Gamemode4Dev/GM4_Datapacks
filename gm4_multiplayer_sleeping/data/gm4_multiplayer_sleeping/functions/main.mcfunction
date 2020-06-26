scoreboard players enable @a gm4_sleep_kick
execute as @a[scores={gm4_sleep_kick=1..}] run function gm4_multiplayer_sleeping:kick_bed

#Bed Check
execute as @a[nbt={SleepTimer:0s},tag=gm4_in_bed] run function gm4_multiplayer_sleeping:exit_bed
execute as @a[tag=!gm4_in_bed] if data entity @s SleepingX run function gm4_multiplayer_sleeping:enter_bed

execute store result score value_daytime gm4_sleep_count run time query daytime

schedule function gm4_multiplayer_sleeping:main 16t
