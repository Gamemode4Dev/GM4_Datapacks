#@s = item entity to have enchantments extracted
#run from enchantment_extractors:extract

function enchantment_extractors:next_random

execute if score result gm4_ench_random matches ..79 run particle poof ~ ~1.5 ~ 0.2 0.2 0.2 0.05 25 force @a[distance=..10]
execute if score result gm4_ench_random matches ..79 run playsound item.shield.break block @a[distance=..8] ~ ~ ~ 0.6 0.3

execute if score result gm4_ench_random matches 80..89 run playsound entity.evoker.prepare_attack block @a[distance=..8] ~ ~ ~ .8 1.8
execute if score result gm4_ench_random matches 80..89 run summon vex ~ ~-1 ~ {CustomName:"\"Congealed Enchantment\"",CustomNameVisible:0,LifeTicks:100,Attributes:[{Name:generic.attackDamage,Base:2}],Health:4.0,Motion:[0.0,0.35,0.0]}
execute if score result gm4_ench_random matches 90.. run playsound entity.evoker.prepare_attack block @a[distance=..8] ~ ~ ~ 1.3 .6
execute if score result gm4_ench_random matches 90.. run summon vex ~ ~-1 ~ {CustomName:"\"Living Enchantment\"",CustomNameVisible:0,HandItems:[{id:golden_sword,Count:1},{}],HandDropChances:[0.0f,0.0f],Motion:[0.0,0.25,0.0]}
