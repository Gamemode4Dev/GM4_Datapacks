# @s=player able to create a cauldron
# at cauldron position
# ran from playe/submain

# summon marker AEC
summon area_effect_cloud ~ ~ ~ {Radius:0,Age:-2147483648,CustomName:'"gm4_zauber_cauldron"',Tags:["gm4_zauber_cauldron"],Particle:"block air"}
advancement grant @s only gm4:zauber_cauldrons_create
playsound minecraft:entity.illusioner.prepare_mirror master @a[distance=..8] ~ ~ ~ 1 1.6

# start creation animation
summon area_effect_cloud ~ ~ ~ {Radius:0,Age:-40,CustomName:'"gm4_zc_creation_animation"',Tags:["gm4_zc_creation_animation"],Particle:"block air"}
scoreboard players set creation_counter gm4_zc_data 1
schedule function gm4_zauber_cauldrons:cauldron/setup/animation 1t
