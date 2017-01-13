package com.ppe3_3.dao;

import static com.ppe3_3.dao.DAOUtilitaire.fermeturesSilencieuses;
import static com.ppe3_3.dao.DAOUtilitaire.initialisationRequetePreparee;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.ppe3_3.beans.Utilisateur;

public class UtilisateurDaoImpl implements UtilisateurDao {

	private static final String SQL_SELECT_PAR_EMAIL = "SELECT mailu, mdpu, pseudou, nomu, prenomu, numAdru, nomAdru, cpu, villeu, typeu FROM utilisateur WHERE mailu = ?";
	private static final String SQL_SELECT_PAR_PSEUDO = "SELECT mailu, mdpu, pseudou, nomu, prenomu, numAdru, nomAdru, cpu, villeu, typeu FROM utilisateur WHERE pseudou = ?";
	private static final String SQL_INSERT           = "INSERT INTO utilisateur (mailu, mdpu, pseudou, nomu, prenomu, numAdru, nomAdru, cpu, villeu, typeu) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

	private DAOFactory          daoFactory;

	UtilisateurDaoImpl( DAOFactory daoFactory ) {
		this.daoFactory = daoFactory;
	}

	/* Implémentation de la méthode définie dans l'interface UtilisateurDao */
	@Override
	public Utilisateur trouver( String login ) throws DAOException {
		if (login.matches( "^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}$" )) {
			return trouver( SQL_SELECT_PAR_EMAIL, login );
		}else{
			return trouver( SQL_SELECT_PAR_PSEUDO, login );
		}
	}

	/* Implémentation de la méthode définie dans l'interface UtilisateurDao */
	@Override
	public void creer( Utilisateur utilisateur ) throws DAOException {
		Connection connexion = null;
		PreparedStatement preparedStatement = null;
		ResultSet valeursAutoGenerees = null;

		try {
			connexion = daoFactory.getConnection();
			preparedStatement = initialisationRequetePreparee( connexion, SQL_INSERT, true, utilisateur.getMailU(), utilisateur.getMdpU(), utilisateur.getPseudoU(), utilisateur.getNomU(), utilisateur.getPrenomU(), utilisateur.getNumAdrU(), utilisateur.getNomAdrU(), utilisateur.getCpU(), utilisateur.getVilleU(), utilisateur.getTypeU() );
			int statut = preparedStatement.executeUpdate();
			if ( statut == 0 ) {
				throw new DAOException( "Échec de la création de l'utilisateur, aucune ligne ajoutée dans la table." );
			}
		} catch ( SQLException e ) {
			throw new DAOException( e );
		} finally {
			fermeturesSilencieuses( valeursAutoGenerees, preparedStatement, connexion );
		}
	}

    /*
     * Méthode générique utilisée pour retourner un utilisateur depuis la base
     * de données, correspondant à la requête SQL donnée prenant en paramètres
     * les objets passés en argument.
     */
    private Utilisateur trouver( String sql, Object... objets ) throws DAOException {
    	Connection connexion = null;
    	PreparedStatement preparedStatement = null;
    	ResultSet resultSet = null;
    	Utilisateur utilisateur = null;

    	try {
    		/* Récupération d'une connexion depuis la Factory */
    		connexion = daoFactory.getConnection();
            /*
             * Préparation de la requête avec les objets passés en arguments
             * (ici, uniquement une adresse email) et exécution.
             */
            preparedStatement = initialisationRequetePreparee( connexion, sql, false, objets );
            resultSet = preparedStatement.executeQuery();
            /* Parcours de la ligne de données retournée dans le ResultSet */
            if ( resultSet.next() ) {
            	utilisateur = map( resultSet );
            }
        } catch ( SQLException e ) {
        	throw new DAOException( e );
        } finally {
        	fermeturesSilencieuses( resultSet, preparedStatement, connexion );
        }

        return utilisateur;
    }

    /*
     * Simple méthode utilitaire permettant de faire la correspondance (le
     * mapping) entre une ligne issue de la table des utilisateurs (un
     * ResultSet) et un bean Utilisateur.
     */
    private static Utilisateur map( ResultSet resultSet ) throws SQLException {
    	Utilisateur utilisateur = new Utilisateur();
    	utilisateur.setMailU( resultSet.getString( "mailU" ) );
    	utilisateur.setMdpU( resultSet.getString( "mdpU" ) );
    	utilisateur.setPseudoU( resultSet.getString( "pseudoU" ) );
		utilisateur.setNomU( resultSet.getString( "nomU" ) );
		utilisateur.setPrenomU( resultSet.getString( "prenomU" ) );
		utilisateur.setNumAdrU( resultSet.getInt( "numAdrU" ) );
		utilisateur.setNomAdrU( resultSet.getString( "nomAdrU" ) );
		utilisateur.setCpU( resultSet.getInt( "cpU" ) );
		utilisateur.setVilleU( resultSet.getString( "villeU" ) );
    	utilisateur.setTypeU( resultSet.getString( "typeU" ) );
    	return utilisateur;
    }

}
