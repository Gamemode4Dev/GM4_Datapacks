# @s = armor_stand
# at @s
# run from gm4_better_armour_stands/store_book_pages

# reset armor_stand and particle cloud
execute if score @s gm4_particle matches 1.. run data modify entity @s Invisible set value 0
kill @e[type=area_effect_cloud,tag=gm4_particles_pack_cloud,distance=..1,limit=1,sort=nearest]
scoreboard players reset @s gm4_particle

# check particle
execute if data storage gm4_better_armour_stands:temp {pages:["heart"]} run scoreboard players set @s gm4_particle 1
execute if data storage gm4_better_armour_stands:temp {pages:["flame"]} run scoreboard players set @s gm4_particle 2
execute if data storage gm4_better_armour_stands:temp {pages:["barrier"]} run scoreboard players set @s gm4_particle 3
execute if data storage gm4_better_armour_stands:temp {pages:["fireflies"]} run scoreboard players set @s gm4_particle 4
execute if data storage gm4_better_armour_stands:temp {pages:["growing"]} run scoreboard players set @s gm4_particle 7
execute if data storage gm4_better_armour_stands:temp {pages:["drip"]} run scoreboard players set @s gm4_particle 8
execute if data storage gm4_better_armour_stands:temp {pages:["snow"]} run scoreboard players set @s gm4_particle 9

# custom particle cloud
execute if data storage gm4_better_armour_stands:temp {pages:["particle"]} run function gm4_particles_pack:particle_cloud

# turn armor_stand invisible
execute if score @s gm4_particle matches 1.. run data modify entity @s Invisible set value 1
