-- Change the default Omarchy look'n'feel.
-- https://wiki.hypr.land/Configuring/Basics/Variables/#decoration
hl.config({
  general = {
    gaps_in = 2,
    gaps_out = 2,
  },
  decoration = {
    -- Use round window corners.
    rounding = 0,

    -- Dim unfocused windows (0.0 = no dim, 1.0 = fully dimmed).
    dim_inactive = true,
    dim_strength = 0.15,
  },
})
