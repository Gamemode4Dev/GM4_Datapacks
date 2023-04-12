# process thrown spell trident
# @s = spell trident
# at @s
# run from spell_trident/process

# track used mana
scoreboard players add @s gm4_hy_mana_used 1

# if trident is dismounted or mana runs out stop spell
scoreboard players set $passengers gm4_hy_data 0
execute on passengers run scoreboard players set $passengers gm4_hy_data 1
execute if score $passengers gm4_hy_data matches 0 run function gm4_hydromancy:spell_trident/ride/dismounted
execute if score @s gm4_hy_mana_used >= @s gm4_hy_charge run function gm4_hydromancy:spell_trident/ride/dismounted

# stop processing when trident hits the ground, big water splash if landed
execute if entity @s[tag=gm4_hy_spell_trident.landed,tag=gm4_hy_spell_trident.process] run particle block water ~ ~0.75 ~ 0.475 0.175 0.475 0 32
tag @s[tag=gm4_hy_spell_trident.landed] remove gm4_hy_spell_trident.process

# process used mana once spell ends
execute unless entity @s[tag=gm4_hy_spell_trident.process] run function gm4_hydromancy:spell_trident/update_mana

# vfx
particle rain ~ ~ ~ 0.25 0.25 0.25 0.1 24
particle block water ~ ~ ~ 0.175 0.175 0.175 0 8
scoreboard players add @s gm4_hy_timer 1
execute if score @s gm4_hy_timer matches 1 run playsound minecraft:entity.player.swim player @a[distance=..8] ~ ~ ~ 1 1.7
execute if score @s gm4_hy_timer matches 4 run playsound minecraft:entity.player.swim player @a[distance=..8] ~ ~ ~ 0.7 0.8
scoreboard players set @s[scores={gm4_hy_timer=4..}] gm4_hy_timer 0
