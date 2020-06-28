# @s = raycast AEC
# at start location
# run from gm4_cozy_campfires:placement/campfire

# raycast
scoreboard players set gm4_ray_counter gm4_count 0
execute at @s run function gm4_cozy_campfires:campfire/placement/advance_ray

# summon permanent marker
execute at @s align xyz unless entity @e[type=area_effect_cloud,dx=0,dy=0,dz=0,tag=gm4_cozy_campfire] run summon area_effect_cloud ~0.5 ~0.5 ~0.5 {Radius:0,Age:-2147483648,CustomName:'"gm4_cozy_campfire"',Tags:["gm4_cozy_campfire"],Particle:"block air"}

# kill ray
kill @s
