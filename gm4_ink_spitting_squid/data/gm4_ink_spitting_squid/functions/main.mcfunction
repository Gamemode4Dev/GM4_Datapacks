execute at @e[type=squid] as @a[gamemode=!spectator,distance=..3] at @s positioned ^ ^ ^ if block ~ ~ ~ water run function gm4_ink_spitting_squid:squid_squirt

schedule function gm4_ink_spitting_squid:main 16t
