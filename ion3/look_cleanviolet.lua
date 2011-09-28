--
-- Look_cleanviolet for Ion's default drawing engine. 
-- Based on look-clean and look-violetgrey.
-- 

if not gr.select_engine("de") then
    return
end

-- Clear existing styles from memory.
de.reset()

old_font = "-*-helvetica-medium-r-normal-*-12-*-*-*-*-*-*-*"
font = "terminus-*-med-*-14-*"

-- Base style
de.defstyle("*", {
    -- Gray background
    highlight_colour = "#eeeeee",
    shadow_colour = "#eeeeee",
    background_colour = "#aaaaaa",
    foreground_colour = "#000000",
    shadow_pixels = 1,
    highlight_pixels = 1,
    padding_pixels = 0,
    spacing = 0,
    border_style = "elevated",
    
    font = font,
    text_align = "center",
})

de.defstyle("tab", {
    font = font,
    
    de.substyle("active-selected", {
        -- Violet tab
        highlight_colour = "#aaaacc",
        shadow_colour = "#aaaacc",
        background_colour = "#666699",
        foreground_colour = "#eeeeee",
    }),

    de.substyle("inactive-selected", {
        -- Greyish violet tab
        highlight_colour = "#eeeeff",
        shadow_colour = "#eeeeff",
        background_colour = "#9999aa",
        foreground_colour = "#000000",
    }),
})


de.defstyle("input", {
    text_align = "left",
    spacing = 1,
    -- Greyish violet background
    highlight_colour = "#eeeeff",
    shadow_colour = "#eeeeff",
    background_colour = "#9999aa",
    foreground_colour = "#000000",
    
    de.substyle("*-selection", {
        background_colour = "#777799",
        foreground_colour = "#000000",
    }),

    de.substyle("*-cursor", {
        background_colour = "#000000",
        foreground_colour = "#9999aa",
    }),
})


dopath("lookcommon_clean")

de.defstyle("frame", {
    background_colour = "#3f3f3f"
})

-- Refresh objects' brushes.
gr.refresh()
