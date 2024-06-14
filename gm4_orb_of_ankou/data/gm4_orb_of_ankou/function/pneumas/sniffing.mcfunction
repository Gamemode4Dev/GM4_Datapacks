# @s = player with sniffing pneuma who is sneaking
# run from pneumas/sneak/check

execute if score @s gm4_oa_sniff matches 1.. run playsound minecraft:entity.sniffer.searching player @a[distance=..8] ~ ~ ~ 0.2 0.8
execute if score @s gm4_oa_sniff matches ..0 run playsound minecraft:entity.sniffer.searching player @a[distance=..8] ~ ~ ~ 0.4 1.4
execute if score @s gm4_oa_sniff matches ..-90 run playsound minecraft:entity.sniffer.scenting player @a[distance=..8] ~ ~ ~ 0.8 0.6
execute if score @s gm4_oa_sniff matches ..-100 if predicate gm4_orb_of_ankou:sniff_chance run scoreboard players set @s gm4_oa_sniff 601

execute if score @s gm4_oa_sniff matches 601 run loot spawn ~ ~ ~ loot minecraft:gameplay/sniffer_digging
execute if score @s gm4_oa_sniff matches 601 run playsound minecraft:block.grass.break player @a[distance=..8] ~ ~ ~ 0.8 1.4
scoreboard players remove @s[scores={gm4_oa_sniff=601}] gm4_oa_sniff 1
execute unless score @s gm4_oa_sniff matches 1.. run scoreboard players remove @s gm4_oa_sniff 1
