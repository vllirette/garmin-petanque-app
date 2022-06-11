class MatchView extends WatchUi.View {
    const SCORE_PLAYER_1_FONT = Graphics.FONT_NUMBER_MEDIUM;
    const SCORE_PLAYER_2_FONT = Graphics.FONT_NUMBER_MILD;

    public var boundaries;


    function initialize() {
        View.initialize();

        timer = new Timer.Timer();
        boundaries = new MatchBoundaries(System.getDeviceSettings());
    }

    function onHide() {
        timer.stop();

        Application.getApp().getBus().unregister(self);
    }

    function drawScores(dc, match) {
        var set = match.getCurrentSet();

        UIHelpers.drawHighlightedText(dc, boundaries.xCenter, boundaries.yScore1, SCORE_PLAYER_1_FONT, set.getScore(YOU).toString(), 8);
        UIHelpers.drawHighlightedText(dc, boundaries.xCenter, boundaries.yScore2, SCORE_PLAYER_2_FONT, set.getScore(OPPONENT).toString(), 8);
    }

    function drawTimer(dc, match) {
        dc.setColor(Graphics.COLOR_WHITE, Graphics.COLOR_TRANSPARENT);
        dc.drawText(boundaries.xCenter, boundaries.yBottom + MatchBoundaries.TIME_HEIGHT * 0.1, Graphics.FONT_SMALL, Helpers.formatDuration(match.getDuration()), Graphics.TEXT_JUSTIFY_CENTER);
    }

    function drawTime(dc) {
        var time_label = Helpers.formatCurrentTime(clock_24_hour, time_am_label, time_pm_label);
        dc.setColor(Graphics.COLOR_WHITE, Graphics.COLOR_TRANSPARENT);
        dc.drawText(boundaries.xCenter, boundaries.marginHeight - MatchBoundaries.TIME_HEIGHT * 0.1, Graphics.FONT_SMALL, time_label, Graphics.TEXT_JUSTIFY_CENTER);
    }

}
