# Adds tags for whether the player is skiing normally or skiing on a non-snowy block
execute as @a[gamemode=!spectator] at @s run function gm4_mountaineering:ski_effects/check_snowy_block

# Records the player's y-velocity in a scoreboard
execute as @a[gamemode=!spectator] at @s run function gm4_mountaineering:get_velocity

# Adds speed effects for skiing on a flat surface
execute as @a[gamemode=!spectator,tag=gm4_mountaineering_skiing] at @s run function gm4_mountaineering:ski_effects/flat_ski_speed/add_flat_ski_speed
execute as @a[gamemode=!spectator,tag=!gm4_mountaineering_skiing] at @s run function gm4_mountaineering:ski_effects/flat_ski_speed/remove_flat_ski_speed

# Adds slowness effects for skiing on a non-snowy block
execute as @a[gamemode=!spectator,tag=gm4_mountaineering_skiing_off_snow] at @s run function gm4_mountaineering:ski_effects/ski_off_snow_slowness/add_off_snow_slowness
execute as @a[gamemode=!spectator,tag=!gm4_mountaineering_skiing_off_snow] at @s run function gm4_mountaineering:ski_effects/ski_off_snow_slowness/remove_off_snow_slowness

# Adds increased speed effects for skiing on a downhill surface
execute as @a[gamemode=!spectator,tag=gm4_mountaineering_skiing,tag=!gm4_mountaineering_skiing_downhill,scores={gm4_mountaineering_vy=..-2}] at @s run function gm4_mountaineering:ski_effects/downhill_ski_speed/add_downhill_ski_speed
execute as @a[gamemode=!spectator,tag=gm4_mountaineering_skiing_downhill] at @s run function gm4_mountaineering:ski_effects/downhill_ski_speed/check_downhill_ski_speed


#execute as @a[gamemode=!spectator,predicate=gm4_mountaineering:holding_poles] at @s run function gm4_mountaineering:ski_effects/poles_equipped
#execute as @a[gamemode=!spectator,predicate=gm4_mountaineering:wearing_crampons] at @s run function gm4_mountaineering:ski_effects/crampons_equipped

schedule function gm4_mountaineering:main 16t
