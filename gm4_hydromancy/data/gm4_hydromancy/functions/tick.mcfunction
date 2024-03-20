schedule function gm4_hydromancy:tick 1t

# process coral vine removal
execute as @e[type=marker,tag=gm4_hy_coral_vine] at @s unless block ~ ~ ~ #gm4_hydromancy:coral_vine run function gm4_hydromancy:coral_vine/removed

# spell trident processing
scoreboard players set @a[scores={gm4_hy_using_spell_trident=1..},tag=!gm4_hy_using_spell_trident] gm4_hy_using_spell_trident 0
execute at @a[tag=gm4_hy_using_spell_trident] as @e[type=trident,distance=..4,nbt={Trident:{tag:{gm4_hy_spell_trident:{}}}},tag=!gm4_hy_spell_trident.init] at @s run function gm4_hydromancy:spell_trident/thrown
tag @a remove gm4_hy_using_spell_trident

# progress bar particles
execute at @e[type=block_display,tag=gm4_hy_coral_core.charge_display_head] run particle dust 0.667 0.000 0.667 0.3 ^0.03 ^-0.03 ^-0.015 0 0 0 0 0 normal @a[distance=..8]

# cooldowns
scoreboard players remove @e[scores={gm4_hy_regen_cd=1..}] gm4_hy_regen_cd 1
scoreboard players remove @e[scores={gm4_hy_firework_cd=1..}] gm4_hy_firework_cd 1
