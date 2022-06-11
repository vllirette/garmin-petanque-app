import Toybox.Application;
import Toybox.Attention;
import Toybox.Lang;
import Toybox.WatchUi;

class PetanqueApp extends Application.AppBase {

    private var match;

    function initialize() {
        AppBase.initialize();
    }

    // onStart() is called on application start up
    function onStart(state as Dictionary?) as Void {
    }

    // onStop() is called when your application is exiting
    function onStop(state as Dictionary?) as Void {
    }

    // Return the initial view of your application here
    function getInitialView() as Array<Views or InputDelegates>? {
        return [ new PetanqueView(), new PetanqueDelegate() ] as Array<Views or InputDelegates>;
    }

    function getMatch() {
        return match;
    }

    function setMatch(m) {
        match = m;
    }

        function onMatchBegin() {
        if(Attention has :playTone) {
            if(getProperty("enable_sound")) {
                Attention.playTone(Attention.TONE_START);
            }
        }
        if(Attention has :vibrate) {
            Attention.vibrate([new Attention.VibeProfile(80, 200)]);
        }
    }

    function onMatchEnd(winner) {
        if(Attention has :playTone) {
            if(getProperty("enable_sound")) {
                Attention.playTone(winner == YOU ? Attention.TONE_SUCCESS : Attention.TONE_FAILURE);
            }
        }
        if(Attention has :vibrate) {
            Attention.vibrate([new Attention.VibeProfile(80, 200)]);
        }
    }
}

function getApp() as PetanqueApp {
    return Application.getApp() as PetanqueApp;
}
