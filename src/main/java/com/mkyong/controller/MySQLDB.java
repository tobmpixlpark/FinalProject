package com.mkyong.controller;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class MySQLDB {
    static Connection dbConn = null;
    static PreparedStatement dbPrepareStat = null;

    public MySQLDB() {
        makeJDBCConnection();
    }


    private void makeJDBCConnection() {

        try {
            Class.forName("com.mysql.jdbc.Driver");
            log("Congrats - Seems your MySQL JDBC Driver Registered!");
        } catch (ClassNotFoundException e) {
            log("Sorry, couldn't found JDBC driver. Make sure you have added JDBC Maven Dependency Correctly");
            e.printStackTrace();
            return;
        }

        try {
            // DriverManager: The basic service for managing a set of JDBC drivers.
            dbConn = DriverManager.getConnection("jdbc:mysql://localhost:3306/login_informations", "root", "root");
            if (dbConn != null) {
                log("Connection Successful! Enjoy. Now it's time to push data");
            } else {
                log("Failed to make connection!");
            }
        } catch (SQLException e) {
            log("MySQL Connection Failed!");
            e.printStackTrace();
            return;
        }

    }

    public void addDataToDB(String vname, String zname, int mobilNummer, String passwort) {

        try {
            String insertQueryStatement = "INSERT  INTO  user  VALUES  (?,?,?,?)";

            dbPrepareStat = dbConn.prepareStatement(insertQueryStatement);

            // execute insert SQL statement
            dbPrepareStat.executeUpdate();
        } catch (

                SQLException e) {
            e.printStackTrace();
        }
    }


    // Simple log utility
    private static void log(String string) {
        System.out.println(string);

    }
}