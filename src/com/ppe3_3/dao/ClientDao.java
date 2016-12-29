package com.ppe3_3.dao;

import com.ppe3_3.beans.Client;

public interface ClientDao {

	//TO-DO
    void creer( Client client ) throws DAOException;
    
    void supprimer( Client client ) throws DAOException;
    
    void modifier( Client client ) throws DAOException;
    
    void inserer( Client client ) throws DAOException;

    Client trouver( String email ) throws DAOException;

}