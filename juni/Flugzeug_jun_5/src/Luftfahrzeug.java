public abstract class Luftfahrzeug {
    protected Fahrzeugtyp fahrzeugtyp;
    protected String bezeichnung;
    protected Registrierung registrierung;
    protected double anzahlFlugstunden;

    public Fahrzeugtyp getFahrzeugtyp() {
        return fahrzeugtyp;
    }

    public void setFahrzeugtyp(Fahrzeugtyp fahrzeugtyp) {
        this.fahrzeugtyp = fahrzeugtyp;
    }

    public String getBezeichnung() {
        return bezeichnung;
    }

    public void setBezeichnung(String bezeichnung) {
        this.bezeichnung = bezeichnung;
    }

    public Registrierung getRegistrierung() {
        return registrierung;
    }

    public void setRegistrierung(Registrierung registrierung) {
        this.registrierung = registrierung;
    }

    public double getAnzahlFlugstunden() {
        return anzahlFlugstunden;
    }

    public void setAnzahlFlugstunden(double anzahlFlugstunden) {
        this.anzahlFlugstunden = anzahlFlugstunden;
    }

    public Luftfahrzeug() {

    }

    public Luftfahrzeug(Fahrzeugtyp fahrzeugtyp, String bezeichnung, Registrierung registrierung, double anzahlFlugstunden) {
        this.fahrzeugtyp = fahrzeugtyp;
        this.bezeichnung = bezeichnung;
        this.registrierung = registrierung;
        this.anzahlFlugstunden = anzahlFlugstunden;
    }

    @Override
    public String toString() {
        return "Fahrzeugtyp: " + getFahrzeugtyp() + "\n bezeichnung: " + getBezeichnung() + "\n registrierung: " + getRegistrierung() + "\n anzahlFlugstunden: " + getAnzahlFlugstunden() + "\n";
    }
}
