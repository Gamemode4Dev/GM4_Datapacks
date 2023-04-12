

data modify entity @s Rotation[1] set value -90F
summon interaction ~ ~-0.05 ~ {width:0.3f,height:1.7f,Tags:["gm4_hy_heal.interact"],response:1b}
tag @s add gm4_hy_spell_trident.heal.initiated
