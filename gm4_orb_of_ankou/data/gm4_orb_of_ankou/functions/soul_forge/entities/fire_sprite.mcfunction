# @s = soul forge to spawn an fire sprite zombie
# run from both soul_forge/entities/summon_powder_sprite and soul_forge/entities/summon_glowstone_sprite

# spawn zombie
summon minecraft:zombie ~ ~0.2 ~ {Fire:1000000,Motion:[0.0,0.6,0.0],Silent:1b,CustomNameVisible:0b,DeathLootTable:"minecraft:empty",Health:10.0f,IsBaby:1b,CanBreakDoors:0b,CanPickUpLoot:0b,Tags:["gm4_oa_unset","gm4_oa_ignore","gm4_oa_fire_sprite"],CustomName:'{"text":"Fire Sprite"}',ArmorItems:[{},{},{},{id:"minecraft:golden_helmet",Count:1b,tag:{Enchantments:[{}]}}],ArmorDropChances:[0.0F,0.0F,0.0F,-327.670F],ActiveEffects:[{Id:14b,Amplifier:0b,Duration:1000000,ShowParticles:0b}],Attributes:[{Name:"generic.follow_range",Base:8},{Name:"generic.attack_damage",Base:1},{Name:"generic.attack_knockback",Base:0},{Name:"zombie.spawn_reinforcements",Base:0}]}

# randomize motion in x and z
execute as @e[type=zombie,limit=1,sort=nearest,tag=gm4_oa_unset] run function gm4_orb_of_ankou:soul_forge/entities/randomize_motion

# visuals
playsound minecraft:entity.blaze.hurt hostile @a[distance=..12] ~ ~ ~ 0.6 1.2
