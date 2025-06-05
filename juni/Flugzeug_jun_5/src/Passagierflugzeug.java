public class Passagierflugzeug extends Luftfahrzeug {
    private int anzahlBusiness;
    private int anzahlEconomy;
    private double betriebsstundenInspektion;
    // leer
    public Passagierflugzeug() {

    }
    // all param
    public Passagierflugzeug(Fahrzeugtyp fahrzeugtyp, String bezeichnung, Registrierung registrierung, double anzahlFlugstunden, int anzahlBusiness, int anzahlEconomy, double betriebsstundenInspektion) {
        super(fahrzeugtyp, bezeichnung, registrierung, anzahlFlugstunden);
        this.anzahlBusiness = anzahlBusiness;
        this.anzahlEconomy = anzahlEconomy;
        this.betriebsstundenInspektion = betriebsstundenInspektion;
    }
    // die param von super Class
    public Passagierflugzeug(Fahrzeugtyp fahrzeugtyp, String bezeichnung, Registrierung registrierung, double anzahlFlugstunden) {
        super(fahrzeugtyp, bezeichnung, registrierung, anzahlFlugstunden);
    }

    public int getAnzahlBusiness() {
        return anzahlBusiness;
    }

    public void setAnzahlBusiness(int anzahlBusiness) {
        this.anzahlBusiness = anzahlBusiness;
    }

    public int getAnzahlEconomy() {
        return anzahlEconomy;
    }

    public void setAnzahlEconomy(int anzahlEconomy) {
        this.anzahlEconomy = anzahlEconomy;
    }

    public double getBetriebsstundenInspektion() {
        return betriebsstundenInspektion;
    }

    public void setBetriebsstundenInspektion(double betriebsstundenInspektion) {
        this.betriebsstundenInspektion = betriebsstundenInspektion;
    }

    @Override
    public String toString() {
        return super.toString() + "anzahlBusiness: " + getAnzahlBusiness() + "\n anzahlEconomy: " + getAnzahlEconomy() + "\n betriebsstundenInspektion: " + getBetriebsstundenInspektion() + "\n";
    }
}
