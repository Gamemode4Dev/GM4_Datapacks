schedule function gm4_dripleaf_launchers:tick 1t

# process players on dripleaf
execute as @a[gamemode=!spectator,tag=gm4_dl_on_dripleaf] at @s run function gm4_dripleaf_launchers:check
