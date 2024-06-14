# @s = soul forge to spawn a wandering tear vex
# run from soul_forge/entities/summon_wandering_tear

# spawn vex
summon minecraft:vex ~ ~0.2 ~ {Silent:1b,Glowing:1b,CustomNameVisible:0b,LifeTicks:1200,DeathLootTable:"minecraft:empty",Tags:["gm4_oa_ignore","gm4_oa_wandering_tear"],CustomName:'{"translate":"entity.gm4.wandering_tear","fallback":"Wandering Tear§"}',Team:"gm4_hide_name",active_effects:[{id:'minecraft:invisibility',amplifier:0b,duration:1000000,show_particles:0b}],attributes:[{id:"generic.follow_range",base:48},{id:"generic.attack_damage",base:3}]}

# visuals
playsound minecraft:entity.vex.hurt hostile @a[distance=..12] ~ ~ ~ 0.6 1.2
