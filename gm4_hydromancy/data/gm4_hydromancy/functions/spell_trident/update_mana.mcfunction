# subtract used mana of this spell trident from mana left
# @s = spell trident
# at @s
# run from spell_trident/ride/process
# run from spell_trident/hopper/return
# run from spell_trident/builder/cast
# run from spell_trident/heal/lost_interact

# store left mana in trident data
execute store result entity @s Trident.tag.gm4_hy_spell_trident.mana.left int 1 run scoreboard players operation @s gm4_hy_charge -= @s gm4_hy_mana_used
scoreboard players set @s gm4_hy_mana_used 0

# use mana perc left for durability display (min 3%, max 99%)
scoreboard players operation $mana gm4_hy_data = @s gm4_hy_charge
execute store result score $mana_max gm4_hy_data run data get entity @s Trident.tag.gm4_hy_spell_trident.mana.max
scoreboard players operation $mana gm4_hy_data *= #100 gm4_hy_data
scoreboard players operation $mana gm4_hy_data /= $mana_max gm4_hy_data
execute if score $mana gm4_hy_data matches ..2 run scoreboard players set $mana gm4_hy_data 3
execute if score $mana gm4_hy_data matches 100 run scoreboard players set $mana gm4_hy_data 99
execute store result entity @s Trident.tag.gm4_hy_spell_trident.dura int 1 run scoreboard players get $mana gm4_hy_data

# set damage for display in entity
scoreboard players operation $mana gm4_hy_data *= #250 gm4_hy_data
scoreboard players operation $mana gm4_hy_data /= #100 gm4_hy_data
scoreboard players set $durability gm4_hy_data 250
execute store result entity @s Trident.tag.Damage int 1 run scoreboard players operation $durability gm4_hy_data -= $mana gm4_hy_data
