
execute if entity @s[type=!#gm4_hydromancy:undead] run function gm4_hydromancy:spell_trident/heal/regen/heal
execute if entity @s[type=#gm4_hydromancy:undead] run function gm4_hydromancy:spell_trident/heal/regen/damage
scoreboard players set @s gm4_hy_regen_cd 50
