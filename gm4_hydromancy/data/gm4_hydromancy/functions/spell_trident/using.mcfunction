# play vfx while charging a spell trident
# @s = player charging the trident
# at @s
advancement revoke @s only gm4_hydromancy:using_spell_trident 

tag @s add gm4_hy_using_spell_trident

# vfx
scoreboard players add @s gm4_hy_using_spell_trident 1
execute if score @s gm4_hy_using_spell_trident matches 1 anchored eyes run playsound block.conduit.activate player @a ^ ^ ^0.3 1 0.8
execute if score @s gm4_hy_using_spell_trident matches 10 anchored eyes run playsound block.conduit.attack.target player @a ^ ^ ^0.3 0.5 0.8
scoreboard players set @s[scores={gm4_hy_using_spell_trident=22..}] gm4_hy_using_spell_trident 9

# make sure trident doesn't have unintended enchantments
execute if score @s gm4_hy_using_spell_trident matches 1 if predicate gm4_hydromancy:trident_in_mainhand run item modify entity @s weapon.mainhand gm4_hydromancy:reset_enchants
execute if score @s gm4_hy_using_spell_trident matches 1 if predicate gm4_hydromancy:trident_in_offhand run item modify entity @s weapon.offhand gm4_hydromancy:reset_enchants
