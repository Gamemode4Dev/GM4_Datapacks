scoreboard players reset @e[type=armor_stand,distance=..1,limit=1,sort=nearest,tag=!gm4_no_edit] gm4_particle
data merge entity @e[type=armor_stand,distance=..1,limit=1,sort=nearest,tag=!gm4_no_edit] {Invisible:0b}
execute at @e[type=armor_stand,distance=..1,limit=1,sort=nearest,tag=!gm4_no_edit] run kill @e[type=area_effect_cloud,tag=gm4_particles_pack_cloud,distance=..1,limit=1,sort=nearest]

execute if entity @s[nbt={Item:{tag:{pages:["heart"]}}}] run scoreboard players set @e[type=armor_stand,distance=..1,limit=1,sort=nearest,tag=!gm4_no_edit] gm4_particle 1
execute if entity @s[nbt={Item:{tag:{pages:["flame"]}}}] run scoreboard players set @e[type=armor_stand,distance=..1,limit=1,sort=nearest,tag=!gm4_no_edit] gm4_particle 2
execute if entity @s[nbt={Item:{tag:{pages:["barrier"]}}}] run scoreboard players set @e[type=armor_stand,distance=..1,limit=1,sort=nearest,tag=!gm4_no_edit] gm4_particle 3
execute if entity @s[nbt={Item:{tag:{pages:["fireflies"]}}}] run scoreboard players set @e[type=armor_stand,distance=..1,limit=1,sort=nearest,tag=!gm4_no_edit] gm4_particle 4
execute if entity @s[nbt={Item:{tag:{pages:["cloud"]}}}] run scoreboard players set @e[type=armor_stand,distance=..1,limit=1,sort=nearest,tag=!gm4_no_edit] gm4_particle 5
execute if entity @s[nbt={Item:{tag:{pages:["bubbles"]}}}] run scoreboard players set @e[type=armor_stand,distance=..1,limit=1,sort=nearest,tag=!gm4_no_edit] gm4_particle 6
execute if entity @s[nbt={Item:{tag:{pages:["growing"]}}}] run scoreboard players set @e[type=armor_stand,distance=..1,limit=1,sort=nearest,tag=!gm4_no_edit] gm4_particle 7
execute if entity @s[nbt={Item:{tag:{pages:["drip"]}}}] run scoreboard players set @e[type=armor_stand,distance=..1,limit=1,sort=nearest,tag=!gm4_no_edit] gm4_particle 8

execute at @e[type=armor_stand,distance=..1,limit=1,sort=nearest,tag=!gm4_no_edit,scores={gm4_particle=5}] run summon area_effect_cloud ~ ~1 ~ {Duration:2147483647,Radius:1,RadiusOnUse:0,Particle:cloud,Tags:["gm4_particles_pack_cloud"]}
execute at @e[type=armor_stand,distance=..1,limit=1,sort=nearest,tag=!gm4_no_edit,scores={gm4_particle=6}] run summon area_effect_cloud ~ ~1 ~ {Duration:2147483647,Radius:1,RadiusOnUse:0,Particle:bubble,Tags:["gm4_particles_pack_cloud"]}
execute at @e[type=armor_stand,distance=..1,limit=1,sort=nearest,tag=!gm4_no_edit,scores={gm4_particle=8}] run summon area_effect_cloud ~ ~1 ~ {Duration:2147483647,Radius:1,RadiusOnUse:0,Particle:dripping_water,Tags:["gm4_particles_pack_cloud"]}

data merge entity @e[type=armor_stand,distance=..1,limit=1,sort=nearest,tag=!gm4_no_edit,scores={gm4_particle=1..}] {Invisible:1b}
