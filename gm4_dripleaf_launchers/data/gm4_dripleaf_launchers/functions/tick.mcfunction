schedule function gm4_dripleaf_launchers:tick 1t

# levitation effect lasts ticks equal to score set
effect clear @a[scores={gm4_dl_data=1}] levitation
scoreboard players remove @a[scores={gm4_dl_data=1..}] gm4_dl_data 1

# process players on dripleaf
execute as @a[gamemode=!spectator,tag=gm4_dl_on_dripleaf] at @s run function gm4_dripleaf_launchers:check
