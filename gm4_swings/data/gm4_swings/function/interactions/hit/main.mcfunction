advancement revoke @s only gm4_swings:interactions/hit

tag @s add gm4_swings.attacker
execute as @n[type=minecraft:interaction,tag=gm4_swings.interaction.hit,nbt={attack:{}},distance=..20] at @s run function gm4_swings:interactions/hit/on_interaction
tag @s remove gm4_swings.attacker