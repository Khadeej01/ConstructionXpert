package DAO;


import Model.Tache;
import util.DatabaseConnection;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class TacheDAO {
    public void createTache(Tache tache) throws SQLException {
        String sql = "INSERT INTO tache (description, dateDebut, dateFin, project_id) VALUES (?, ?, ?, ?)";
        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, tache.getDescription());
            stmt.setDate(2, new java.sql.Date(tache.getDateDebut().getTime()));
            stmt.setDate(3, new java.sql.Date(tache.getDateFin().getTime()));
            stmt.setInt(4, tache.getProjectId());
            stmt.executeUpdate();
        }
    }

    public List<Tache> getTachesByProjectId(int projectId) throws SQLException {
        List<Tache> taches = new ArrayList<>();
        String sql = "SELECT * FROM tache WHERE project_id = ?";
        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, projectId);
            try (ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                    taches.add(new Tache(
                            rs.getInt("id"),
                            rs.getString("description"),
                            rs.getDate("dateDebut"),
                            rs.getDate("dateFin"),
                            rs.getInt("project_id")
                    ));
                }
            }
        }
        return taches;
    }

    public List<Tache> getAllTaches() throws SQLException {
        List<Tache> taches = new ArrayList<>();
        String sql = "SELECT * FROM tache";
        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {
            while (rs.next()) {
                taches.add(new Tache(
                        rs.getInt("id"),
                        rs.getString("description"),
                        rs.getDate("dateDebut"),
                        rs.getDate("dateFin"),
                        rs.getInt("project_id")
                ));
            }
        }
        return taches;
    }
}