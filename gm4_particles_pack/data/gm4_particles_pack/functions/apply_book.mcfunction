# @s = armor_stand to be modified
# at @s
# run from gm4_better_armour_stands:book/process

execute if data storage gm4_better_armour_stands:temp {pages:["heart"]} store success score $valid_code gm4_bas_data run scoreboard players set @s gm4_particle 1
execute if data storage gm4_better_armour_stands:temp {pages:["flame"]} store success score $valid_code gm4_bas_data run scoreboard players set @s gm4_particle 2
execute if data storage gm4_better_armour_stands:temp {pages:["barrier"]} store success score $valid_code gm4_bas_data run scoreboard players set @s gm4_particle 3
execute if data storage gm4_better_armour_stands:temp {pages:["fireflies"]} store success score $valid_code gm4_bas_data run scoreboard players set @s gm4_particle 4
execute if data storage gm4_better_armour_stands:temp {pages:["growing"]} store success score $valid_code gm4_bas_data run scoreboard players set @s gm4_particle 7
execute if data storage gm4_better_armour_stands:temp {pages:["drip"]} store success score $valid_code gm4_bas_data run scoreboard players set @s gm4_particle 8
execute if data storage gm4_better_armour_stands:temp {pages:["winter"]} store success score $valid_code gm4_bas_data run scoreboard players set @s gm4_particle 9
execute if data storage gm4_better_armour_stands:temp {pages:["blossom"]} store success score $valid_code gm4_bas_data run scoreboard players set @s gm4_particle 10
execute if data storage gm4_better_armour_stands:temp {pages:["autumn"]} store success score $valid_code gm4_bas_data run scoreboard players set @s gm4_particle 11
execute if data storage gm4_better_armour_stands:temp {pages:["spring"]} store success score $valid_code gm4_bas_data run scoreboard players set @s gm4_particle 12
execute if data storage gm4_better_armour_stands:temp {pages:["ash"]} store success score $valid_code gm4_bas_data run scoreboard players set @s gm4_particle 13
execute if data storage gm4_better_armour_stands:temp {pages:["lava"]} store success score $valid_code gm4_bas_data run scoreboard players set @s gm4_particle 14
execute if data storage gm4_better_armour_stands:temp {pages:["fiesta"]} store success score $valid_code gm4_bas_data run scoreboard players set @s gm4_particle 15
execute if data storage gm4_better_armour_stands:temp {pages:["ender"]} store success score $valid_code gm4_bas_data run scoreboard players set @s gm4_particle 16
execute if data storage gm4_better_armour_stands:temp {pages:["enchant"]} store success score $valid_code gm4_bas_data run scoreboard players set @s gm4_particle 17
execute if data storage gm4_better_armour_stands:temp {pages:["note"]} store success score $valid_code gm4_bas_data run scoreboard players set @s gm4_particle 18

execute if data storage gm4_better_armour_stands:temp {pages:["cloud"]} store success score $valid_code gm4_bas_data run scoreboard players set @s gm4_particle 100
execute if data storage gm4_better_armour_stands:temp {pages:["bubbles"]} store success score $valid_code gm4_bas_data run scoreboard players set @s gm4_particle 101

execute if score @s gm4_particle matches 100.. run kill @e[type=area_effect_cloud,tag=gm4_particles_pack_cloud,distance=..1,limit=1,sort=nearest]
execute if score @s gm4_particle matches 100 run summon area_effect_cloud ~ ~ ~ {Duration:2147483647,Radius:1,RadiusOnUse:0,Particle:cloud,Tags:["gm4_particles_pack_cloud"]}
execute if score @s gm4_particle matches 101 run summon area_effect_cloud ~ ~ ~ {Duration:2147483647,Radius:1,RadiusOnUse:0,Particle:bubble,Tags:["gm4_particles_pack_cloud"]}

data merge entity @s[scores={gm4_particle=1..}] {Invisible:1b,NoGravity:1b}
