package Model;



import java.util.Date;

public class Tache {
    private int id;
    private String description;
    private Date dateDebut;
    private Date dateFin;
    private int projectId;


    public Tache() {}

    public Tache(int id, String description, Date dateDebut, Date dateFin, int projectId) {
        this.id = id;
        this.description = description;
        this.dateDebut = dateDebut;
        this.dateFin = dateFin;
        this.projectId = projectId;
    }


    public int getId() { return id; }
    public void setId(int id) { this.id = id; }
    public String getDescription() { return description; }
    public void setDescription(String description) { this.description = description; }
    public Date getDateDebut() { return dateDebut; }
    public void setDateDebut(Date dateDebut) { this.dateDebut = dateDebut; }
    public Date getDateFin() { return dateFin; }
    public void setDateFin(Date dateFin) { this.dateFin = dateFin; }
    public int getProjectId() { return projectId; }
    public void setProjectId(int projectId) { this.projectId = projectId; }

    @Override
    public String toString() {
        return "Tache{" +
                "id=" + id +
                ", description='" + description + '\'' +
                ", dateDebut=" + dateDebut +
                ", dateFin=" + dateFin +
                ", projectId=" + projectId +
                '}';
    }
}