scoreboard objectives add gm4_particle dummy

scoreboard players set particles_pack gm4_modules 1

execute unless score particles_pack gm4_modules matches 1 run data modify storage gm4:log queue append value {type:"install",module:"Particles Pack"}

schedule function particles_pack:main 1t

#$moduleUpdateList
