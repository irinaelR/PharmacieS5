package pharmacy.entities;

import custom.orm.db.utils.annotations.*;

@Entity(tableName = "measuring_units")
public class MeasuringUnit {

    @Id
    @AutoGenerated
    int id;

    String name;

    public MeasuringUnit() {
    }

    public MeasuringUnit(int id, String name) {
        this.id = id;
        this.name = name;
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
}