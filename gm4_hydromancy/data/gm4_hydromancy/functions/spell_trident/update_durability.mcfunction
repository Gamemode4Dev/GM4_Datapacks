# update durability from using a spell trident without casting a spell
# @s = player that used the spell trident to hit entity or mine block
# at @s
advancement revoke @s only gm4_hydromancy:spell_trident_dura

execute store result score $durability gm4_hy_data run data get entity @s SelectedItem.tag.gm4_hy_spell_trident.dura
item modify entity @s weapon.mainhand gm4_hydromancy:update_durability

execute if data entity @s SelectedItem.tag.Enchantments run item modify entity @s weapon.mainhand gm4_hydromancy:remove_enchants
