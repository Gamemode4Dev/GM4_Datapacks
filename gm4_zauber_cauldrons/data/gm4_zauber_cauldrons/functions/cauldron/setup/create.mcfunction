# @s = player able to create a cauldron
# at cauldron being looked at, align xyz
# ran from cauldron/setup/validate_structure

# summon marker AEC
execute positioned ~.5 ~.5 ~.5 summon marker run function gm4_zauber_cauldrons:cauldron/setup/initialize_marker
advancement grant @s only gm4:zauber_cauldrons_create
playsound minecraft:entity.illusioner.prepare_mirror master @a[distance=..8] ~.5 ~.5 ~.5 1 1.6

# summon texture display
summon minecraft:item_display ~.5 ~.5 ~.125 {CustomName:'"gm4_zc_texture"',item:{id:"minecraft:structure_void",Count:1b,tag:{CustomModelData:'block/zauber_cauldron'}},item_display:"thirdperson_righthand",Tags:["gm4_zc_texture","smithed.entity","smithed.strict"]}

# start creation animation
summon area_effect_cloud ~.5 ~.5 ~.5 {Radius:0,Age:-40,CustomName:'"gm4_zc_creation_animation"',Tags:["gm4_zc_creation_animation"],Particle:"block air"}
scoreboard players set $creation_counter gm4_zc_data 1
schedule function gm4_zauber_cauldrons:cauldron/setup/animation/controller 1t
