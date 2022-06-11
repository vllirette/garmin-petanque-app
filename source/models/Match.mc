enum MatchType {
    DOUBLE = 1,
    TRIPLE = 2
}

class MatchConfig {
    public var type;
    public var maximumPoints;

    function isValid() {
        return true; //type == DOUBLE || type == TRIPLE;
    }
}

class Match {
    private var type; //type of the match double (2 teams), triple (3 teams)
    private var winner;
    private var maximum_points; //total points of a match if not sudden death (13)

    function initialize(config) {
        type = config.type;
        maximum_points = config.maximumPoints;
    }

    function getType() {
        return type;
    }

    //todo update logic
    function score(scorer) {
        if(!hasEnded()) {
            var set = getCurrentSet();
            set.score(scorer);

            //detect if match has a set winner
            var set_winner = isSetWon(set);
            if(set_winner != null) {
                set.end(set_winner);

                //manage activity session
                session_field_set_score_player_1.setData(set.getScore(YOU));
                session_field_set_score_player_2.setData(set.getScore(OPPONENT));

                var match_winner = isWon();
                if(match_winner != null) {
                    end(match_winner);

                    //manage activity session
                    session_field_set_player_1.setData(getSetsWon(YOU));
                    session_field_set_player_2.setData(getSetsWon(OPPONENT));
                    session_field_score_player_1.setData(getTotalScore(YOU));
                    session_field_score_player_2.setData(getTotalScore(OPPONENT));
                    session.stop();
                }
            }
        }
    }

    function hasEnded() {
        return winner != null;
    }

        function getWinner() {
        return winner;
    }

}
