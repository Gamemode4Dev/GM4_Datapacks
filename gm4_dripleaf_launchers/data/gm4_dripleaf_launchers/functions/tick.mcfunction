schedule function gm4_dripleaf_launchers:tick 1t

execute as @a[gamemode=!spectator,tag=gm4_dl_on_dripleaf] at @s run function gm4_dripleaf_launchers:check

scoreboard players add @e[type=snowball,tag=gm4_dl_launch] gm4_dl_data 1
execute as @e[type=snowball,tag=gm4_dl_launch,scores={gm4_dl_data=2}] on passengers run title @s actionbar ""
kill @e[type=snowball,tag=gm4_dl_launch,scores={gm4_dl_data=18..}]
