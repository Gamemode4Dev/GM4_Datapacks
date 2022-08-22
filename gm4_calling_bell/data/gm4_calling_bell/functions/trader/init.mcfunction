# summon a wandering trader for the playter
# @s = player, tag=gm4_calling_bell_bell_ringer
# at @s
# run from bell/ring

# give 2s delay for bell summoning
scoreboard players add @s gm4_calling_bell 2

# ray cast to bell
summon marker ~ ~ ~ {Tags:["gm4_calling_bell_ray"]}
execute as @a[limit=1,tag=gm4_calling_bell_bell_ringer] anchored eyes positioned ^ ^ ^ anchored feet run tp @e[type=marker,tag=gm4_calling_bell_ray,limit=1] ^ ^ ^ ~ ~
scoreboard players set $ray gm4_calling_bell 0
execute as @e[type=marker,tag=gm4_calling_bell_ray,limit=1] at @s run function gm4_calling_bell:trader/ray

# once bell is found
execute at @e[type=marker,tag=gm4_calling_bell_ray,limit=1] align xyz positioned ~0.5 ~1 ~0.5 run function gm4_calling_bell:trader/summon

# clean up
kill @e[type=marker,tag=gm4_calling_bell_ray]