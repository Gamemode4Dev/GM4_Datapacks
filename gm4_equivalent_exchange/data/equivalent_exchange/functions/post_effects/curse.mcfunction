#@s = alchemical crafters containing a recipe results
#Run from post_effects/random_events

#set max number to 50
scoreboard players set #gm4_max_rand gm4_rng 51
function rng:set_rand


execute if score #gm4_rand_val gm4_rng matches 0..9 run tag @e[type=creeper,distance=..4,tag=!gm4_removePower,nbt=!{powered:1b}] add gm4_removePower
execute if score #gm4_rand_val gm4_rng matches 0..9 run summon lightning_bolt ~ ~ ~

execute if score #gm4_rand_val gm4_rng matches 10..24 run summon area_effect_cloud ~ ~1 ~ {Particle:"smoke",ReapplicationDelay:20,Radius:5f,RadiusPerTick:-.025f,Duration:100,Color:3866695,Potion:"minecraft:mundane",Effects:[{Id:20b,Amplifier:1b,Duration:40,ShowParticles:1b},{Id:15b,Amplifier:1b,Duration:40,ShowParticles:1b}]}
execute if score #gm4_rand_val gm4_rng matches 10..24 run playsound minecraft:entity.illusioner.prepare_blindness block @p[distance=..6] ~ ~ ~ 1 1 1

execute if score #gm4_rand_val gm4_rng matches 25.. run summon vex ~ ~1 ~ {DeathLootTable:"empty",LifeTicks:400,Tags:["gm4_ee_transmutation"],CustomName:"{\"text\":\"Living Transmutation\",\"color\":\"red\"}"}
execute if score #gm4_rand_val gm4_rng matches 25.. run replaceitem block ~ ~ ~ container.8 minecraft:air 1
execute if score #gm4_rand_val gm4_rng matches 25.. run playsound entity.vex.charge hostile @a[distance=..6] ~ ~ ~ 1 1 1