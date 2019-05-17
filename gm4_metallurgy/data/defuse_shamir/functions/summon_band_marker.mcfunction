#@s = mould requesting aluminium marker clouds after mould destruction
#run from metallurgy:casting/summon_band/aluminium via #metallurgy:random_band_init/aluminium

#summon the marker AEC
summon area_effect_cloud ~ ~ ~ {Tags:["gm4_ml_raw_aluminium_band","gm4_ml_defuse_marker"],CustomName:"\"gm4_ml_defuse_band_marker\"",Duration:1}
