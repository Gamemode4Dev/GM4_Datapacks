#@s=player able to create a cauldron
#ran from main

#position checks
summon area_effect_cloud ~ ~ ~ {Radius:0,Age:-2147483648,CustomName:"\"gm4_zauber_cauldron\"",Tags:["gm4_zauber_cauldron"],Particle:"block air"}
advancement grant @s only gm4:zauber_cauldrons_create
