#@s = alchemical crafters containing a recipe results
#Run from post_effects/apply_multiplier

execute if score lightning gm4_ee_curse matches 1.. run tag @e[type=creeper,distance=..10,tag=!gm4_remove_power,nbt=!{powered:1b}] add gm4_remove_power
execute if score lightning gm4_ee_curse matches 1.. run summon lightning_bolt ~ ~ ~

execute if score cloud gm4_ee_curse matches 1.. run summon area_effect_cloud ~ ~1 ~ {Particle:"smoke",ReapplicationDelay:20,Radius:5f,RadiusPerTick:-.025f,Duration:100,Color:3866695,Potion:"minecraft:mundane",Effects:[{Id:20b,Amplifier:1b,Duration:40,ShowParticles:1b},{Id:15b,Amplifier:1b,Duration:40,ShowParticles:1b}]}
execute if score cloud gm4_ee_curse matches 1.. run playsound minecraft:entity.illusioner.prepare_blindness block @a[distance=..6] ~ ~ ~ 1 1 1

execute if score vex gm4_ee_curse matches 1.. run summon vex ~ ~1 ~ {DeathLootTable:"empty",LifeTicks:400,Tags:["gm4_ee_transmutation"],CustomName:'{"translate":"%1$s%3427655$s","with":["Living Transmutation",{"translate":"item.gm4.livin_transmutation"}],"color":"red"}'}
execute if score vex gm4_ee_curse matches 1.. run scoreboard players add stack_reduction gm4_ee_curse 1
execute if score vex gm4_ee_curse matches 1 run playsound entity.vex.charge hostile @a[distance=..6] ~ ~ ~ 1 1 1

execute if score lightning gm4_ee_curse matches 1.. run scoreboard players remove lightning gm4_ee_curse 1
execute if score cloud gm4_ee_curse matches 1.. run scoreboard players remove cloud gm4_ee_curse 1
execute if score vex gm4_ee_curse matches 1.. run scoreboard players remove vex gm4_ee_curse 1

execute if score vex gm4_ee_curse matches 1.. run function equivalent_exchange:post_effects/curse
