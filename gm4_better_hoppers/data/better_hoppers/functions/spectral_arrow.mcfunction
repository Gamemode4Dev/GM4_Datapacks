#run from projectile_player
#@s = spectral arrow on a hopper, at @s

#check if there is any place in the hopper
execute if data block ~ ~-.1 ~ Items[4] run function better_hoppers:spectral_arrow/full
execute unless data block ~ ~.1 ~ Items[4] run function better_hoppers:spectral_arrow/drop