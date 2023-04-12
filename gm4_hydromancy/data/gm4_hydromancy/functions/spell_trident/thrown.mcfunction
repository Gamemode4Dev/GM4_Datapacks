# initialize a newly throw spell trident
# @s = spell trident
# at @s
# run from tick

tag @s add gm4_hy_spell_trident.init
stopsound @a[distance=..16] player minecraft:item.trident.throw

execute store result score @s gm4_hy_charge run data get entity @s Trident.tag.gm4_hy_spell_trident.mana.left
execute if score @s gm4_hy_charge matches ..0 run function gm4_hydromancy:spell_trident/no_mana
execute if score @s gm4_hy_charge matches 1.. run function gm4_hydromancy:spell_trident/init_trident
