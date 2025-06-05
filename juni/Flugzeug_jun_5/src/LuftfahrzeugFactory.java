public class LuftfahrzeugFactory {
    public static Luftfahrzeug createLuftfahrzeug(Fahrzeugtyp fahrzeugtyp) {
        //Registrierung registrierung = new Registrierung();
        switch (fahrzeugtyp) {
            case HUBSCHRAUBER -> {
                return new Hubschrauber();
            }

            case PASSAGIERFLUGZEUG -> {
                return new Passagierflugzeug();
            }

            case TRANSPORTFLUGZEUG -> {
                return new Transportflugzeug();
            }
            default -> throw new IllegalArgumentException();
        }
    }

    public static Luftfahrzeug createLuftfahrzeug(Fahrzeugtyp fahrzeugtyp, String bezeichnung, Registrierung registrierung, double anzahlFlugstunden) {
        switch (fahrzeugtyp) {
            case HUBSCHRAUBER -> {
                return new Hubschrauber(fahrzeugtyp, bezeichnung, registrierung, anzahlFlugstunden);
            }

            case PASSAGIERFLUGZEUG -> {
                return new Passagierflugzeug(fahrzeugtyp, bezeichnung, registrierung, anzahlFlugstunden);
            }

            case TRANSPORTFLUGZEUG -> {
                return new Transportflugzeug(fahrzeugtyp, bezeichnung, registrierung, anzahlFlugstunden);
            }
            default -> throw new IllegalArgumentException();
        }
    }
}
