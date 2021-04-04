# @s = armor_stand to be modified
#run by the better armor stand base module

scoreboard players reset @s gm4_particle
data merge entity @s[scores={gm4_particle=1..}] {Invisible:0b}
kill @e[type=area_effect_cloud,tag=gm4_particles_pack_cloud,distance=..1,limit=1,sort=nearest]

execute if data storage gm4_better_armour_stands:temp {pages:["heart"]} run scoreboard players set @s gm4_particle 1
execute if data storage gm4_better_armour_stands:temp {pages:["flame"]} run scoreboard players set @s gm4_particle 2
execute if data storage gm4_better_armour_stands:temp {pages:["barrier"]} run scoreboard players set @s gm4_particle 3
execute if data storage gm4_better_armour_stands:temp {pages:["fireflies"]} run scoreboard players set @s gm4_particle 4
execute if data storage gm4_better_armour_stands:temp {pages:["cloud"]} run scoreboard players set @s gm4_particle 5
execute if data storage gm4_better_armour_stands:temp {pages:["bubbles"]} run scoreboard players set @s gm4_particle 6
execute if data storage gm4_better_armour_stands:temp {pages:["growing"]} run scoreboard players set @s gm4_particle 7
execute if data storage gm4_better_armour_stands:temp {pages:["drip"]} run scoreboard players set @s gm4_particle 8
execute if data storage gm4_better_armour_stands:temp {pages:["snow"]} run scoreboard players set @s gm4_particle 9

execute if score @s gm4_particle matches 5 run summon area_effect_cloud ~ ~1 ~ {Duration:2147483647,Radius:1,RadiusOnUse:0,Particle:cloud,Tags:["gm4_particles_pack_cloud"]}
execute if score @s gm4_particle matches 6 run summon area_effect_cloud ~ ~1 ~ {Duration:2147483647,Radius:1,RadiusOnUse:0,Particle:bubble,Tags:["gm4_particles_pack_cloud"]}
execute if score @s gm4_particle matches 8 run summon area_effect_cloud ~ ~1 ~ {Duration:2147483647,Radius:0.3f,RadiusOnUse:0,Particle:dripping_water,Tags:["gm4_particles_pack_cloud"]}

data merge entity @s[scores={gm4_particle=1..}] {Invisible:1b}
