execute at @e[type=squid] as @a[gamemode=!spectator,distance=..3] at @s anchored eyes positioned ^ ^ ^ if block ~ ~ ~ #gm4:water run function gm4_ink_spitting_squid:squid_squirt
execute at @e[type=squid] as @a[gamemode=!spectator,distance=..3] at @s anchored eyes positioned ^ ^ ^ if block ~ ~ ~ #gm4:waterloggable[waterlogged=true] run function gm4_ink_spitting_squid:squid_squirt

schedule function gm4_ink_spitting_squid:main 16t
