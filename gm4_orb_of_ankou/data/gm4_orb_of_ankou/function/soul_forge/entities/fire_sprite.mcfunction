# @s = soul forge to spawn an fire sprite zombie
# run from both soul_forge/entities/summon_powder_sprite and soul_forge/entities/summon_glowstone_sprite

# spawn zombie
summon minecraft:zombie ~ ~0.2 ~ {Fire:1000000,Motion:[0.0,0.6,0.0],Silent:1b,CustomNameVisible:0b,DeathLootTable:"gm4:empty",Health:10.0f,IsBaby:1b,CanBreakDoors:0b,CanPickUpLoot:0b,Tags:["gm4_oa_unset","gm4_oa_ignore","gm4_oa_fire_sprite"],CustomName:{"translate":"entity.gm4.fire_sprite","fallback":"Fire Sprite§"},Team:"gm4_hide_name",equipment:{head:{id:"minecraft:golden_helmet",count:1,components:{"minecraft:custom_model_data":"entity/fire_sprite","minecraft:enchantment_glint_override":true}}},drop_chances:{head:0F},active_effects:[{id:"minecraft:invisibility",amplifier:0b,duration:1000000,show_particles:0b}],attributes:[{id:"minecraft:follow_range",base:8},{id:"minecraft:attack_damage",base:1},{id:"minecraft:attack_knockback",base:0},{id:"minecraft:spawn_reinforcements",base:0}]}

# randomize motion in x and z
execute as @e[type=zombie,tag=gm4_oa_unset,limit=1] run function gm4_orb_of_ankou:soul_forge/entities/set_data/randomize_motion

# visuals
playsound minecraft:entity.blaze.hurt hostile @a[distance=..12] ~ ~ ~ 0.6 1.2
