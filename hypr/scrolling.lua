hl.config({
    general = {
        layout = "scrolling",
    },
    scrolling = {
        column_width = 0.5,
        fullscreen_on_one_column = true,
        direction = "right",
        wrap_focus = false,
        wrap_swapcol = false,
        focus_fit_method = 1,
    },
})

hl.bind("SUPER + SHIFT + left", hl.dsp.layout("swapcol l"))
hl.bind("SUPER + SHIFT + right", hl.dsp.layout("swapcol r"))

hl.bind("SUPER + SHIFT + mouse_down", hl.dsp.layout("move +col"))
hl.bind("SUPER + SHIFT + mouse_up", hl.dsp.layout("move -col"))

hl.bind("SUPER + right", hl.dsp.layout("move +col"))
hl.bind("SUPER + left", hl.dsp.layout("move -col"))

-- hl.bind("SUPER + SHIFT + minus", hl.dsp.layout("colresize -0.2"))
-- hl.bind("SUPER + SHIFT + equal", hl.dsp.layout("colresize +0.2"))
