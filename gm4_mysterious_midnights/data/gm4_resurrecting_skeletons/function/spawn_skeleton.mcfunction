#@s = bone item on the ground
#at @s
#called by event

summon skeleton ~ ~ ~ {DeathLootTable:"minecraft:empty",ArmorItems:[],HandItems:[],active_effects:[{id:'minecraft:nausea',amplifier:1,duration:30}],attributes:[{id:"generic.attack_damage",base:10.0}]}

playsound block.redstone_torch.burnout hostile @a[distance=..16] ~ ~ ~ 1 .1
function gm4_resurrecting_skeletons:absorb_bone
