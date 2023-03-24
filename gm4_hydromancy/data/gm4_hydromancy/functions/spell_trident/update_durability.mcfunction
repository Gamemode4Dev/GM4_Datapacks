# update durability from using a spell trident without casting a spell
# @s = player that used the spell trident to hit entity or mine block
# at @s
advancement revoke @s only gm4_hydromancy:spell_trident_dura

item modify entity @s weapon.mainhand gm4_hydromancy:update_durability
