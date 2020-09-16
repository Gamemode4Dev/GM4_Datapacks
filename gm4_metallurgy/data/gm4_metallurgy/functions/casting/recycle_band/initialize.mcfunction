#@s = vex mould entity
#runs from sustain_mould

#add score
scoreboard players add @s gm4_ml_rcyc 1

#melt bands
execute if score @s gm4_ml_rcyc matches 12 run function gm4_metallurgy:casting/recycle_band/melt_band

#burn other heads
execute if score @s gm4_ml_rcyc matches 13 run function gm4_metallurgy:casting/recycle_band/burn
