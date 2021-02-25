#@s = none
#at world spawn
#called by mysterious midnights base if this expansion was selected. pulsed every 0.8 seconds throughout the night.

#summon potential impact points
summon minecraft:area_effect_cloud 29999998 1 7134 {CustomName:'"gm4_star_impact_point"',Tags:["gm4_star_impact_point"],Duration:1,Radius:0f,Particle:"block air"}

#randomizer, kill some impact points
scoreboard players set 17 gm4_mm_data 17
execute store result score falling_star_velocity gm4_mm_data run data get entity @e[type=area_effect_cloud,tag=gm4_star_impact_point,limit=1] UUID[0]
scoreboard players operation falling_star_velocity gm4_mm_data %= 17 gm4_mm_data

#calculate required velocity (periodic over time)
execute store result score falling_star_velocity_required gm4_mm_data run time query daytime
scoreboard players operation falling_star_velocity_required gm4_mm_data %= 17 gm4_mm_data

#compare velocities, if big enough, summon falling stars
execute if score falling_star_velocity gm4_mm_data >= falling_star_velocity_required gm4_mm_data if entity @a[limit=1] run function gm4_falling_stars:find_location

#kill impact points
kill @e[type=area_effect_cloud,tag=gm4_star_impact_point]

#summon endermites once endermite star hit the ground.
execute as @e[type=item,tag=gm4_endermite_star,nbt={OnGround:1b}] at @s run function gm4_falling_stars:hatch_endermite

#reset scores
scoreboard players reset falling_star_velocity_required gm4_mm_data
scoreboard players reset falling_star_velocity gm4_mm_data
