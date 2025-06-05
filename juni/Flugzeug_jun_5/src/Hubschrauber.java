public class Hubschrauber extends Luftfahrzeug {

    private int sitzplaetze;
    private double maxTransportkapa;
    private boolean statusSeilwinde;

    public Hubschrauber(int sitzplaetze, double maxTransportkapa, boolean statusSeilwinde) {
        this.sitzplaetze = sitzplaetze;
        this.maxTransportkapa = maxTransportkapa;
        this.statusSeilwinde = statusSeilwinde;
    }
    public Hubschrauber () {

    }
    public Hubschrauber(Fahrzeugtyp fahrzeugtyp, String bezeichnung, Registrierung registrierung, double anzahlFlugstunden, int sitzplaetze, double maxTransportkapa, boolean statusSeilwinde) {
        super(fahrzeugtyp, bezeichnung, registrierung, anzahlFlugstunden);
        this.sitzplaetze = sitzplaetze;
        this.maxTransportkapa = maxTransportkapa;
        this.statusSeilwinde = statusSeilwinde;
    }
    public Hubschrauber(Fahrzeugtyp fahrzeugtyp, String bezeichnung, Registrierung registrierung, double anzahlFlugstunden) {
        super(fahrzeugtyp, bezeichnung, registrierung, anzahlFlugstunden);
    }

    public int getSitzplaetze() {
        return sitzplaetze;
    }

    public void setSitzplaetze(int sitzplaetze) {
        this.sitzplaetze = sitzplaetze;
    }

    public double getMaxTransportkapa() {
        return maxTransportkapa;
    }

    public void setMaxTransportkapa(double maxTransportkapa) {
        this.maxTransportkapa = maxTransportkapa;
    }

    public boolean isStatusSeilwinde() {
        return statusSeilwinde;
    }

    public void setStatusSeilwinde(boolean statusSeilwinde) {
        this.statusSeilwinde = statusSeilwinde;
    }

    public void seilwindeBetaetigen() {
        // statusSeilwinde = !statusSeilwinde;
        setStatusSeilwinde(!isStatusSeilwinde());
    }


    @Override
    public String toString() {
        return super.toString() + "sitzplaetze: " + getSitzplaetze() + "\n maxTransportkapa: " + getMaxTransportkapa() + "\n statusSeilwinde: " + isStatusSeilwinde() + "\n";
    }
}
