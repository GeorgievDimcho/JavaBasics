public class Registrierung {
    private Land land;
    private String kennzeichnung;
    private String besitzer;

    public Registrierung(Land land, String kennzeichnung, String besitzer) {
        this.land = land;
        this.kennzeichnung = kennzeichnung;
        this.besitzer = besitzer;
    }
     public Registrierung() {

     }

    public Land getLand() {
        return land;
    }

    public void setLand(Land land) {
        this.land = land;
    }

    public String getKennzeichnung() {
        return kennzeichnung;
    }

    public void setKennzeichnung(String kennzeichnung) {
        this.kennzeichnung = kennzeichnung;
    }

    public String getBesitzer() {
        return besitzer;
    }

    public void setBesitzer(String besitzer) {
        this.besitzer = besitzer;
    }

    @Override
    public String toString() {
        return "land: " + getLand() + "\n kennzeichnung: " + getKennzeichnung() + "\n getBesitzer(): " + getBesitzer() + "\n";
    }
}
