# runs fail events if nothing was extracted
# @s = armor stand display
# located at the enchantment extractor block
# run from extract_item

# smoke: 80% -> (1 * 0.8)
scoreboard players set $failed_smoke gm4_ench_data 0
execute if predicate gm4_enchantment_extractors:failed_smoke_chance store success score $failed_smoke gm4_ench_data run particle poof ~ ~1.5 ~ 0.2 0.2 0.2 0.05 5
execute if score $failed_smoke gm4_ench_data matches 1 run playsound item.shield.break block @a[distance=..8] ~ ~ ~ 0.6 0.3

# congealed enchantment: 10% -> (1 - 0.8) * 0.5
scoreboard players set $failed_congealed_ench gm4_ench_data 0
execute if score $failed_smoke gm4_ench_data matches 0 if predicate gm4_enchantment_extractors:failed_congealed_chance store success score $failed_congealed_ench gm4_ench_data run summon vex ~ ~ ~ {CustomName:'{"translate":"entity.gm4.congealed_enchantment","fallback":"Congealed Enchantment§"}',CustomNameVisible:0,Team:"gm4_hide_name",LifeTicks:100,Attributes:[{Name:"generic.attack_damage",Base:2}],Health:4.0f,Motion:[0.0,0.35,0.0]}
execute if score $failed_congealed_ench gm4_ench_data matches 1 run playsound entity.evoker.prepare_attack block @a[distance=..8] ~ ~ ~ .8 1.8

# living enchantment: 10% -> (1 - 0.8 - ((1 - 0.8) * 0.5)) 
scoreboard players set $failed_living_ench gm4_ench_data 0
execute if score $failed_smoke gm4_ench_data matches 0 if score $failed_congealed_ench gm4_ench_data matches 0 store success score $failed_living_ench gm4_ench_data run summon vex ~ ~ ~ {CustomName:'{"translate":"entity.gm4.living_enchantment","fallback":"Living Enchantment§"}',CustomNameVisible:0,Team:"gm4_hide_name",HandItems:[{id:"minecraft:golden_sword",Count:1},{}],HandDropChances:[0.0f,0.0f],Motion:[0.0,0.25,0.0]}
execute if score $failed_living_ench gm4_ench_data matches 1 run playsound entity.evoker.prepare_attack block @a[distance=..8] ~ ~ ~ 1.3 .6
