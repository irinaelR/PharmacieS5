package pharmacy.entities;

import custom.orm.db.utils.annotations.*;

@Entity(tableName = "lab_types")
public class LabType {

    @Id
    @AutoGenerated
    int id;

    String name;

    public LabType() {
    }

    public LabType(String name) {
        this.name = name;
    }

    public LabType(int id, String name) {
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

    @Override
    public String toString() {
        return "LabType [id=" + id + ", name=" + name + "]";
    }
}
