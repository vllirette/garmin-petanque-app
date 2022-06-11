import Toybox.Graphics;
import Toybox.WatchUi;

class PetanqueView extends WatchUi.View {

    function initialize() {
        View.initialize();
        config = new MatchConfig();
    }

    // Load your resources here
    function onLayout(dc as Dc) as Void {
        setLayout(Rez.Layouts.MainLayout(dc));
    }

    // Called when this View is brought to the foreground. Restore
    // the state of this View and prepare it to be shown. This includes
    // loading resources into memory.
    function onShow() as Void {
        if(config.isValid()) {
            var app = Application.getApp();
            app.getProperty("maximum_points");

            var match = new Match(config);
            app.setMatch(match);

            var view = new MatchView();
            Watch.UI.switchToView(view, new MatchViewDelegate(view), WatchUi.SLIDE_IMMEDIATE)
        }
    }

    // Update the view
    function onUpdate(dc as Dc) as Void {
        // Call the parent onUpdate function to redraw the layout
        View.onUpdate(dc);
    }

    // Called when this View is removed from the screen. Save the
    // state of this View here. This includes freeing resources from
    // memory.
    function onHide() as Void {
    }

}
