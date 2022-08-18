# runs fail events if nothing was extracted
# @s = armor stand display
# located at the enchantment extractor block
# run from extract_item

# smoke: 80% -> (1 * 0.8)
execute store success score $failed_smoke gm4_ench_data if predicate gm4_enchantment_extractors:failed_smoke_chance run particle poof ~ ~1.5 ~ 0.2 0.2 0.2 0.05 5
execute if score $failed_smoke gm4_ench_data matches 1 run playsound item.shield.break block @a[distance=..8] ~ ~ ~ 0.6 0.3

# congealed enchantment: 10% -> (1 - 0.8) * 0.5
execute store success score $failed_congealed_ench gm4_ench_data if score $failed_smoke gm4_ench_data matches 0 if predicate gm4_enchantment_extractors:failed_congealed_chance run summon vex ~ ~ ~ {CustomName:'{"translate":"%1$s%3427655$s","with":["Congealed Enchantment§",{"translate":"entity.gm4.congealed_enchantment"}]}',CustomNameVisible:0,Team:"gm4_hide_name",LifeTicks:100,Attributes:[{Name:"generic.attack_damage",Base:2}],Health:4.0f,Motion:[0.0,0.35,0.0]}
execute if score $failed_smoke gm4_ench_data matches 1 run playsound entity.evoker.prepare_attack block @a[distance=..8] ~ ~ ~ .8 1.8

# living enchantment: 10% -> (1 - 0.8 - ((1 - 0.8) * 0.5)) 
execute store success score $failed_living_ench gm4_ench_data if score $failed_congealed_ench gm4_ench_data matches 0 run summon vex ~ ~ ~ {CustomName:'{"translate":"%1$s%3427655$s","with":["Living Enchantment§",{"translate":"entity.gm4.living_enchantment"}]}',CustomNameVisible:0,Team:"gm4_hide_name",HandItems:[{id:"minecraft:golden_sword",Count:1},{}],HandDropChances:[0.0f,0.0f],Motion:[0.0,0.25,0.0]}
execute if score $failed_congealed_ench gm4_ench_data matches 1 run playsound entity.evoker.prepare_attack block @a[distance=..8] ~ ~ ~ 1.3 .6
