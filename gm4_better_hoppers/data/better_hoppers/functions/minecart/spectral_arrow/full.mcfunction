#run from minecart/spectral_arrow
#@s = spectral arrow with hopper that is "full" beneath it, at ~-.5 ~-1.5 ~-.5 from @s

#check if any of the slots are arrows
scoreboard players set @e[dx=1, dy=1.5, dz=1, type=hopper_minecart, nbt={Enabled:1b}, sort=nearest, limit=1] gm4_bh_data 0
execute as @e[dx=1, dy=1.5, dz=1, type=hopper_minecart, nbt={Enabled:1b}, sort=nearest, limit=1] run function better_hoppers:minecart/spectral_arrow/full_2
execute if score @e[dx=1, dy=1.5, dz=1, type=hopper_minecart, nbt={Enabled:1b}, sort=nearest, limit=1] gm4_bh_data > #0 gm4_bh_data run function better_hoppers:minecart/spectral_arrow/drop