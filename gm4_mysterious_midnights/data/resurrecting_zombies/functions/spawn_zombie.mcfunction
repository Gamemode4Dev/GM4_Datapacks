#@s = rotten_flesh item on the ground
#at @s
#called by event

summon zombie ~ ~ ~ {DeathLootTable:"null",ArmorItems:[],HandItems:[],ActiveEffects:[{Id:9,Amplifier:1,Duration:30}],Attributes:[{Name:"generic.attackDamage",Base:10.0}]}

playsound block.redstone_torch.burnout hostile @a[distance=..16] ~ ~ ~ 1 .1
function resurrecting_zombies:absorb_rotten_flesh
