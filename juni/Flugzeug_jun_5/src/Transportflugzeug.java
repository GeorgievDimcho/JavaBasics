public class Transportflugzeug extends Luftfahrzeug {
    private int anzahlStellplaetze;
    private double maxTransportkapa;
    private double aktuelleLadung;

    public Transportflugzeug(Fahrzeugtyp fahrzeugtyp, String bezeichnung, Registrierung registrierung, double anzahlFlugstunden, int anzahlStellplaetze, double maxTransportkapa, double aktuelleLadung) {
        super(fahrzeugtyp, bezeichnung, registrierung, anzahlFlugstunden);
        this.anzahlStellplaetze = anzahlStellplaetze;
        this.maxTransportkapa = maxTransportkapa;
        this.aktuelleLadung = aktuelleLadung;
    }

    public Transportflugzeug(Fahrzeugtyp fahrzeugtyp, String bezeichnung, Registrierung registrierung, double anzahlFlugstunden) {
        super(fahrzeugtyp, bezeichnung, registrierung, anzahlFlugstunden);
    }

    public Transportflugzeug() {

    }
    // only extra params
    public Transportflugzeug(int anzahlStellplaetze, double maxTransportkapa, double aktuelleLadung) {
        this.anzahlStellplaetze = anzahlStellplaetze;
        this.maxTransportkapa = maxTransportkapa;
        this.aktuelleLadung = aktuelleLadung;
    }

    public int getAnzahlStellplaetze() {
        return anzahlStellplaetze;
    }

    public void setAnzahlStellplaetze(int anzahlStellplaetze) {
        this.anzahlStellplaetze = anzahlStellplaetze;
    }

    public double getMaxTransportkapa() {
        return maxTransportkapa;
    }

    public void setMaxTransportkapa(double maxTransportkapa) {
        this.maxTransportkapa = maxTransportkapa;
    }

    public double getAktuelleLadung() {
        return aktuelleLadung;
    }

    public void setAktuelleLadung(double aktuelleLadung) {
        this.aktuelleLadung = aktuelleLadung;
    }

    public double getFreieLadeKapa() {
        return getMaxTransportkapa() - getAktuelleLadung();
    }

    @Override
    public String toString() {
        return super.toString() + "anzahlStellplaetze: " + getAnzahlStellplaetze() + "\n maxTransportkapa: " + getMaxTransportkapa() + "\n aktuelleLadung: " + getAktuelleLadung() + "\n getFreieLadeKapa(): " + getFreieLadeKapa() + "\n";
    }


}
