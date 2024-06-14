#@s = rotten_flesh item on the ground
#at @s
#called by event

summon zombie ~ ~ ~ {DeathLootTable:"minecraft:empty",ArmorItems:[],HandItems:[],active_effects:[{id:'minecraft:nausea',amplifier:1,duration:30}],Attributes:[{Name:"generic.attack_damage",Base:10.0}]}

playsound block.redstone_torch.burnout hostile @a[distance=..16] ~ ~ ~ 1 .1
function gm4_resurrecting_zombies:absorb_rotten_flesh
