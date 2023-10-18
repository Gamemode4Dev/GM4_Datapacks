# @s = zauber cauldron with overflow items OR bottled_vex item on ground
# run from use_extra_items AND release_from_bottle
# at @s

# summons 1 vex for every unused item entity in a cauldron or every vex in bottle (on recipe processing)
summon vex ~ ~ ~ {CustomName:'{"translate":"entity.gm4.possessed_item","fallback":"Possessed Item§"}',CustomNameVisible:0,Team:"gm4_hide_name",LifeTicks:320,Attributes:[{Name:"generic.attack_damage",Base:2}],Health:4.0f,Motion:[0.0,0.25,0.0],ActiveEffects:[{Id:11,Amplifier:10,Duration:20,ShowParticles:0b}]}
scoreboard players remove @s gm4_zc_fullness 1
execute if score @s gm4_zc_fullness matches 1.. run function gm4_zauber_cauldrons:cauldron/extra_items/create_possessed_items
