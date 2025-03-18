package DAO;

import Model.Projet;
import util.DatabaseConnection;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ProjetDAO {
    public void createProjet(Projet projet) throws SQLException {
        String sql = "INSERT INTO projects (nom, description, dateDebut, dateFin, budget) VALUES (?, ?, ?, ?, ?)";
        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, projet.getNom());
            stmt.setString(2, projet.getDescription());
            stmt.setDate(3, new java.sql.Date(projet.getDateDebut().getTime()));
            stmt.setDate(4, new java.sql.Date(projet.getDateFin().getTime()));
            stmt.setDouble(5, projet.getBudget());
            stmt.executeUpdate();
        }
    }

    public List<Projet> getAllProjets() throws SQLException {
        List<Projet> projets = new ArrayList<>();
        String sql = "SELECT * FROM projects";
        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {
            while (rs.next()) {
                Projet p = new Projet(
                        rs.getInt("id"),
                        rs.getString("nom"),
                        rs.getString("description"),
                        rs.getDate("dateDebut"),
                        rs.getDate("dateFin"),
                        rs.getDouble("budget")
                );
                projets.add(p);
            }
        }
        return projets;
    }

    public Projet getProjetById(int id) throws SQLException {
        String sql = "SELECT * FROM projects WHERE id = ?";
        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, id);
            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    return new Projet(
                            rs.getInt("id"),
                            rs.getString("nom"),
                            rs.getString("description"),
                            rs.getDate("dateDebut"),
                            rs.getDate("dateFin"),
                            rs.getDouble("budget")
                    );
                }
            }
        }
        return null;
    }

    public void updateProjet(Projet projet) throws SQLException {
        String sql = "UPDATE projects SET nom = ?, description = ?, dateDebut = ?, dateFin = ?, budget = ? WHERE id = ?";
        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, projet.getNom());
            stmt.setString(2, projet.getDescription());
            stmt.setDate(3, new java.sql.Date(projet.getDateDebut().getTime()));
            stmt.setDate(4, new java.sql.Date(projet.getDateFin().getTime()));
            stmt.setDouble(5, projet.getBudget());
            stmt.setInt(6, projet.getId());
            stmt.executeUpdate();
        }
    }


}