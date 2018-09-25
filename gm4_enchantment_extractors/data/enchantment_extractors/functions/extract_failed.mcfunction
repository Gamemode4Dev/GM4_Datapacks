scoreboard players add fail_type gm4_ench_random 27
execute if score fail_type gm4_ench_random matches 100.. run scoreboard players remove fail_type gm4_ench_random 100

execute if score fail_type gm4_ench_random matches ..80 run particle explosion ~ ~1.7 ~ 0.2 0.2 0.2 0.05 25 force @a[distance=..10]
execute if score fail_type gm4_ench_random matches ..80 run playsound item.shield.break block @a[distance=..8] ~ ~ ~ 0.6 0.3

execute if score fail_type gm4_ench_random matches 81.. run playsound entity.evocation_illager.prepare_attack block @a[distance=..8] ~ ~ ~ .8 1.8
execute if score fail_type gm4_ench_random matches 81..90 run summon vex ~ ~-1 ~ {CustomName:"\"Congealed Enchantment\"",CustomNameVisible:0,LifeTicks:100,Attributes:[{Name:generic.attackDamage,Base:2}],Health:4.0,Motion:[0.0,0.35,0.0]}
execute if score fail_type gm4_ench_random matches 91.. run summon vex ~ ~-1 ~ {CustomName:"\"Living Enchantment\"",CustomNameVisible:0,HandItems:[{id:golden_sword,Count:1},{}],HandDropChances:[0.0f,0.0f],Motion:[0.0,0.25,0.0]}
