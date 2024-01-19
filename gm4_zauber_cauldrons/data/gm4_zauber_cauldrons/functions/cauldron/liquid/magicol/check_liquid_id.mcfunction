# confirms the liquid id to be 'magicol' before displaying particles
# @s = zauber cauldron with valid structure
# at @s align xyz
# run via function tag #gm4_zauber_cauldrons:cauldron/liquid/cauldron_particles from cauldron/structure/valid

# check liquid id unless another expansion already displayed a particle
execute unless score $displayed_liquid_particle gm4_zc_data matches 1.. if data storage gm4_zauber_cauldrons:temp/cauldron/ingredients liquid{id:"magicol"} run function gm4_zauber_cauldrons:cauldron/liquid/magicol/particles
