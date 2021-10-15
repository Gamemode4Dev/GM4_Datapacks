scoreboard objectives add gm4_particle dummy

execute unless score particles_pack gm4_modules matches 1 run data modify storage gm4:log queue append value {type:"install",module:"Particles Pack"}
scoreboard players set particles_pack gm4_modules 1

schedule function gm4_particles_pack:main 1t

# guidebook
execute if score gm4_guidebook load.status matches 1 run summon marker ~ 3307.180186041202 ~ {CustomName:'"gm4_particles_pack_guide"',Tags:["gm4_guide"],data:{type:"_expansion",base:"better_armour_stands",id:"particles_pack",page_count:2,line_count:1,module_name:"Particles Pack"}}

#$moduleUpdateList
