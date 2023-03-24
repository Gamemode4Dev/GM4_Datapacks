# subtract used mana of this spell trident from mana left
# @s = spell trident
# at @s
# run from any spell_trident/ride/process

# store left mana in trident data
execute store result score $mana gm4_hy_data run data get entity @s Trident.tag.gm4_hy_spell_trident.mana.left
execute store result entity @s Trident.tag.gm4_hy_spell_trident.mana int 1 run scoreboard players operation $mana gm4_hy_data -= @s gm4_hy_mana_used

# use mana perc left for durability display (min 10, max 245)
execute store result score $mana_max gm4_hy_data run data get entity @s Trident.tag.gm4_hy_spell_trident.mana.max
scoreboard players operation $mana gm4_hy_data *= #100 gm4_hy_data
scoreboard players operation $mana gm4_hy_data /= $mana_max gm4_hy_data
execute if score $mana gm4_hy_data matches ..3 run scoreboard players set $mana gm4_hy_data 4
execute if score $mana gm4_hy_data matches 99.. run scoreboard players set $mana gm4_hy_data 98
execute store result entity @s Trident.tag.gm4_hy_spell_trident.dura_disp int 2.5 run scoreboard players get $mana gm4_hy_data
data modify entity @s Trident.tag.Damage set from entity @s Trident.tag.gm4_hy_spell_trident.dura_disp
