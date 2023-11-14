# no @s.
# at world spawn
# called by init

# generates a random moon_phase_offset based on the world seed on module installation
random reset gm4_zauber_cauldrons:bottled_vex/moon_phase_offset 0 true true
execute store result score $magicol_offset gm4_zc_moon_phase run random value 0..7 gm4_zauber_cauldrons:bottled_vex/moon_phase_offset
