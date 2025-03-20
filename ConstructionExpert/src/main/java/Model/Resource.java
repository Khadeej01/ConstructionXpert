package Model;

public class Resource {
    private int id;
    private String nom;
    private String type;
    private int quantite;
    private int taskId;

    // Constructeurs
    public Resource() {}

    public Resource(int id, String nom, String type, int quantite, int taskId) {
        this.id = id;
        this.nom = nom;
        this.type = type;
        this.quantite = quantite;
        this.taskId = taskId;
    }

    // Getters et setters
    public int getId() { return id; }
    public void setId(int id) { this.id = id; }
    public String getNom() { return nom; }
    public void setNom(String nom) { this.nom = nom; }
    public String getType() { return type; }
    public void setType(String type) { this.type = type; }
    public int getQuantite() { return quantite; }
    public void setQuantite(int quantite) { this.quantite = quantite; }
    public int getTaskId() { return taskId; }
    public void setTaskId(int taskId) { this.taskId = taskId; }

    @Override
    public String toString() {
        return "Resource{" +
                "id=" + id +
                ", nom='" + nom + '\'' +
                ", type='" + type + '\'' +
                ", quantite=" + quantite +
                ", taskId=" + taskId +
                '}';
    }
}