# @s = armor_stand to be modified
# at @s
# run from gm4_better_armour_stands:book/apply

scoreboard players operation $current gm4_particle = @s gm4_particle
scoreboard players reset @s gm4_particle
kill @e[type=area_effect_cloud,tag=gm4_particles_pack_cloud,distance=..1,limit=1,sort=nearest]

execute if data storage gm4_better_armour_stands:temp {pages:["heart"]} run scoreboard players set @s gm4_particle 1
execute if data storage gm4_better_armour_stands:temp {pages:["flame"]} run scoreboard players set @s gm4_particle 2
execute if data storage gm4_better_armour_stands:temp {pages:["barrier"]} run scoreboard players set @s gm4_particle 3
execute if data storage gm4_better_armour_stands:temp {pages:["fireflies"]} run scoreboard players set @s gm4_particle 4
execute if data storage gm4_better_armour_stands:temp {pages:["growing"]} run scoreboard players set @s gm4_particle 7
execute if data storage gm4_better_armour_stands:temp {pages:["drip"]} run scoreboard players set @s gm4_particle 8
execute if data storage gm4_better_armour_stands:temp {pages:["winter"]} run scoreboard players set @s gm4_particle 9
execute if data storage gm4_better_armour_stands:temp {pages:["blossom"]} run scoreboard players set @s gm4_particle 10
execute if data storage gm4_better_armour_stands:temp {pages:["autumn"]} run scoreboard players set @s gm4_particle 11
execute if data storage gm4_better_armour_stands:temp {pages:["spring"]} run scoreboard players set @s gm4_particle 12
execute if data storage gm4_better_armour_stands:temp {pages:["ash"]} run scoreboard players set @s gm4_particle 13
execute if data storage gm4_better_armour_stands:temp {pages:["lava"]} run scoreboard players set @s gm4_particle 14
execute if data storage gm4_better_armour_stands:temp {pages:["fiesta"]} run scoreboard players set @s gm4_particle 15
execute if data storage gm4_better_armour_stands:temp {pages:["ender"]} run scoreboard players set @s gm4_particle 16
execute if data storage gm4_better_armour_stands:temp {pages:["enchant"]} run scoreboard players set @s gm4_particle 17
execute if data storage gm4_better_armour_stands:temp {pages:["note"]} run scoreboard players set @s gm4_particle 18

execute if data storage gm4_better_armour_stands:temp {pages:["cloud"]} run scoreboard players set @s gm4_particle 100
execute if data storage gm4_better_armour_stands:temp {pages:["bubbles"]} run scoreboard players set @s gm4_particle 101

execute if score @s gm4_particle matches 100 run summon area_effect_cloud ~ ~ ~ {Duration:2147483647,Radius:1,RadiusOnUse:0,Particle:cloud,Tags:["gm4_particles_pack_cloud"]}
execute if score @s gm4_particle matches 101 run summon area_effect_cloud ~ ~ ~ {Duration:2147483647,Radius:1,RadiusOnUse:0,Particle:bubble,Tags:["gm4_particles_pack_cloud"]}

execute if score @s gm4_particle matches 1.. run scoreboard players set $valid_code gm4_bas_data 1
data merge entity @s[scores={gm4_particle=1..}] {Invisible:1b,NoGravity:1b}
execute unless score @s gm4_particle matches 1.. run scoreboard players operation @s gm4_particle = $current gm4_particle
