# @s = player able to create a cauldron
# at cauldron position
# ran from cauldron/setup/validate_structure

# summon marker AEC
summon marker ~ ~ ~ {CustomName:'"gm4_zauber_cauldron"',Tags:["gm4_zauber_cauldron","gm4_zauber_cauldron_new","smithed.entity","smithed.strict","smithed.block"]}
scoreboard players set @e[type=marker,tag=gm4_zauber_cauldron_new,distance=0] gm4_entity_version 1
tag @e[type=marker,distance=0] remove gm4_zauber_cauldron_new
advancement grant @s only gm4:zauber_cauldrons_create
playsound minecraft:entity.illusioner.prepare_mirror master @a[distance=..8] ~ ~ ~ 1 1.6

# start creation animation
summon area_effect_cloud ~ ~ ~ {Radius:0,Age:-40,CustomName:'"gm4_zc_creation_animation"',Tags:["gm4_zc_creation_animation"],Particle:"block air"}
scoreboard players set $creation_counter gm4_zc_data 1
schedule function gm4_zauber_cauldrons:cauldron/setup/animation/controller 1t
