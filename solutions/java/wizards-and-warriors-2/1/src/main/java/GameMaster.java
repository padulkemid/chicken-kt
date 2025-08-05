public class GameMaster {

    private String buildCharacterReturnString(String job, int lvl, int hp) {
        return "You're a level " + lvl + " " + job + " with " + hp + " hit points.";
    }

    public String describe(Character character) {
        String charaClass = character.getCharacterClass();
        int charaLevel = character.getLevel();
        int charaHP = character.getHitPoints();

        return buildCharacterReturnString(charaClass, charaLevel, charaHP);
    }

    private String buildDestinationReturnString(String name, int inhabitants) {
        return "You've arrived at " + name + ", which has " + inhabitants + " inhabitants.";
    }

    public String describe(Destination destination) {
        String name = destination.getName();
        int inhabitants = destination.getInhabitants();

        return buildDestinationReturnString(name, inhabitants);
    }

    private String buildTravelMethodReturnString(TravelMethod method) {
        String base = "You're traveling to your destination ";

        if (method == TravelMethod.HORSEBACK) {
            return base + "on horseback.";
        }

        return base + "by walking.";
    }

    public String describe(TravelMethod method) {
        return buildTravelMethodReturnString(method);
    }

    public String describe(Character character, Destination destination, TravelMethod method) {
        return describe(character) + " " + describe(method) + " " + describe(destination);
    }

    public String describe(Character character, Destination destination) {
        return describe(character) + " " + describe(TravelMethod.WALKING) + " " + describe(destination);
    }
}
