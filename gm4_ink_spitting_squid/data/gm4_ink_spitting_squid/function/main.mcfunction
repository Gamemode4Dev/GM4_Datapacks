execute at @e[type=squid,tag=!smithed.entity] as @a[gamemode=!spectator,distance=..3] at @s anchored eyes positioned ^ ^ ^ if predicate gm4_ink_spitting_squid:inkable run function gm4_ink_spitting_squid:squid_squirt
execute at @e[type=glow_squid,tag=!smithed.entity] as @a[gamemode=!spectator,distance=..3] at @s anchored eyes positioned ^ ^ ^ if predicate gm4_ink_spitting_squid:inkable run function gm4_ink_spitting_squid:glow_squid_squirt

schedule function gm4_ink_spitting_squid:main 16t
