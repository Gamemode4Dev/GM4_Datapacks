# @s = @e[type=armor_stand,tag=gm4_phantom_scarecrow,scores={gm4_ps_time=5..}]
# at @s
# ran from main

summon area_effect_cloud ~ ~ ~ {Radius:0.0f,Tags:["gm4_phantom_scarecrow_rocket"],Duration:50,custom_particle:{type:"minecraft:block",block_state:{Name:"minecraft:air"}}}
playsound minecraft:entity.firework_rocket.launch block @a ~ ~ ~ 2 1
scoreboard players set @s gm4_ps_time 0
