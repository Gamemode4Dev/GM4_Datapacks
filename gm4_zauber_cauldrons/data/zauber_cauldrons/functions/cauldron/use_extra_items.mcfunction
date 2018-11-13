#@s=zauber cauldron
#run from recipes

#summons 1 vex for every unused item entity in a cauldron (on recipe processing)
summon vex ~ ~1.5 ~ {CustomName:"\"Possessed Item\"",CustomNameVisible:0,LifeTicks:320,Attributes:[{Name:generic.attackDamage,Base:2}],Health:4.0,Motion:[0.0,0.25,0.0]}
scoreboard players remove @s gm4_zc_fullness 1
execute if score @s gm4_zc_fullness > expected_item_amount gm4_zc_fullness run function zauber_cauldrons:cauldron/use_extra_items
