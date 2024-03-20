# stop trident movement when player dismounts or mana runs out
# @s = spell trident
# at @s
# run from spell_trident/ride/process

# stop spell
data modify entity @s Motion set value [0.0,0.0,0.0]
data modify entity @s SoundEvent set value "minecraft:item.trident.hit_ground"
data modify entity @s Trident.tag.Enchantments set value [{id:"minecraft:loyalty",lvl:3s}]
data modify entity @s damage set value 0

tag @s remove gm4_hy_spell_trident.process
tag @s add gm4_hy_spell_trident.landed
execute on passengers run ride @s dismount

# vfx
particle smoke ~ ~ ~ 0.1 0.1 0.1 0.05 2
playsound block.fire.extinguish player @a[distance=..16] ~ ~ ~ 0.8 0.8
