schedule function gm4_dripleaf_launchers:main 4t

# tag players on dripleaf (with no or partial tilt)
execute as @a[gamemode=!spectator] at @s[predicate=gm4_dripleaf_launchers:dripleaf_triggered] run tag @s add gm4_dl_on_dripleaf
