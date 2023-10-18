# @s = soul forge to spawn a wandering tear vex
# run from soul_forge/entities/summon_wandering_tear

# spawn vex
summon minecraft:vex ~ ~0.2 ~ {Silent:1b,Glowing:1b,CustomNameVisible:0b,LifeTicks:1200,DeathLootTable:"minecraft:empty",Tags:["gm4_oa_ignore","gm4_oa_wandering_tear"],CustomName:'{"translate":"entity.gm4.wandering_tear","fallback":"Wandering Tear§"}',Team:"gm4_hide_name",ActiveEffects:[{Id:14,Amplifier:0b,Duration:1000000,ShowParticles:0b}],Attributes:[{Name:"generic.follow_range",Base:48},{Name:"generic.attack_damage",Base:3}]}

# visuals
playsound minecraft:entity.vex.hurt hostile @a[distance=..12] ~ ~ ~ 0.6 1.2
