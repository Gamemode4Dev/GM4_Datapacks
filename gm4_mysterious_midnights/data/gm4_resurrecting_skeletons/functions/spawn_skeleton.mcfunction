#@s = bone item on the ground
#at @s
#called by event

summon skeleton ~ ~ ~ {DeathLootTable:"minecraft:empty",ArmorItems:[],HandItems:[],ActiveEffects:[{Id:9,Amplifier:1,Duration:30}],Attributes:[{Name:"generic.attackDamage",Base:10.0}]}

playsound block.redstone_torch.burnout hostile @a[distance=..16] ~ ~ ~ 1 .1
function gm4_resurrecting_skeletons:absorb_bone
