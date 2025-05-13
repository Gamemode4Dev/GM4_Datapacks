# @s = soul forge without fire with extra ghast tears in storage
# run from soul_forge/destroy

# spawn vex
summon minecraft:vex ~ ~0.2 ~ {Silent:1b,Glowing:1b,CustomNameVisible:0b,life_ticks:1200,DeathLootTable:"gm4:empty",Tags:["gm4_oa_ignore","gm4_oa_wandering_tear"],CustomName:{"translate":"entity.gm4.wandering_tear","fallback":"Wandering Tear§"},Team:"gm4_hide_name",active_effects:[{id:"minecraft:invisibility",amplifier:0b,duration:1000000,show_particles:0b}],attributes:[{id:"minecraft:follow_range",base:48},{id:"minecraft:attack_damage",base:3}]}

# visuals
playsound minecraft:entity.vex.hurt hostile @a[distance=..12] ~ ~ ~ 0.6 1.2

# loop
scoreboard players remove @s gm4_oa_tears 1
execute if score @s gm4_oa_tears matches 1.. run function gm4_orb_of_ankou:soul_forge/entities/summon_wandering_tear
