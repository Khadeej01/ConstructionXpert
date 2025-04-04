package DAO;

import Model.Resource;
import util.DatabaseConnection;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ResourceDAO {
    public void createResource(Resource resource) throws SQLException {
        String sql = "INSERT INTO resource (nom, type, quantite, task_id) VALUES (?, ?, ?, ?)";
        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, resource.getNom());
            stmt.setString(2, resource.getType());
            stmt.setInt(3, resource.getQuantite());
            stmt.setInt(4, resource.getTaskId());
            stmt.executeUpdate();
        }
    }

    public List<Resource> getResourcesByTaskId(int taskId) throws SQLException {
        List<Resource> resources = new ArrayList<>();
        String sql = "SELECT * FROM resource WHERE task_id = ?";
        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, taskId);
            try (ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                    resources.add(new Resource(
                            rs.getInt("id"),
                            rs.getString("nom"),
                            rs.getString("type"),
                            rs.getInt("quantite"),
                            rs.getInt("task_id")
                    ));
                }
            }
        }
        return resources;
    }

    public List<Resource> getAllResources() throws SQLException {
        List<Resource> resources = new ArrayList<>();
        String sql = "SELECT * FROM resource";
        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {
            while (rs.next()) {
                resources.add(new Resource(
                        rs.getInt("id"),
                        rs.getString("nom"),
                        rs.getString("type"),
                        rs.getInt("quantite"),
                        rs.getInt("task_id")
                ));
            }
        }
        return resources;
    }

    public Resource getResourceById(int id) throws SQLException {
        String sql = "SELECT * FROM resource WHERE id = ?";
        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, id);
            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    return new Resource(
                            rs.getInt("id"),
                            rs.getString("nom"),
                            rs.getString("type"),
                            rs.getInt("quantite"),
                            rs.getInt("task_id")
                    );
                }
            }
        }
        return null;
    }
    public void updateResource(Resource resource) throws SQLException {
        String sql = "UPDATE resource SET nom = ?, type = ?, quantite = ?, task_id = ? WHERE id = ?";
        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, resource.getNom());
            stmt.setString(2, resource.getType());
            stmt.setInt(3, resource.getQuantite());
            stmt.setInt(4, resource.getTaskId());
            stmt.setInt(5, resource.getId());
            stmt.executeUpdate();
        }
    }

    public void deleteResource(int id) throws SQLException {
        String sql = "DELETE FROM resource WHERE id = ?";
        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, id);
            stmt.executeUpdate();
        }
    }
}