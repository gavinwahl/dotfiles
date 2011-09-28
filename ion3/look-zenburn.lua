-- look-zenburn-ion3.lua --- Zenburn color theme for Ion3
-- This file is in the public domain.

-- Author: Daniel Brockman <daniel@brockman.se>
-- URL: http://www.brockman.se/software/zenburn/look-zenburn-ion3.lua

-- Based on Jani Nurminen's original Zenburn color scheme for Vim,
-- and the classic brownsteel look for pwm.

-- Thanks to Luke Renn for porting this to Ion3.

if not gr.select_engine("de") then return end

de.reset()

font_medium = "terminus-*-med-*-14-*"
font_bold = font_medium

de.defstyle("*", {
    shadow_colour     = "#262626",
    highlight_colour  = "#767676",
    background_colour = "#464646",
    foreground_colour = "#acac9c",
    padding_pixels = 0,
    highlight_pixels = 0,
    shadow_pixels = 1,
    border_style = "elevated",
    font = font_medium,
    text_align = "center",
})

de.defstyle("frame", {
    based_on = "*",
    padding_colour    = "#505050",
    background_colour = "#3f3f3f",
    foreground_colour = "#ffffff",
    padding_pixels = 2,
    highlight_pixels = 1,
    shadow_pixels = 1,
    de.substyle("active", {
        shadow_colour     = "#204050",
        highlight_colour  = "#607080",
        background_colour = "#505050",
        foreground_colour = "#ffffff",
    }),
})

de.defstyle("frame-ionframe", {
    based_on = "frame",
    border_style = "inlaid",
    padding_pixels = 1,
    spacing = 2,
})

de.defstyle("frame-floatframe", {
    based_on = "frame",
    border_style = "ridge"
})

de.defstyle("tab", {
    based_on = "*",
    font = font_bold,
    de.substyle("inactive-unselected", {
        shadow_colour     = "#262626",
        highlight_colour  = "#767676",
        background_colour = "#464646",
        foreground_colour = "#acac9c",
    }),
    de.substyle("inactive-selected", {
        shadow_colour     = "#404040",
        highlight_colour  = "#909090",
        background_colour = "#606060",
        foreground_colour = "#dcdccc",
    }),
    de.substyle("active-unselected", {
        shadow_colour     = "#203040",
        highlight_colour  = "#607080",
        background_colour = "#405060",
        foreground_colour = "#a0a0a0",
    }),
    de.substyle("active-selected", {
        shadow_colour     = "#304050",
        highlight_colour  = "#708090",
        background_colour = "#506070",
        foreground_colour = "#ffffff",
    }),
    text_align = "center",
})

de.defstyle("tab-frame", {
    based_on = "tab",
    de.substyle("*-*-*-*-activity", {
        shadow_colour     = "#404040",
        highlight_colour  = "#707070",
        background_colour = "#990000",
        foreground_colour = "#eeeeee",
    }),
})

de.defstyle("tab-frame-ionframe", {
    based_on = "tab-frame",
    spacing = 1,
})

de.defstyle("tab-menuentry", {
    based_on = "tab",
    text_align = "left",
})

de.defstyle("tab-menuentry-big", {
    based_on = "tab-menuentry",
    padding_pixels = 2,
})

de.defstyle("input", {
    based_on = "*",
    background_colour = "#000000",
    foreground_colour = "#ffffff",
    padding_pixels = 1,
    highlight_pixels = 1,
    shadow_pixels = 1,
    border_style = "elevated",
    de.substyle("*-cursor", {
        background_colour = "#ffffff",
        foreground_colour = "#000000",
    }),
    de.substyle("*-selection", {
        background_colour = "#505050",
        foreground_colour = "#ffffff",
    }),
})

gr.refresh()
