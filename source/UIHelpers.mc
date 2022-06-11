using Toybox.Math;
using Toybox.Graphics;
using Toybox.System;

module UIHelpers {
    function drawHighlightedText(dc, x, y, font, text, padding) {
        var dimensions = dc.getTextDimensions(text, font);
        dc.setColor(Graphics.COLOR_BLACK, Graphics.COLOR_BLACK);
        dc.fillRoundedRectangle(x - dimensions[0] / 2 - padding, y - dimensions[1] / 2, dimensions[0] + 2 * padding, dimensions[1], 5);
        dc.setColor(Graphics.COLOR_WHITE, Graphics.COLOR_TRANSPARENT);
        dc.drawText(x, y, font, text, Graphics.TEXT_JUSTIFY_CENTER | Graphics.TEXT_JUSTIFY_VCENTER);
    }
}
