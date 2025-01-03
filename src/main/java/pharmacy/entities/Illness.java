package pharmacy.entities;

import custom.orm.db.utils.annotations.*;

@Entity(tableName = "illnesses")
public class Illness {
    @Id
    @AutoGenerated
    int id;

    String name;

    String descri;

    @Column(name = "is_chronic")
    boolean isChronic;

    public Illness(int id, String name, String descri, boolean isChronic) {
        this.id = id;
        this.name = name;
        this.descri = descri;
        this.isChronic = isChronic;
    }

    public Illness(String name, String descri, boolean isChronic) {
        this.name = name;
        this.descri = descri;
        this.isChronic = isChronic;
    }

    public Illness() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDescri() {
        return descri;
    }

    public void setDescri(String descri) {
        this.descri = descri;
    }

    public boolean getIsChronic() {
        return isChronic;
    }

    public void setChronic(boolean isChronic) {
        this.isChronic = isChronic;
    }
}