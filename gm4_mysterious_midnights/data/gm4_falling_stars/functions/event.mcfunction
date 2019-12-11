#@s = none
#at world spawn
#called by mysterious midnights base if this expansion was selected. pulsed every 0.8 seconds throughout the night.

#summon potential impact points
summon minecraft:area_effect_cloud ~ ~ ~ {CustomName:'"gm4_star_impact_point"',Tags:["gm4_star_impact_point"],Duration:18000,Radius:0.01,Particle:"block air"}

#randomizer, kill some impact points
execute store result score falling_star_velocity gm4_nights_data run data get entity @e[type=area_effect_cloud,tag=gm4_star_impact_point,limit=1] UUIDMost 0.00000000002273064325381162890625
scoreboard players operation falling_star_velocity gm4_nights_data %= 17 gm4_nights_data

#calculate required velocity (periodic over time)
scoreboard players operation falling_star_velocity_required gm4_nights_data = daytime gm4_nights_data
scoreboard players operation falling_star_velocity_required gm4_nights_data %= 17 gm4_nights_data

#compare velocities, if big enough, summon falling stars
execute if score falling_star_velocity gm4_nights_data >= falling_star_velocity_required gm4_nights_data if entity @p run function gm4_falling_stars:find_location

#kill impact points
kill @e[type=area_effect_cloud,tag=gm4_star_impact_point]

#summon endermites once endermite star hit the ground.
execute as @e[type=item,tag=gm4_endermite_star,nbt={OnGround:1b}] at @s run function gm4_falling_stars:hatch_endermite

#reset scores
scoreboard players reset falling_star_velocity_required gm4_nights_data
scoreboard players reset falling_star_velocity gm4_nights_data
