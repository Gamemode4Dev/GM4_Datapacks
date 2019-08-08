#@s = mould requesting barimium marker clouds after mould destruction
#run from metallurgy:casting/summon_band/barimium via #metallurgy:random_band_init/barimium

#summon the marker AEC
summon area_effect_cloud ~ ~ ~ {Tags:["gm4_ml_raw_barimium_band","gm4_ml_musical_marker"],CustomName:"\"gm4_ml_musical_band_marker\"",Duration:1}
