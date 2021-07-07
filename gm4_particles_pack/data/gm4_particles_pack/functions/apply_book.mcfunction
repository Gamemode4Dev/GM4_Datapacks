# @s = armor_stand ..1 from writable_book
#run by the better armor stand base module

scoreboard players reset @s gm4_particle
data merge entity @s[scores={gm4_particle=1..}] {Invisible:0b}
kill @e[type=area_effect_cloud,tag=gm4_particles_pack_cloud,distance=..1,limit=1,sort=nearest]

execute if data storage gm4_better_armour_stands:temp {pages:["heart"]} run scoreboard players set @s gm4_particle 1
execute if data storage gm4_better_armour_stands:temp {pages:["flame"]} run scoreboard players set @s gm4_particle 2
execute if data storage gm4_better_armour_stands:temp {pages:["barrier"]} run scoreboard players set @s gm4_particle 3
execute if data storage gm4_better_armour_stands:temp {pages:["fireflies"]} run scoreboard players set @s gm4_particle 4
execute if data storage gm4_better_armour_stands:temp {pages:["growing"]} run scoreboard players set @s gm4_particle 7
execute if data storage gm4_better_armour_stands:temp {pages:["drip"]} run scoreboard players set @s gm4_particle 8
execute if data storage gm4_better_armour_stands:temp {pages:["snow"]} run scoreboard players set @s gm4_particle 9

execute if data storage gm4_better_armour_stands:temp {pages:["particle"]} run function gm4_particles_pack:particle_cloud

data merge entity @s[scores={gm4_particle=1..}] {Invisible:1b}
