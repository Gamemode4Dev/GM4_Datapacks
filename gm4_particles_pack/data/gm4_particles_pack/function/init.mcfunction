scoreboard objectives add gm4_particle dummy

execute unless score particles_pack gm4_modules matches 1 run data modify storage gm4:log queue append value {type:"install",module:"Particles Pack"}
execute unless score particles_pack gm4_earliest_version < particles_pack gm4_modules run scoreboard players operation particles_pack gm4_earliest_version = particles_pack gm4_modules
scoreboard players set particles_pack gm4_modules 1

schedule function gm4_particles_pack:main 1t



#$moduleUpdateList
